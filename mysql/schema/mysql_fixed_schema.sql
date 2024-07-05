CREATE TABLE tour_place_tb(
tour_id VARCHAR(20) NOT NULL,
place_id VARCHAR(20) NOT NULL,
order_idx INT
) COLLATE utf8_bin ;

CREATE TABLE popular_keyword_tb(
seq_no INT NOT NULL,
place_id VARCHAR(20),
create_id VARCHAR(20),
create_dt DATETIME,
city_cd VARCHAR(2) DEFAULT 'JJ',
`language` VARCHAR(2) DEFAULT 'ko'
) COLLATE utf8_bin ;

CREATE TABLE plan_notice_tb(
plan_id VARCHAR(20) NOT NULL,
seq_no INT NOT NULL,
title VARCHAR(1000),
contents VARCHAR(4000),
create_id VARCHAR(20),
create_dt DATETIME,
update_id VARCHAR(20),
update_dt DATETIME
) COLLATE utf8_bin ;

CREATE TABLE rentcar_tb(
id CHAR(20) NOT NULL,
`name` VARCHAR(100),
doro VARCHAR(100),
jibun VARCHAR(100),
lat double,
lng double,
tel VARCHAR(50)
) COLLATE utf8_bin ;

CREATE TABLE post_content_tb(
post_id CHAR(20) NOT NULL,
contents_type smallint NOT NULL,
contents VARCHAR(5000) NOT NULL,
contents_eng VARCHAR(5000) DEFAULT '',
seq smallint NOT NULL,
start_date VARCHAR(10) DEFAULT '',
end_date VARCHAR(10) DEFAULT ''
) COLLATE utf8_bin ;

CREATE TABLE location_info_tb(
location_id VARCHAR(20) NOT NULL,
address VARCHAR(1000),
latitude double,
longitude double,
create_dt DATETIME
) COLLATE utf8_bin ;

CREATE TABLE post_tb(
post_id VARCHAR(20) NOT NULL,
place_id VARCHAR(20),
rpsnt_image_url VARCHAR(1000),
banner_image_url VARCHAR(1000),
title VARCHAR(1000),
sub_title VARCHAR(1000),
contents LONGTEXT,
author VARCHAR(100),
course VARCHAR(1000),
relation_place_id1 VARCHAR(20),
relation_place_id2 VARCHAR(20),
relation_place_id3 VARCHAR(20),
interviewee_id VARCHAR(20),
coupon_id1 VARCHAR(36),
coupon_id2 VARCHAR(36),
coupon_id3 VARCHAR(36),
event_id VARCHAR(20),
hit_cnt INT DEFAULT 0,
share_cnt INT DEFAULT 0,
favorite_cnt INT DEFAULT 0,
cabinet_cnt INT DEFAULT 0,
plan_cnt INT DEFAULT 0,
state CHAR(1),
create_id VARCHAR(20),
create_dt DATETIME,
update_id VARCHAR(20),
update_dt DATETIME,
add_point INT,
contents_char_cnt INT,
title_eng VARCHAR(1000) DEFAULT '',
contents_eng LONGTEXT,
upload_dt DATETIME
) COLLATE utf8_bin ;

CREATE TABLE ai_qa_tb(
customer_id CHAR(20) NOT NULL,
question VARCHAR(1000) NOT NULL,
`day` VARCHAR(2),
answer VARCHAR(5000) NOT NULL,
parsed VARCHAR(5000) NOT NULL,
duration VARCHAR(10) NOT NULL,
create_dt DATETIME NOT NULL
) COLLATE utf8_bin ;

CREATE TABLE map_equipment_tb(
equip_type VARCHAR(10) NOT NULL,
equip_seq_no INT NOT NULL,
equip_name VARCHAR(100),
equip_phone VARCHAR(20),
equip_addr VARCHAR(400),
equip_lat double,
equip_lng double,
equip_mng_name VARCHAR(100),
equip_rest_type VARCHAR(10),
equip_rest_mark CHAR(1),
equip_station_id VARCHAR(10),
create_id VARCHAR(20),
create_dt DATETIME,
update_id VARCHAR(20),
update_dt DATETIME,
equip_name_eng VARCHAR(100),
equip_addr_eng VARCHAR(400),
equip_mng_name_eng VARCHAR(100),
equip_rest_type_eng VARCHAR(100)
) COLLATE utf8_bin ;

