import socket 
import struct 
import pickle
import cv2 
from imutils import face_utils
import dlib
from combine_euler import HeadPoseChangeCounter, get_Euler
from combineForUI import FrameFeatures, get_rotation_angle
from combine_Spaceout import get_SpaceOut
from combine_Eye import get_Blink
from combine_MAR import get_MAR


# 서버 ip 주소 및 port 번호(mac local ip)
ip = '127.0.0.1'
port = 9999

# 소켓 객체 생성
server_socket = socket.socket(socket.AF_INET,socket.SOCK_STREAM)
server_socket.setsockopt(socket.SOL_SOCKET, socket.SO_REUSEADDR, 1)

# 소켓 주소 정보 할당
server_socket.bind((ip, port))

# 연결 리스닝(동시 접속) 수 설정
server_socket.listen(1) 

print('클라이언트 연결 대기')

# 연결 수락(클라이언트 (소켓, 주소 정보) 반환)
client_socket, address = server_socket.accept()
print('클라이언트 ip 주소 :', address[0])

# 수신한 데이터를 넣을 버퍼(바이트 객체)
data_buffer = b""

# calcsize : 데이터의 크기(byte)
# - L : 부호없는 긴 정수(unsigned long) 4 bytes
# >L : 4 바이트 이상
data_size = struct.calcsize(">L")

def recvall(sock, n):
    data = b''

    while len(data) < n:
        try:
            packet = sock.recv(n - len(data))
        except:
            return None
        data += packet
    return data

# 얼굴 집중도 분석

# 랜드마크 예측기 경로 설정
PREDICTOR_PATH = "./shape_predictor_68_face_landmarks.dat"
# 랜드마크 예측기 로드
predictor = dlib.shape_predictor(PREDICTOR_PATH)
# 얼굴 감지기 로드
detector = dlib.get_frontal_face_detector()
# 얼굴 기울기(yaw,pitch,roll)을 위한 객체 초기화
counter = HeadPoseChangeCounter()

# 첫 step size에서 변수를 저장할 객체 초기화
frame_objects = [FrameFeatures(0)]
# 얼굴 기울기(yaw,pitch,roll)을 위한 객체 초기화
head_pose_counter = HeadPoseChangeCounter()
frame_counter = 0

feature_order = ["blinks", "close_eye_frame", "yawns", "space_out", "angle_avg",
                    "face_detection_percentage", "head_turn_counts_yaw", "head_turn_counts_pitch",
                    "head_turn_counts_roll", "forward_yaw_frame", "forward_pitch_frame", "forward_roll_frame"]

# Random forest 모델 로드
with open("./random_forest_model_0.81.pkl", "rb") as file:
    rf_model = pickle.load(file)

