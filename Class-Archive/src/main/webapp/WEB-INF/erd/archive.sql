CREATE DATABASE archive;
USE archive;

-- 회원 관리
create table tb_member(
          `id` bigint AUTO_INCREMENT PRIMARY KEY comment '회원 고유번호',
          `member_id` varchar(20) NOT NULL UNIQUE KEY comment '회원 ID',
          `password` varchar(50) NOT NULL comment '회원 비밀번호',
          `name` varchar(10) comment '회원 이름',
          `email` varchar(30) comment '회원 이메일',
          `join_date` datetime DEFAULT current_timestamp comment '회원 등록일',
          `phone_number` varchar(20) comment '회원 전화번호',
          `delete_flag` tinyint(1) DEFAULT 0 comment '회원 삭제 여부'
);


-- 회원 권한
create table tb_member_auth(
           `id` bigint AUTO_INCREMENT PRIMARY KEY comment '권한 고유번호',
           `member_id` bigint NOT NULL comment '회원 고유번호',
           `auth` varchar(20) comment '접근 권한'
);


-- 카테고리 관리
CREATE TABLE tb_category (
                             `id` bigint AUTO_INCREMENT PRIMARY KEY comment '카테고리 고유번호',
                             `cate_id` int UNIQUE KEY comment '카테고리 ID', -- 카테고리 ID : 주제는 T(topics), 교과는 S(subject) + 숫자
                             `parent_id` int comment '부모 카테고리 ID',
                             `name` varchar(10) comment '카테고리 이름',
                             `show_flag` tinyint(1) NOT NULL DEFAULT '1' comment '노출 여부',
                             `depths` tinyint(1) NOT null comment '트리 구조 단계',
                             `seq` smallint(3) NOT NULL comment '같은 depths 내 순서'
);