CREATE TABLE plan_day_schedule_tb(
plan_id VARCHAR(20) NOT NULL,
plan_seq_no INT NOT NULL,
plan_date date,
schedule_seq_no INT NOT NULL,
gubun VARCHAR(10),
place_id VARCHAR(20),
post_id VARCHAR(20),
spot_id VARCHAR(20),
state CHAR(1),
sort_order INT,
schedule_complete_yn CHAR(1) DEFAULT 'N',
city_cd VARCHAR(2) DEFAULT 'JJ'
) COLLATE utf8_bin ;

CREATE TABLE ta_black_section_path_tb(
seq_no INT NOT NULL,
sort_order INT NOT NULL,
path_lat double,
path_lng double
) COLLATE utf8_bin ;

CREATE TABLE tour_tb(
tour_id VARCHAR(20) NOT NULL,
company_name VARCHAR(100),
tour_name VARCHAR(200),
url VARCHAR(100)
) COLLATE utf8_bin ;

CREATE TABLE ai_count_tb(
customer_id CHAR(20) NOT NULL,
question VARCHAR(1000) NOT NULL,
`day` VARCHAR(2),
create_dt DATETIME NOT NULL
) COLLATE utf8_bin ;

CREATE TABLE area_rise_set_tb(
location VARCHAR(50) NOT NULL,
loc_date VARCHAR(8) NOT NULL,
sunrise VARCHAR(4),
sunset VARCHAR(4),
update_dt DATETIME
) COLLATE utf8_bin ;

CREATE TABLE ta_black_section_tb(
seq_no INT NOT NULL,
section_nm VARCHAR(1000),
accident_lat double,
accident_lng double,
accident_history VARCHAR(100),
section_nm_eng VARCHAR(1000)
) COLLATE utf8_bin ;

CREATE TABLE hotel_tb(
id CHAR(20) NOT NULL,
`name` VARCHAR(100),
detail_name VARCHAR(50),
jibun VARCHAR(100),
doro VARCHAR(100),
lat double NOT NULL,
lng double NOT NULL,
tel VARCHAR(50)
) COLLATE utf8_bin ;

CREATE TABLE global_weather_tb(
city_id VARCHAR(7) NOT NULL,
date_time DATETIME NOT NULL,
temp double,
temp_min double,
temp_max double,
feels_like double,
pressure INT,
sea_level INT,
grnd_level INT,
humidity INT,
weather_id INT,
weather_main VARCHAR(100),
weather_desc VARCHAR(100),
weather_icon VARCHAR(10),
cloud_all INT,
wind_speed double,
wind_deg INT,
wind_gust double,
visibility INT,
pop INT,
rain_3h double,
snow_3h double,
sys_pod CHAR(1),
sun_rise CHAR(4),
sun_set CHAR(4),
update_date DATETIME
) COLLATE utf8_bin ;

CREATE TABLE local_brand_post_content_tb(
post_id CHAR(20) NOT NULL,
contents_type smallint NOT NULL,
contents VARCHAR(5000) NOT NULL,
contents_eng VARCHAR(5000) DEFAULT '',
seq smallint NOT NULL,
start_date VARCHAR(10) DEFAULT '',
end_date VARCHAR(10) DEFAULT ''
) COLLATE utf8_bin ;

CREATE TABLE plan_day_tb(
plan_id VARCHAR(20) NOT NULL,
plan_seq_no INT NOT NULL,
plan_date date
) COLLATE utf8_bin ;

CREATE TABLE season_need_contents_rate_tb(
season_cd VARCHAR(10) NOT NULL,
low_rate INT,
high_rate INT,
create_id VARCHAR(100),
create_dt DATETIME,
update_id VARCHAR(100),
update_dt DATETIME
) COLLATE utf8_bin ;

CREATE TABLE interviewee_link_tb(
link_id VARCHAR(100) NOT NULL,
seq_no INT NOT NULL,
interviewee_id VARCHAR(100)
) COLLATE utf8_bin ;

CREATE TABLE category_post_tb(
category_cd VARCHAR(9) NOT NULL,
seq_no INT NOT NULL,
post_id VARCHAR(20),
create_id VARCHAR(100),
create_dt DATETIME,
rpsnt_image_url VARCHAR(1000),
city_cd VARCHAR(2) DEFAULT 'JJ'
) COLLATE utf8_bin ;