while True:
    # 데이터 수신
    packed_data_size = recvall(client_socket, data_size)

    if not packed_data_size:
        print("Connection closed by client.")
        break
    if len(packed_data_size) != data_size:
        print("Received incorrect frame size data. Expected {} bytes, but received {} bytes.".format(data_size, len(packed_data_size)))
        break

    if not packed_data_size:
        break
    # print("Length of packed_data_size:", len(packed_data_size))
    
    # struct.unpack : 변환된 바이트 객체를 원래의 데이터로 반환
    # - > : 빅 엔디안(big endian)
    #   - 엔디안(endian) : 컴퓨터의 메모리와 같은 1차원의 공간에 여러 개의 연속된 대상을 배열하는 방법
    #   - 빅 엔디안(big endian) : 최상위 바이트부터 차례대로 저장
    # - L : 부호없는 긴 정수(unsigned long) 4 bytes 
    # 프레임 수신
    frame_size = struct.unpack(">L", packed_data_size)[0]
    frame_data = recvall(client_socket, frame_size)
    
    if not frame_data:
        break
    
    # loads : 직렬화된 데이터를 역직렬화
    # - 역직렬화(de-serialization) : 직렬화된 파일이나 바이트 객체를 원래의 데이터로 복원하는 것
    frame = pickle.loads(frame_data)
    
    # imdecode : 이미지(프레임) 디코딩
    # 1) 인코딩된 이미지 배열
    # 2) 이미지 파일을 읽을 때의 옵션
    #    - IMREAD_COLOR : 이미지를 COLOR로 읽음
    frame = cv2.imdecode(frame, cv2.IMREAD_COLOR)
    
    # 영상 resize
    desired_height = 300
    aspect_ratio = float(frame.shape[0]) / float(frame.shape[1])
    desired_width = int(desired_height / aspect_ratio)
    frame = cv2.resize(frame, (desired_width, desired_height))

    # 각 객체의 frame 수 업데이트
    for frame_obj in frame_objects:
        frame_obj.update_feature("total_frames")

    # 회색조로 변환 (랜드마크 검출을 위함)
    gray = cv2.cvtColor(frame, cv2.COLOR_BGR2GRAY)
    # 얼굴 검출
    rects = detector(gray, 0)

    # 얼굴 탐지 성공하면 업데이트
    if len(rects) > 0:
        for frame_obj in frame_objects:
            frame_obj.update_feature("face_detected_frames")

    for rect in rects:
        # 랜드마크 검출
        shape = predictor(gray, rect)
        # Head-pose 구하기
        change_count_yaw, change_count_pitch, change_count_roll, forward_yaw_frame, forward_pitch_frame, forward_roll_frame = get_Euler(frame, shape, counter)
        
        # HeadPose가 바뀌거나, 가운데를 보면 업데이트
        if change_count_yaw:
            for frame_obj in frame_objects:
                frame_obj.update_feature("change_count_yaw")
        elif change_count_pitch:
            for frame_obj in frame_objects:
                frame_obj.update_feature("change_count_pitch")
        elif change_count_roll:
            for frame_obj in frame_objects:
                frame_obj.update_feature("change_count_roll")
        if forward_yaw_frame:
            for frame_obj in frame_objects:
                frame_obj.update_feature("forward_yaw_frame")
        if forward_pitch_frame:
            for frame_obj in frame_objects:
                frame_obj.update_feature("forward_pitch_frame")
        if forward_roll_frame:
            for frame_obj in frame_objects:
                frame_obj.update_feature("forward_roll_frame")


        # 멍때림 판단
        space_out = get_SpaceOut(frame)
        # 멍때림이 판단되면 현재있는 모든 객체에 업데이트
        if space_out:
            for frame_obj in frame_objects:
                frame_obj.update_feature("space_out")

        # 계산을 위해 numpy로
        shape = face_utils.shape_to_np(shape)
        
        # 눈 감았는지 판단
        close_eye, total_blink = get_Blink(frame, rect, shape)

        # 눈 감은 frame 수 업데이트
        if close_eye == True:
            for frame_obj in frame_objects:
                frame_obj.update_feature("close_eye_frame")
        
        # 눈 감은 횟수 업데이트
        if total_blink == True:
            for frame_obj in frame_objects:
                frame_obj.update_feature("blinks")

        # 얼굴 기울기 계산
        angle = get_rotation_angle(shape)

        # 얼굴 기울기 업데이트
        for frame_obj in frame_objects:
            frame_obj.update_feature("angle_values", abs(angle))

        # 하품 판단
        yawns = get_MAR(frame, shape)
        # 하품 업데이트
        if yawns:
            for frame_obj in frame_objects:
                frame_obj.update_feature("yawns")

        frame_counter += 1

        # step size = 300마다 새로운 특징 변수값을 저장할 객체 생성.
        if frame_counter % 300 == 0:
            frame_objects.append(FrameFeatures(frame_counter))
        # 각 객체에서 2000frame이 되면 모델 예측.
        for frame_obj in frame_objects:
            if frame_obj.total_frames == 2000:
                rounded_angle_avg = round(sum(frame_obj.angle_values) / len(frame_obj.angle_values), 2) if len(frame_obj.angle_values) > 0 else 0
                rounded_frame_avg = round(frame_obj.face_detected_frames / frame_obj.total_frames * 100) if frame_obj.total_frames > 0 else 0

                frame_yaw_avg = round(frame_obj.forward_yaw_frame / frame_obj.total_frames * 100) if frame_obj.total_frames > 0 else 0
                frame_pitch_avg = round(frame_obj.forward_pitch_frame / frame_obj.total_frames * 100) if frame_obj.total_frames > 0 else 0
                frame_roll_avg = round(frame_obj.forward_roll_frame / frame_obj.total_frames * 100) if frame_obj.total_frames > 0 else 0

                results = {
                    "blinks": frame_obj.blinks,
                    "close_eye_frame": frame_obj.close_eye_frame,
                    "yawns": frame_obj.yawns,
                    "space_out": frame_obj.space_out,
                    "angle_avg": rounded_angle_avg,
                    "face_detection_percentage": rounded_frame_avg,
                    "head_turn_counts_yaw" : frame_obj.change_count_yaw,
                    "head_turn_counts_pitch" : frame_obj.change_count_pitch,
                    "head_turn_counts_roll" : frame_obj.change_count_roll,
                    "forward_yaw_frame" : frame_yaw_avg,
                    "forward_pitch_frame" : frame_pitch_avg,
                    "forward_roll_frame" : frame_roll_avg,
                }

                # 모델 예측값
                features_array = [results[feature] for feature in feature_order]
                prediction_proba = rf_model.predict_proba([features_array])
                print(prediction_proba)

                serialized_data = pickle.dumps(prediction_proba)  # 결과 객체를 직렬화
                client_socket.sendall(struct.pack(">L", len(serialized_data)) + serialized_data)

                focus_prob = prediction_proba[0][0]
                focus_prob *= 100
                results["focus_prob"] = focus_prob
                
                frame_objects.remove(frame_obj)    

    # 프레임 출력
    cv2.imshow('Frame', frame)
    
    # 'q' 키를 입력하면 종료
    key = cv2.waitKey(1) & 0xFF
    if key == ord("q"):
        break

# 소켓 닫기
client_socket.close()
server_socket.close()
print('연결 종료')

# 모든 창 닫기
cv2.destroyAllWindows()