INSERT INTO tb_category( cate_id, parent_id, name, show_flag, depths, seq)
VALUES ( 1000, 999, '주제', 1, 1, 1);
INSERT INTO tb_category( cate_id, parent_id, name, show_flag, depths, seq)
VALUES ( 1001, 1000, '일반', 1, 2, 1);
INSERT INTO tb_category( cate_id, parent_id, name, show_flag, depths, seq)
VALUES ( 1002, 1000, '사회/문화', 1, 2, 2);
INSERT INTO tb_category( cate_id, parent_id, name, show_flag, depths, seq)
VALUES ( 1003, 1000, '자연', 1, 2, 3);
INSERT INTO tb_category( cate_id, parent_id, name, show_flag, depths, seq)
VALUES ( 1004, 1000, '경제', 1, 2, 4);
INSERT INTO tb_category( cate_id, parent_id, name, show_flag, depths, seq)
VALUES ( 1005, 1000, '예술', 1, 2, 5);
INSERT INTO tb_category( cate_id, parent_id, name, show_flag, depths, seq)
VALUES ( 1006, 1000, '과학', 1, 2, 6);
INSERT INTO tb_category( cate_id, parent_id, name, show_flag, depths, seq)
VALUES ( 1007, 1001, '일반', 1, 3, 1);
INSERT INTO tb_category( cate_id, parent_id, name, show_flag, depths, seq)
VALUES ( 1008, 1002, '정치', 1, 3, 1);
INSERT INTO tb_category( cate_id, parent_id, name, show_flag, depths, seq)
VALUES ( 1009, 1002, '행정', 1, 3, 2);
INSERT INTO tb_category( cate_id, parent_id, name, show_flag, depths, seq)
VALUES ( 1010, 1002, '철학', 1, 3, 3);
INSERT INTO tb_category( cate_id, parent_id, name, show_flag, depths, seq)
VALUES ( 1011, 1002, '종교', 1, 3, 4);
INSERT INTO tb_category( cate_id, parent_id, name, show_flag, depths, seq)
VALUES ( 1012, 1002, '교육', 1, 3, 5);
INSERT INTO tb_category( cate_id, parent_id, name, show_flag, depths, seq)
VALUES ( 1013, 1002, '문화', 1, 3, 6);
INSERT INTO tb_category( cate_id, parent_id, name, show_flag, depths, seq)
VALUES ( 1014, 1002, '기타', 1, 3, 7);
INSERT INTO tb_category( cate_id, parent_id, name, show_flag, depths, seq)
VALUES ( 1015, 1003, '산', 1, 3, 1);
INSERT INTO tb_category( cate_id, parent_id, name, show_flag, depths, seq)
VALUES ( 1016, 1003, '바다', 1, 3, 2);
INSERT INTO tb_category( cate_id, parent_id, name, show_flag, depths, seq)
VALUES ( 1017, 1003, '하늘', 1, 3, 3);
INSERT INTO tb_category( cate_id, parent_id, name, show_flag, depths, seq)
VALUES ( 1018, 1003, '강', 1, 3, 4);
INSERT INTO tb_category( cate_id, parent_id, name, show_flag, depths, seq)
VALUES ( 1019, 1003, '재해', 1, 3, 5);
INSERT INTO tb_category( cate_id, parent_id, name, show_flag, depths, seq)
VALUES ( 1020, 1003, '기타', 1, 3, 6);
INSERT INTO tb_category( cate_id, parent_id, name, show_flag, depths, seq)
VALUES ( 1021, 1004, '경영', 1, 3, 1);
INSERT INTO tb_category( cate_id, parent_id, name, show_flag, depths, seq)
VALUES ( 1022, 1004, '금융', 1, 3, 2);
INSERT INTO tb_category( cate_id, parent_id, name, show_flag, depths, seq)
VALUES ( 1023, 1004, '산업', 1, 3, 3);
INSERT INTO tb_category( cate_id, parent_id, name, show_flag, depths, seq)
VALUES ( 1024, 1004, '기타', 1, 3, 4);
INSERT INTO tb_category( cate_id, parent_id, name, show_flag, depths, seq)
VALUES ( 1025, 1005, '음악', 1, 3, 1);
INSERT INTO tb_category( cate_id, parent_id, name, show_flag, depths, seq)
VALUES ( 1026, 1005, '미술', 1, 3, 2);
INSERT INTO tb_category( cate_id, parent_id, name, show_flag, depths, seq)
VALUES ( 1027, 1005, '공연', 1, 3, 3);
INSERT INTO tb_category( cate_id, parent_id, name, show_flag, depths, seq)
VALUES ( 1028, 1005, '미디어', 1, 3, 4);
INSERT INTO tb_category( cate_id, parent_id, name, show_flag, depths, seq)
VALUES ( 1029, 1005, '건축', 1, 3, 5);
INSERT INTO tb_category( cate_id, parent_id, name, show_flag, depths, seq)
VALUES ( 1030, 1005, '기타', 1, 3, 6);
INSERT INTO tb_category( cate_id, parent_id, name, show_flag, depths, seq)
VALUES ( 1031, 1006, '물리', 1, 3, 1);
INSERT INTO tb_category( cate_id, parent_id, name, show_flag, depths, seq)
VALUES ( 1032, 1006, '화학', 1, 3, 2);
INSERT INTO tb_category( cate_id, parent_id, name, show_flag, depths, seq)
VALUES ( 1033, 1006, '지구과학', 1, 3, 3);
INSERT INTO tb_category( cate_id, parent_id, name, show_flag, depths, seq)
VALUES ( 1034, 1006, '생명과학', 1, 3, 4);
INSERT INTO tb_category( cate_id, parent_id, name, show_flag, depths, seq)
VALUES ( 1035, 1006, '환경', 1, 3, 5);
INSERT INTO tb_category( cate_id, parent_id, name, show_flag, depths, seq)
VALUES ( 1036, 1006, '기타', 1, 3, 6);