CREATE TABLE local_brand_grade_tb(
place_id VARCHAR(20) NOT NULL,
grade_cd VARCHAR(20),
start_dt date,
end_dt date,
create_id VARCHAR(100),
create_dt DATETIME,
update_id VARCHAR(100),
update_dt DATETIME,
memo VARCHAR(1000),
special_term VARCHAR(1000),
funnels VARCHAR(1000),
city_cd VARCHAR(2) DEFAULT 'JJ'
) COLLATE utf8_bin ;

CREATE TABLE course_day_tb(
course_id VARCHAR(20) NOT NULL,
plan_seq_no INT NOT NULL,
plan_date date
) COLLATE utf8_bin ;

CREATE TABLE keyword_place_tb(
seq_no bigint NOT NULL,
keyword_id VARCHAR(20),
place_id VARCHAR(20),
create_id VARCHAR(100),
create_dt DATETIME,
gubun VARCHAR(20) DEFAULT 'PLACE'
) COLLATE utf8_bin ;

CREATE TABLE tour_date_tb(
tour_id VARCHAR(20) NOT NULL,
tour_date date NOT NULL,
tour_code VARCHAR(100)
) COLLATE utf8_bin ;

CREATE TABLE place99_tb(
start_id VARCHAR(20) NOT NULL,
end_id VARCHAR(20) NOT NULL,
start_nm VARCHAR(1000),
end_nm VARCHAR(1000),
start_lat double,
end_lat double,
start_long double,
end_long double,
distance double,
arrive_time INT,
`cost` INT
) COLLATE utf8_bin ;

CREATE TABLE keyword_tb(
keyword_id VARCHAR(20) NOT NULL,
keyword_nm VARCHAR(100),
state CHAR(1),
create_id VARCHAR(100),
create_dt DATETIME,
update_id VARCHAR(100),
update_dt DATETIME,
city_cd VARCHAR(2) DEFAULT 'JJ',
keyword_nm_eng VARCHAR(100) DEFAULT ''
) COLLATE utf8_bin ;

CREATE TABLE interviewee_tb(
interviewee_id VARCHAR(100) NOT NULL,
kor_nm VARCHAR(100),
eng_nm VARCHAR(100),
interviewee_desc VARCHAR(4000),
interviewee_corp VARCHAR(100),
interviewee_position VARCHAR(100),
link_cd VARCHAR(9),
link_url VARCHAR(1000),
rpsnt_image_url VARCHAR(1000),
create_id VARCHAR(100),
create_dt DATETIME,
update_id VARCHAR(100),
update_dt DATETIME,
state CHAR(1),
city_cd VARCHAR(2) DEFAULT 'JJ',
interviewee_desc_eng VARCHAR(4000),
interviewee_corp_eng VARCHAR(200),
interviewee_position_eng VARCHAR(100)
) COLLATE utf8_bin ;

CREATE TABLE map_medical_tb(
medi_type VARCHAR(10) NOT NULL,
medi_seq_no INT NOT NULL,
medi_name VARCHAR(100),
medi_phone VARCHAR(20),
medi_addr VARCHAR(400),
medi_lat double,
medi_lng double,
medi_weekday VARCHAR(20),
medi_saturday VARCHAR(20),
medi_sunday VARCHAR(20),
medi_holiday VARCHAR(20),
medi_emergency CHAR(1),
create_id VARCHAR(20),
create_dt DATETIME,
update_id VARCHAR(20),
update_dt DATETIME,
medi_name_eng VARCHAR(100),
medi_addr_eng VARCHAR(400)
) COLLATE utf8_bin ;

CREATE TABLE local_brand_post_tb(
post_id VARCHAR(20) NOT NULL,
place_id VARCHAR(20),
rpsnt_image_url VARCHAR(1000),
banner_image_url VARCHAR(1000),
title VARCHAR(1000),
sub_title VARCHAR(1000) DEFAULT '',
contents LONGTEXT,
relation_place_id1 VARCHAR(20),
relation_place_id2 VARCHAR(20),
relation_place_id3 VARCHAR(20),
hit_cnt INT DEFAULT 0,
share_cnt INT DEFAULT 0,
favorite_cnt INT DEFAULT 0,
cabinet_cnt INT DEFAULT 0,
plan_cnt INT DEFAULT 0,
state CHAR(1),
create_id VARCHAR(20),
create_dt DATETIME,
update_id VARCHAR(20),
update_dt DATETIME,
add_point INT,
interviewee_id VARCHAR(20),
contents_char_cnt INT,
title_eng VARCHAR(1000) DEFAULT '',
contents_eng LONGTEXT,
sub_title_eng VARCHAR(1000) DEFAULT '',
upload_dt DATETIME
) COLLATE utf8_bin ;

CREATE TABLE customer_tb(
customer_id VARCHAR(20) NOT NULL,
nickname VARCHAR(1000),
email VARCHAR(1000),
gender CHAR(1),
birthyear VARCHAR(4),
thumbnail_image VARCHAR(1000),
profile_image VARCHAR(1000),
agree_push CHAR(1),
join_method CHAR(1),
sns_id VARCHAR(100),
join_dt DATETIME,
loc_lat double,
loc_lng double,
loc_update_dt DATETIME,
device_token VARCHAR(255),
state CHAR(1),
grade VARCHAR(10),
location_yn CHAR(1),
marketing_yn CHAR(1),
version_app VARCHAR(20),
plan_point INT,
login_dt DATETIME,
email_pwd VARCHAR(1000),
withdrawal_dt DATETIME,
withdrawal_reason VARCHAR(10),
auth_key VARCHAR(10),
temp_pwd_yn CHAR(1),
agent VARCHAR(7),
alarm_seq_no INT DEFAULT 0
) COLLATE utf8_bin ;

CREATE TABLE course_tb(
course_id VARCHAR(20) NOT NULL,
rpsnt_image_url VARCHAR(1000),
title VARCHAR(1000),
plan_start_date date,
plan_end_date date,
companion_type_cd INT,
course_category VARCHAR(9),
state CHAR(1),
hit_cnt INT DEFAULT 0,
share_cnt INT DEFAULT 0,
favorite_cnt INT DEFAULT 0,
cabinet_cnt INT DEFAULT 0,
plan_cnt INT DEFAULT 0,
plan_id VARCHAR(20),
create_id VARCHAR(20),
create_dt DATETIME,
update_id VARCHAR(20),
update_dt DATETIME,
add_point INT,
city_cd VARCHAR(2) DEFAULT 'JJ',
title_eng VARCHAR(1000) DEFAULT '',
`desc` VARCHAR(1000) DEFAULT '',
desc_eng VARCHAR(1000) DEFAULT ''
) COLLATE utf8_bin ;

CREATE TABLE mid_land_fcst(
fcst_date VARCHAR(8) NOT NULL,
reg_id VARCHAR(8) NOT NULL,
rn_st_am INT,
rn_st_pm INT,
rn_st INT,
wf_am VARCHAR(100),
wf_pm VARCHAR(100),
wf VARCHAR(100),
update_dt DATETIME
) COLLATE utf8_bin ;

CREATE TABLE plan_member_tb(
plan_id VARCHAR(20) NOT NULL,
seq_no INT NOT NULL,
customer_id VARCHAR(20),
plan_join_dt DATETIME,
plan_leave_dt DATETIME,
auth CHAR(1)
) COLLATE utf8_bin ;

CREATE TABLE image_info_tb(
image_id VARCHAR(20) NOT NULL,
seq_no INT NOT NULL,
image_url VARCHAR(1000) NOT NULL,
original_file_nm VARCHAR(255),
alias_file_nm VARCHAR(255)
) COLLATE utf8_bin ;

CREATE TABLE place03_tb(
place_id VARCHAR(20) NOT NULL,
homepage VARCHAR(100),
phone VARCHAR(14),
facebook VARCHAR(100),
instagram VARCHAR(100),
airbnb VARCHAR(100),
image_id VARCHAR(20)
) COLLATE utf8_bin ;

CREATE TABLE tide_obs_pre_tab(
obs_code VARCHAR(7) NOT NULL,
tph_date VARCHAR(8) NOT NULL,
seq_no INT NOT NULL,
tph_time VARCHAR(4),
hl_code VARCHAR(10),
update_dt DATETIME
) COLLATE utf8_bin ;