INSERT INTO tb_category( cate_id, parent_id, name, show_flag, depths, seq)
VALUES ( 2000, 999, '교과', 1, 1, 1);
INSERT INTO tb_category( cate_id, parent_id, name, show_flag, depths, seq)
VALUES ( 2001, 2000, '초등', 1, 2, 1);
INSERT INTO tb_category( cate_id, parent_id, name, show_flag, depths, seq)
VALUES ( 2002, 2000, '중등', 1, 2, 2);
INSERT INTO tb_category( cate_id, parent_id, name, show_flag, depths, seq)
VALUES ( 2003, 2000, '고등', 1, 2, 3);
INSERT INTO tb_category( cate_id, parent_id, name, show_flag, depths, seq)
VALUES ( 2004, 2001, '1학년', 1, 3, 1);
INSERT INTO tb_category( cate_id, parent_id, name, show_flag, depths, seq)
VALUES ( 2005, 2001, '2학년', 1, 3, 2);
INSERT INTO tb_category( cate_id, parent_id, name, show_flag, depths, seq)
VALUES ( 2006, 2001, '3학년', 1, 3, 3);
INSERT INTO tb_category( cate_id, parent_id, name, show_flag, depths, seq)
VALUES ( 2007, 2001, '4학년', 1, 3, 4);
INSERT INTO tb_category( cate_id, parent_id, name, show_flag, depths, seq)
VALUES ( 2008, 2001, '5학년', 1, 3, 5);
INSERT INTO tb_category( cate_id, parent_id, name, show_flag, depths, seq)
VALUES ( 2009, 2001, '6학년', 1, 3, 6);
INSERT INTO tb_category( cate_id, parent_id, name, show_flag, depths, seq)
VALUES ( 2010, 2002, '1학년', 1, 3, 1);
INSERT INTO tb_category( cate_id, parent_id, name, show_flag, depths, seq)
VALUES ( 2011, 2002, '2학년', 1, 3, 2);
INSERT INTO tb_category( cate_id, parent_id, name, show_flag, depths, seq)
VALUES ( 2012, 2002, '3학년', 1, 3, 3);
INSERT INTO tb_category( cate_id, parent_id, name, show_flag, depths, seq)
VALUES ( 2013, 2003, '1학년', 1, 3, 1);
INSERT INTO tb_category( cate_id, parent_id, name, show_flag, depths, seq)
VALUES ( 2014, 2003, '2학년', 1, 3, 2);
INSERT INTO tb_category( cate_id, parent_id, name, show_flag, depths, seq)
VALUES ( 2015, 2003, '3학년', 1, 3, 3);
INSERT INTO tb_category( cate_id, parent_id, name, show_flag, depths, seq)
VALUES ( 2016, 2004, '국어', 1, 4, 1);
INSERT INTO tb_category( cate_id, parent_id, name, show_flag, depths, seq)
VALUES ( 2017, 2004, '수학', 1, 4, 2);
INSERT INTO tb_category( cate_id, parent_id, name, show_flag, depths, seq)
VALUES ( 2018, 2004, '여름', 1, 4, 3);
INSERT INTO tb_category( cate_id, parent_id, name, show_flag, depths, seq)
VALUES ( 2019, 2004, '겨울', 1, 4, 4);


-- 콘텐츠 관리
CREATE TABLE tb_contents (
             `id` bigint AUTO_INCREMENT PRIMARY KEY comment '콘텐츠 ID',
             `writer_id` bigint NOT NULL comment '콘텐츠 작성자',
             `type_id` bigint NOT NULL comment '콘텐츠 유형',
             `cate_id` varchar(10) NOT NULL comment '카테고리 ID',
             `title` varchar(20) NOT NULL comment '콘텐츠 제목',
             `original_file` varchar(50) comment '콘텐츠 원본파일명',
             `s3_file` varchar(50) comment '콘텐츠 업로드파일명',
             `show_flag` tinyint(1) comment '콘텐츠 노출 여부',
             `free_flag` tinyint(1) comment '콘텐츠 유무료 여부',
             `delete_flag` tinyint(1) DEFAULT 0 comment '콘텐츠 삭제 여부',
             `keyword` varchar(200) comment '콘텐츠 키워드',
             `reg_date` datetime DEFAULT CURRENT_TIMESTAMP  comment '콘텐츠 생성일',
             `reference` varchar(20) comment '콘텐츠 출처',
             `reference_url` varchar(50) comment '콘텐츠 출처 URL',
             `reference_etc` varchar(50) comment '콘텐츠 출처 기타',
             `file_path` varchar(500) comment '콘텐츠 파일 경로',
             `modifier_id` bigint comment '콘텐츠 수정자',
             `modify_date` datetime DEFAULT current_timestamp on update current_timestamp comment '콘텐츠 수정일'
);