CREATE TABLE ma_black_spot_tb(
seq_no INT NOT NULL,
place_nm VARCHAR(100),
addr VARCHAR(1000),
accident_cnt INT,
accident_reason VARCHAR(1000),
accident_lat double,
accident_lng double,
place_nm_eng VARCHAR(100),
addr_eng VARCHAR(1000),
accident_reason_eng VARCHAR(1000)
) COLLATE utf8_bin ;

CREATE TABLE village_fcst(
fcst_date VARCHAR(8) NOT NULL,
fcst_time VARCHAR(4) NOT NULL,
category VARCHAR(3) NOT NULL,
nx INT NOT NULL,
ny INT NOT NULL,
fcst_value VARCHAR(20),
base_date VARCHAR(8),
base_time VARCHAR(4),
update_dt DATETIME
) COLLATE utf8_bin ;

CREATE TABLE place04_tb(
place_id VARCHAR(20) NOT NULL,
seq_no INT NOT NULL,
gubun CHAR(1),
key_name VARCHAR(100) DEFAULT '',
key_value VARCHAR(1000) DEFAULT '',
key_name_eng VARCHAR(100) DEFAULT '',
key_value_eng VARCHAR(1000) DEFAULT ''
) COLLATE utf8_bin ;

CREATE TABLE place02_tb(
place_id VARCHAR(20) NOT NULL,
seq_no INT NOT NULL,
large_category_cd VARCHAR(9),
small_category_cd VARCHAR(9)
) COLLATE utf8_bin ;

CREATE TABLE post_dt_tb(
gubun CHAR(1) NOT NULL,
category_cd VARCHAR(9),
post_id VARCHAR(20),
create_dt DATETIME
) COLLATE utf8_bin ;

CREATE TABLE local_brand_grade_history_tb(
seq_no bigint NOT NULL,
place_id VARCHAR(20),
grade_cd VARCHAR(20),
start_dt date,
end_dt date,
create_id VARCHAR(100),
create_dt DATETIME,
memo VARCHAR(1000),
special_term VARCHAR(1000),
funnels VARCHAR(1000),
state CHAR(1)
) COLLATE utf8_bin ;

CREATE TABLE ultra_srt_fcst(
fcst_date VARCHAR(8) NOT NULL,
fcst_time VARCHAR(4) NOT NULL,
category VARCHAR(3) NOT NULL,
nx INT NOT NULL,
ny INT NOT NULL,
fcst_value VARCHAR(20),
base_date VARCHAR(8),
base_time VARCHAR(4),
update_dt DATETIME
) COLLATE utf8_bin ;

CREATE TABLE local_brand_fac_info_tb(
place_id VARCHAR(20) NOT NULL,
seq_no INT NOT NULL,
gubun CHAR(1),
key_name VARCHAR(100) DEFAULT '',
key_value VARCHAR(1000) DEFAULT '',
key_name_eng VARCHAR(100) DEFAULT '',
key_value_eng VARCHAR(1000) DEFAULT ''
) COLLATE utf8_bin ;

CREATE TABLE uv_idx_tb(
area_code VARCHAR(10) NOT NULL,
fcst_date VARCHAR(8) NOT NULL,
uv_idx VARCHAR(3),
update_dt DATETIME
) COLLATE utf8_bin ;

CREATE TABLE local_brand_place_tb(
place_id VARCHAR(20) NOT NULL,
place_nm VARCHAR(1000),
rpsnt_image_url VARCHAR(1000),
banner_image_url VARCHAR(1000),
image_id VARCHAR(20),
place_outline VARCHAR(1000),
place_desc VARCHAR(4000),
companion_type_cd INT,
place_loct_cd1 VARCHAR(9),
place_loct_cd2 VARCHAR(9),
place_sgng_cd VARCHAR(100),
place_umd_cd VARCHAR(100),
place_addr VARCHAR(1000),
place_lat double,
place_lng double,
hit_cnt INT DEFAULT 0,
share_cnt INT DEFAULT 0,
favorite_cnt INT DEFAULT 0,
cabinet_cnt INT DEFAULT 0,
plan_cnt INT DEFAULT 0,
state CHAR(1),
create_id VARCHAR(100),
create_dt DATETIME,
update_id VARCHAR(100),
update_dt DATETIME,
kma_sigungu_code VARCHAR(10),
kma_eubmyundong_code VARCHAR(10),
kma_nx INT,
kma_ny INT,
add_point INT,
small_category_cd VARCHAR(9),
lead_time INT,
decision_radius double,
map_scope double,
phone VARCHAR(14),
homepage VARCHAR(100),
instagram VARCHAR(100),
facebook VARCHAR(100),
airbnb VARCHAR(100),
open_time VARCHAR(10),
close_time VARCHAR(10),
break_time VARCHAR(100) DEFAULT '',
capacity VARCHAR(100),
parking_area VARCHAR(100),
price VARCHAR(100),
memo VARCHAR(100),
fac_image_id VARCHAR(20),
spring_post_yn CHAR(1),
summer_post_yn CHAR(1),
autumn_post_yn CHAR(1),
winter_post_yn CHAR(1),
city_cd VARCHAR(2) DEFAULT 'JJ',
title_eng VARCHAR(1000) DEFAULT '',
title_nm_eng VARCHAR(1000) DEFAULT '',
place_nm_eng VARCHAR(1000) DEFAULT '',
place_addr_eng VARCHAR(1000) DEFAULT '',
place_outline_eng VARCHAR(1000) DEFAULT '',
place_desc_eng VARCHAR(4000) DEFAULT '',
break_time_eng VARCHAR(100) DEFAULT '',
place_sgng_cd_eng VARCHAR(200),
place_umd_cd_eng VARCHAR(200),
inside_yn CHAR(1),
outside_yn CHAR(1),
public_yn CHAR(1),
barrier_free_yn CHAR(1),
one_point_yn CHAR(1)
) COLLATE utf8_bin ;

CREATE TABLE plan_tb(
plan_id VARCHAR(20) NOT NULL,
rpsnt_image_url VARCHAR(1000),
title VARCHAR(1000),
plan_start_date date,
plan_end_date date,
state VARCHAR(1),
create_id VARCHAR(20),
create_dt DATETIME,
update_id VARCHAR(20),
update_dt DATETIME,
companion_type_cd VARCHAR(9),
course_id VARCHAR(20),
approval_state CHAR(1),
enable_share CHAR(1),
city_cd VARCHAR(2) DEFAULT 'JJ'
) COLLATE utf8_bin ;

CREATE TABLE place01_tb(
place_id VARCHAR(20) NOT NULL,
place_nm VARCHAR(1000),
rpsnt_image_url VARCHAR(1000),
place_outline VARCHAR(1000),
place_desc VARCHAR(4000),
companion_type_cd INT,
place_loct_cd1 VARCHAR(9),
place_loct_cd2 VARCHAR(9),
place_sgng_cd VARCHAR(100),
place_umd_cd VARCHAR(100),
place_addr VARCHAR(1000),
place_lat double,
place_lng double,
lead_time INT,
decision_radius double,
map_scope double,
hit_cnt INT DEFAULT 0,
share_cnt INT DEFAULT 0,
favorite_cnt INT DEFAULT 0,
cabinet_cnt INT DEFAULT 0,
plan_cnt INT DEFAULT 0,
state CHAR(1),
create_id VARCHAR(100),
create_dt DATETIME,
update_id VARCHAR(100),
update_dt DATETIME,
kma_sigungu_code VARCHAR(10),
kma_eubmyundong_code VARCHAR(10),
kma_nx INT,
kma_ny INT,
add_point INT,
spring_post_yn CHAR(1),
summer_post_yn CHAR(1),
autumn_post_yn CHAR(1),
winter_post_yn CHAR(1),
city_cd VARCHAR(2) DEFAULT 'JJ',
place_nm_eng VARCHAR(1000) DEFAULT '',
place_addr_eng VARCHAR(1000) DEFAULT '',
place_outline_eng VARCHAR(1000) DEFAULT '',
place_desc_eng VARCHAR(4000) DEFAULT '',
place_sgng_cd_eng VARCHAR(200),
place_umd_cd_eng VARCHAR(200),
inside_yn CHAR(1),
outside_yn CHAR(1),
public_yn CHAR(1),
barrier_free_yn CHAR(1),
one_point_yn CHAR(1)
) COLLATE utf8_bin ;

CREATE TABLE ba_black_spot_tb(
seq_no INT NOT NULL,
addr VARCHAR(1000),
accident_reason VARCHAR(1000),
accident_lat double,
accident_lng double,
addr_eng VARCHAR(1000),
accident_reason_eng VARCHAR(1000)
) COLLATE utf8_bin ;