-- 썸네일 이미지 관리
CREATE TABLE tb_thumbnail (
              `id` bigint AUTO_INCREMENT PRIMARY KEY comment '이미지 ID',
              `con_id` bigint NOT NULL comment '콘텐츠 ID',
              `original_file` varchar(50) comment '썸네일 원본파일명',
              `s3_file` varchar(50) comment '썸네일 업로드파일명',
              `delete_flag` tinyint(1) DEFAULT 0 comment '썸네일 삭제 여부',
-- `show_flag` tinyint(1) comment '썸네일 노출 여부',
              `file_path` varchar(500) comment '썸네일 파일 경로'
);


-- 콘텐츠 유형
CREATE TABLE tb_contents_type (
              `id` BIGINT AUTO_INCREMENT PRIMARY KEY comment '타입 ID',
              `name` varchar(20) comment '타입명'
);


-- 콘텐츠 다운로드 로그
CREATE TABLE tb_contents_download_log (
              `id` BIGINT AUTO_INCREMENT PRIMARY KEY comment '콘텐츠 다운로드 로그 ID',
              `con_id` BIGINT NOT NULL comment '콘텐츠 ID',
              `member_id` BIGINT NOT NULL comment '회원 고유번호',
              `download_date` datetime DEFAULT current_timestamp comment '다운로드 날짜'
);


-- 콘텐츠 조회 로그
CREATE TABLE tb_contents_view_log (
              `id` BIGINT AUTO_INCREMENT PRIMARY KEY comment '콘텐츠 조회 로그 ID',
              `con_id` BIGINT NOT NULL comment '콘텐츠 ID',
              `member_id` BIGINT NOT NULL comment '회원 고유번호',
              `view_date` datetime DEFAULT current_timestamp comment '조회 날짜'
);


-- 방문 로그
CREATE TABLE tb_access_log (
               `id` BIGINT AUTO_INCREMENT PRIMARY KEY comment '회원 방문 로그 ID',
               `member_id` BIGINT NOT NULL comment '회원 고유번호',
               `access_date` datetime DEFAULT current_timestamp comment '방문일'
);


-- 메인 추천 콘텐츠 그룹
create table tb_contents_group(
              `id` bigint AUTO_INCREMENT PRIMARY KEY comment '추천 콘텐츠 그룹 ID',
              `writer_id` bigint NOT NULL comment '추천 컨텐츠 생성자',
              `title` varchar(20) comment '추천 콘텐츠 제목',
              `show_flag` tinyint(1) comment '그룹 노출 여부',
              `group_order` int comment '그룹 노출 순서',
              `delete_flag` tinyint(1) DEFAULT 0 comment '추천 콘텐츠 삭제 여부',
              `reg_date` datetime DEFAULT current_timestamp comment '추천 콘텐츠 게시일',
              `modifier_id` bigint comment '추천 콘텐츠 수정자',
              `modify_date` datetime DEFAULT current_timestamp on update current_timestamp comment '추천 콘텐츠 수정일'
);


-- 메인 추천 콘텐츠 그룹 상세
create table tb_contents_group_detail(
             `id` bigint AUTO_INCREMENT PRIMARY KEY comment '추천 콘텐츠 상세 ID',
             `group_id` bigint NOT NULL comment '추천 콘텐츠 그룹',
             `con_id` bigint NOT NULL comment '콘텐츠 ID'
);