CREATE TABLE home_post_tb(
seq_no INT NOT NULL,
gubun VARCHAR(20),
post_id VARCHAR(36),
post_desc VARCHAR(1000),
create_id VARCHAR(50),
create_dt DATETIME,
rpsnt_image_url VARCHAR(1000),
city_cd VARCHAR(2) DEFAULT 'JJ',
`language` VARCHAR(2) DEFAULT 'ko'
) COLLATE utf8_bin ;

CREATE TABLE place_visit_cnt_tb(
place_id CHAR(20) NOT NULL,
place_nm VARCHAR(100) NOT NULL,
place_nm_1 VARCHAR(100) NOT NULL,
place_nm_2 VARCHAR(100),
place_nm_3 VARCHAR(100),
place_nm_4 VARCHAR(100),
place_nm_5 VARCHAR(100),
review_nm VARCHAR(100),
review_visit INT DEFAULT 0 NOT NULL,
review_blog INT DEFAULT 0 NOT NULL,
reviewed INT DEFAULT 0,
popularity INT DEFAULT 0
) COLLATE utf8_bin ;

CREATE TABLE local_brand_place_visit_cnt_tb(
place_id CHAR(20) NOT NULL,
place_nm VARCHAR(100) NOT NULL,
place_nm_1 VARCHAR(100) NOT NULL,
place_nm_2 VARCHAR(100),
place_nm_3 VARCHAR(100),
place_nm_4 VARCHAR(100),
place_nm_5 VARCHAR(100),
review_nm VARCHAR(100),
review_visit INT DEFAULT 0 NOT NULL,
review_blog INT DEFAULT 0 NOT NULL,
reviewed INT DEFAULT 0,
popularity INT DEFAULT 0
) COLLATE utf8_bin ;

CREATE TABLE ta_black_spot_tb(
seq_no INT NOT NULL,
gubun VARCHAR(10),
accident_cnt INT,
accident_reason VARCHAR(1000),
accident_lat double,
accident_lng double,
accident_history VARCHAR(100),
gubun_eng VARCHAR(20),
accident_reason_eng VARCHAR(1000)
) COLLATE utf8_bin ;

CREATE TABLE lodge_fac_info_tb(
lodge_id VARCHAR(20) NOT NULL,
seq_no INT NOT NULL,
key_name VARCHAR(10),
key_value VARCHAR(100)
) COLLATE utf8_bin ;

CREATE TABLE ai_except_word_tb(
word VARCHAR(100) NOT NULL,
word_eng VARCHAR(100),
use_yn CHAR(1) DEFAULT 'Y' NOT NULL
) COLLATE utf8_bin ;

CREATE TABLE sa_black_spot_tb(
seq_no INT NOT NULL,
place_nm VARCHAR(100),
addr VARCHAR(1000),
accident_cnt INT,
accident_reason VARCHAR(1000),
accident_lat double,
accident_lng double,
place_nm_eng VARCHAR(100),
addr_eng VARCHAR(1000),
accident_reason_eng VARCHAR(1000)
) COLLATE utf8_bin ;

CREATE TABLE spot_tb(
spot_id VARCHAR(20) NOT NULL,
spot_nm VARCHAR(1000),
spot_lat double,
spot_lng double,
spot_addr VARCHAR(1000),
spot_addr_desc VARCHAR(1000),
image_url VARCHAR(1000),
spot_time time,
spot_contents VARCHAR(4096),
create_id VARCHAR(20),
create_dt DATETIME,
update_id VARCHAR(20),
update_dt DATETIME
) COLLATE utf8_bin ;

CREATE TABLE kma_area_code(
code VARCHAR(10) NOT NULL,
upper_code VARCHAR(10),
val VARCHAR(100) NOT NULL,
nx INT,
ny INT,
mid_ta_area_code VARCHAR(8),
mid_land_area_code VARCHAR(8),
obs_code VARCHAR(7),
sun_area_nm VARCHAR(50),
lat double,
lng double,
val_eng VARCHAR(200),
city_cd CHAR(2)
) COLLATE utf8_bin ;

CREATE TABLE honey_tip_tb(
tip_id bigint NOT NULL,
place_id VARCHAR(20),
title VARCHAR(1000),
addr VARCHAR(1000),
alias_nm VARCHAR(1000),
contents VARCHAR(4000),
tip_lat double,
tip_lng double,
hit_cnt INT DEFAULT 0,
favorite_cnt INT DEFAULT 0,
state CHAR(1),
create_id VARCHAR(100),
create_dt DATETIME,
update_id VARCHAR(100),
update_dt DATETIME,
image_id VARCHAR(20),
best_yn CHAR(1),
block_yn CHAR(1),
city_cd VARCHAR(2) DEFAULT 'JJ',
contents_eng VARCHAR(4000) DEFAULT ''
) COLLATE utf8_bin ;

CREATE TABLE lodge_tb(
lodge_id VARCHAR(20) NOT NULL,
main_category VARCHAR(10),
sub_category VARCHAR(10),
location_cd VARCHAR(10),
lodge_nm VARCHAR(100),
lodge_lat double,
lodge_lng double,
introduction LONGTEXT,
image_id VARCHAR(1000),
state CHAR(1),
create_id VARCHAR(100),
create_dt DATETIME,
update_id VARCHAR(100),
update_dt DATETIME
) COLLATE utf8_bin ;

CREATE TABLE faq_tb(
seq_no INT NOT NULL,
category_cd VARCHAR(9),
title VARCHAR(1000),
contents VARCHAR(4096),
state CHAR(1),
create_id VARCHAR(20),
create_dt DATETIME,
update_id VARCHAR(20),
update_dt DATETIME,
city_cd VARCHAR(2) DEFAULT 'JJ',
title_eng VARCHAR(1500) DEFAULT '',
contents_eng VARCHAR(10000) DEFAULT ''
) COLLATE utf8_bin ;

CREATE TABLE lodge_link_info_tb(
lodge_id VARCHAR(20) NOT NULL,
homepage VARCHAR(100),
phone_number VARCHAR(20),
instagram VARCHAR(100),
facebook VARCHAR(100)
) COLLATE utf8_bin ;

CREATE TABLE mid_ta_fcst(
fcst_date VARCHAR(8) NOT NULL,
area_code VARCHAR(8) NOT NULL,
min_ta INT,
max_ta INT,
update_dt DATETIME
) COLLATE utf8_bin ;

CREATE TABLE ultra_srt_ncst(
base_date VARCHAR(8) NOT NULL,
base_time VARCHAR(4) NOT NULL,
category VARCHAR(3) NOT NULL,
nx INT NOT NULL,
ny INT NOT NULL,
obsr_value VARCHAR(20),
update_dt DATETIME
) COLLATE utf8_bin ;

CREATE TABLE course_day_schedule_tb(
course_id VARCHAR(20) NOT NULL,
plan_seq_no INT NOT NULL,
plan_date date,
schedule_seq_no INT NOT NULL,
gubun VARCHAR(10),
place_id VARCHAR(20),
post_id VARCHAR(20),
spot_id VARCHAR(20),
state CHAR(1),
sort_order INT,
city_cd VARCHAR(2) DEFAULT 'JJ'
) COLLATE utf8_bin ;

CREATE TABLE map_charge_tb(
chrg_type VARCHAR(10) NOT NULL,
chrg_seq_no INT NOT NULL,
chrg_name VARCHAR(100),
chrg_phone VARCHAR(20),
chrg_addr VARCHAR(400),
chrg_lat double,
chrg_lng double,
chrg_time VARCHAR(20),
chrg_slow INT,
chrg_high INT,
chrg_desc VARCHAR(200),
create_id VARCHAR(20),
create_dt DATETIME,
update_id VARCHAR(20),
update_dt DATETIME,
chrg_name_eng VARCHAR(100),
chrg_addr_eng VARCHAR(400),
chrg_desc_eng VARCHAR(200)
) COLLATE utf8_bin ;

CREATE TABLE map_safety_tb(
safe_type VARCHAR(10) NOT NULL,
safe_seq_no INT NOT NULL,
safe_name VARCHAR(100),
safe_phone VARCHAR(20),
safe_addr VARCHAR(400),
safe_lat double,
safe_lng double,
safe_mng_name VARCHAR(100),
safe_camera INT,
safe_chk_date date,
create_id VARCHAR(20),
create_dt DATETIME,
update_id VARCHAR(20),
update_dt DATETIME,
safe_name_eng VARCHAR(100),
safe_addr_eng VARCHAR(400),
safe_mng_name_eng VARCHAR(100)
) COLLATE utf8_bin ;