-- 메인 추천 콘텐츠 전체 보기 관리
create table tb_contents_group_all(
              `id` bigint AUTO_INCREMENT PRIMARY KEY comment '전체보기 ID',
              `group_id` bigint NOT NULL comment '추천 콘텐츠 그룹',
              `all_keyword` varchar(10) comment '전체보기 조건 키워드'
);


-- 메인 추천 키워드 관리
create table tb_main_keyword(
                `id` bigint AUTO_INCREMENT PRIMARY KEY comment '추천 키워드 그룹 ID',
                `delete_flag` tinyint(1) comment '추천 키워드 그룹 삭제 여부',
                `show_flag` tinyint(1) comment '추천 키워드 그룹 노출 여부'
);


-- 메인 추천 키워드 상세
create table tb_main_keyword_detail(
               `id` bigint AUTO_INCREMENT PRIMARY KEY comment '추천 키워드 ID',
               `group_id` bigint comment '추천 키워드 그룹 ID',
               `keyword` varchar(20) comment '추천 키워드',
               `keyword_order` int comment '키워드 노출 순서'
);


-- 공지사항
create table tb_notice(
              `id` bigint AUTO_INCREMENT PRIMARY KEY comment '공지사항 ID',
              `writer_id` bigint NOT NULL comment '공지사항 작성자',
              `title` varchar(20) comment '공지사항 제목',
              `content` TEXT comment'공지사항 내용',
              `reg_date` datetime DEFAULT current_timestamp comment '공지사항 작성일',
              `delete_flag` tinyint(1) DEFAULT 0 comment '공지사항 삭제여부',
              `modifier_id` bigint comment '공지사항 수정자',
              `modify_date` datetime DEFAULT current_timestamp on update current_timestamp comment '공지사항 수정일',
              `fix_flag` tinyint(1) comment '공지사항 고정 여부',
              `original_file` varchar(200) comment '공지사항 첨부파일명',
              `s3_file` varchar(200) comment '공지사항 업로드파일명'
);


-- 아이콘 꾸러미 관리
create table tb_icon_package(
            `id` bigint AUTO_INCREMENT PRIMARY KEY comment '꾸러미 ID',
            `writer_id` bigint NOT NULL comment '꾸러미 작성자',
            `title` varchar(20) comment '꾸러미 제목',
            `show_flag` tinyint(1) comment '노출 여부',
--             `free_flag` tinyint(1) comment '꾸러미 유무료 여부',
            `delete_flag` tinyint(1) DEFAULT 0 comment '꾸러미 삭제 여부',
            `reg_date` datetime DEFAULT current_timestamp comment '꾸러미 생성일',
            `modifier_id` bigint comment '꾸러미 수정자',
            `modify_date` datetime DEFAULT current_timestamp on update current_timestamp comment '꾸러미 수정일'
);


-- 꾸러미 썸네일 이미지 관리
create table tb_pack_thumbnail(
          `id` bigint AUTO_INCREMENT PRIMARY KEY comment '이미지 ID',
          `pack_id` bigint NOT NULL comment '꾸러미 ID',
          `original_file` varchar(50) comment '썸네일 원본 파일명',
          `s3_file` varchar(50) comment '썸네일 업로드 파일명',
          `types` varchar(10) comment '썸네일 구분 타입',
          `delete_flag` tinyint(1) DEFAULT 0 comment '썸네일 삭제 여부',
-- `show_flag` tinyint(1) comment '썸네일 노출 여부',
          `file_path` varchar(500) comment '섬네일 파일 경로'
);


-- 아이콘 꾸러미 상세
create table tb_icon_package_detail(
           `id` bigint AUTO_INCREMENT PRIMARY KEY comment '꾸러미 상세 ID',
           `pack_id` bigint NOT NULL comment '꾸러미 ID',
           `con_id` bigint NOT NULL comment '아이콘 콘텐츠 ID'
);


-- 연관 관계 설정
ALTER TABLE tb_member_auth ADD FOREIGN key(member_id) REFERENCES tb_member(id) ON DELETE CASCADE;
ALTER TABLE tb_notice ADD FOREIGN key(writer_id) REFERENCES tb_member(id) ON DELETE CASCADE;
ALTER TABLE tb_contents_group ADD FOREIGN key(writer_id) REFERENCES tb_member(id) ON DELETE CASCADE;
ALTER TABLE tb_icon_package ADD FOREIGN key(writer_id) REFERENCES tb_member(id) ON DELETE CASCADE;
ALTER TABLE tb_icon_package ADD FOREIGN KEY(modifier_id) REFERENCES tb_member(id) ON DELETE CASCADE;
ALTER TABLE tb_access_log ADD FOREIGN key(member_id) REFERENCES tb_member(id) ON DELETE CASCADE;
ALTER TABLE tb_contents_view_log ADD FOREIGN key(member_id) REFERENCES tb_member(id) ON DELETE CASCADE;
ALTER TABLE tb_contents_download_log ADD FOREIGN key(member_id) REFERENCES tb_member(id) ON DELETE CASCADE;
ALTER TABLE tb_contents ADD FOREIGN key(writer_id) REFERENCES tb_member(id) ON DELETE CASCADE;
ALTER TABLE tb_contents_group_detail ADD FOREIGN key(group_id) REFERENCES tb_contents_group(id) ON DELETE CASCADE;
ALTER TABLE tb_contents_group_all ADD FOREIGN key(group_id) REFERENCES tb_contents_group(id) ON DELETE CASCADE;
ALTER TABLE tb_pack_thumbnail ADD FOREIGN key(pack_id) REFERENCES tb_icon_package(id) ON DELETE CASCADE;
ALTER TABLE tb_icon_package_detail ADD FOREIGN key(pack_id) REFERENCES tb_icon_package(id) ON DELETE CASCADE;
ALTER TABLE tb_contents ADD FOREIGN key(type_id) REFERENCES tb_contents_type(id) ON DELETE CASCADE;
ALTER TABLE tb_contents_download_log ADD FOREIGN key(con_id) REFERENCES tb_contents(id) ON DELETE CASCADE;
ALTER TABLE tb_contents_view_log ADD FOREIGN key(con_id) REFERENCES tb_contents(id) ON DELETE CASCADE;
ALTER TABLE tb_thumbnail ADD FOREIGN key(con_id) REFERENCES tb_contents(id) ON DELETE CASCADE;
ALTER TABLE tb_icon_package_detail ADD FOREIGN key(con_id) REFERENCES tb_contents(id) ON DELETE CASCADE;
ALTER TABLE tb_contents_group_detail ADD FOREIGN key(con_id) REFERENCES tb_contents(id) ON DELETE CASCADE;
ALTER TABLE tb_contents ADD FOREIGN key(cate_id) REFERENCES tb_category(cate_id) ON DELETE CASCADE;
ALTER TABLE tb_notice ADD FOREIGN key(modifier_id) REFERENCES tb_member(id) ON DELETE CASCADE;
ALTER TABLE tb_contents ADD FOREIGN key(modifier_id) REFERENCES tb_member(id) ON DELETE CASCADE;
ALTER TABLE tb_icon_package ADD FOREIGN key(modifier_id) REFERENCES tb_member(id) ON DELETE CASCADE;
ALTER TABLE tb_contents_group ADD FOREIGN key(modifier_id) REFERENCES tb_member(id) ON DELETE CASCADE;
ALTER TABLE tb_main_keyword_detail ADD FOREIGN key(group_id) REFERENCES tb_main_keyword(id) ON DELETE CASCADE;


-- Mapper Interface 예시 코드 활용
create table example (
         `name` varchar(10),
         `date` datetime default current_timestamp
);

-- Mapper Interface 예시 코드 더미 데이터
insert into example(name) values('영주');
insert into example(name) values('양진');
insert into example(name) values('진철');
insert into example(name) values('재혁');
insert into example(name) values('수진');


-- tb_contents_type 더미데이터
insert into tb_contents_type(name) values('이미지');
insert into tb_contents_type(name) values('아이콘');
insert into tb_contents_type(name) values('캐릭터');
insert into tb_contents_type(name) values('동영상');