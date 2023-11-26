
-- fleamarket 데이터베이스 구조
CREATE DATABASE IF NOT EXISTS `fleamarket`;
USE `fleamarket`;




-- 테이블 fleamarket.user
CREATE TABLE IF NOT EXISTS `user` (
  `user_idx` int(10) AUTO_INCREMENT,
  `user_id` varchar(10) NOT null,
  `user_pwd` varchar(400) NOT NULL,
  `user_name` varchar(50) NOT NULL,
  `user_nick` varchar(50) NOT NULL,
  `user_email` varchar(50) DEFAULT null,
  `user_cp` varchar(50) NOT NULL,
  `user_addr` varchar(50) DEFAULT NULL,
  `user_daddr` varchar(50) DEFAULT NULL,
  `user_school` varchar(50) DEFAULT NULL,
  `last_login` datetime DEFAULT NULL,
  `join_date` datetime DEFAULT current_timestamp(),
  `user_grade` ENUM('A', 'E') NOT NULL DEFAULT 'E',
  `user_status` ENUM('pass', 'reject') DEFAULT 'reject',
  `report_cnt` int(10) DEFAULT NULL,
  PRIMARY KEY (`user_idx`),
  unique key(`user_id`)
);

INSERT INTO user(user_id, user_pwd, user_name, user_email, user_cp, user_addr, user_daddr, user_school) VALUES('choi_yj', 'choi_yj', '최영주', 'choi_yj@gmail.com', '010-2222-3333', '서울 금천구 디지털로9길 23', '마리오아울렛 2관', '숭실대학교');


-- 테이블 fleamarket.board 
CREATE TABLE IF NOT EXISTS `board` (
  `brd_id` int(10) NOT NULL AUTO_INCREMENT,
  `user_id` varchar(10) DEFAULT NULL,
  `title` varchar(500) NOT NULL,
  `content` varchar(4000) NOT NULL,
  `ofile` varchar(100) DEFAULT NULL,
  `sfile` varchar(100) DEFAULT NULL,
  `reg_date` datetime NOT NULL DEFAULT current_timestamp(),
  `cate_main` int(10) NOT NULL,
  `cate_sub` int(10) DEFAULT NULL,
  `view_cnt` int(10) NOT NULL DEFAULT 0,
  PRIMARY KEY (`brd_id`)
);

-- 테이블 fleamarket.product 
CREATE TABLE IF NOT EXISTS `product` (
  `prd_id` int(10) NOT NULL AUTO_INCREMENT,
  `brd_id` int(10) NOT NULL,
  `price` varchar(4000) DEFAULT 0,
  `status` ENUM('거래중', '판매완료') DEFAULT NULL,
  `deal_address` varchar(100) DEFAULT NULL,
  `prd_type` varchar(20) DEFAULT NULL,
  `buyer_id` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`prd_id`)
);


-- 테이블 fleamarket.board_comment
CREATE TABLE IF NOT EXISTS `board_comment` (
  `com_id` int(10) NOT NULL AUTO_INCREMENT,
  `parent_id` int(10) NOT NULL,
  `com_depth` int(10) DEFAULT NULL,
  `com_content` varchar(50) NOT NULL,
  `user_id` varchar(10) NOT NULL,
  `reg_date` datetime NOT NULL DEFAULT current_timestamp(),
  `mod_date` datetime DEFAULT NULL,
  PRIMARY KEY (`com_id`)
);


-- 테이블 studycafe.categories 구조 내보내기
CREATE TABLE IF NOT EXISTS `categories` (
  `cate_no` int(10) NOT NULL AUTO_INCREMENT,
  `cate_main` int(10) NOT NULL,
  `cate_sub` int(10) DEFAULT NULL,
  `cate_name` varchar(50) DEFAULT NULL,
  `user_grade` ENUM('A', 'E') NOT NULL DEFAULT 'E',
  PRIMARY KEY (`cate_no`),
  UNIQUE KEY unique_cate (`cate_main`, `cate_sub`)
);

insert into `categories`(`cate_main`, `cate_sub`, `kate_name`, `user_grade`) values 
(1, null, '중고거래', 'E'),
(2, 1, '선생님요모조모 꿀팁나눠요', 'E'),
(2, 2, '선생님요모조모 고민 있어요', 'E'),
(2, 3, '선생님요모조모 수업 질문', 'E'),
(3, 1, '고객지원 문의사항', 'E'),
(3, 2, '고객지원 신고', 'E');



-- 테이블 fleamarket.report 구조 내보내기
CREATE TABLE IF NOT EXISTS `report` (
  `report_id` int(10)  NOT NULL AUTO_INCREMENT,
  `user_id` varchar(10) NOT NULL,
  `brd_id` int(10) NOT null,
  `report_title` varchar(20) NOT NULL,
  `report_content` varchar(500) NOT null,
  `reg_date` datetime NOT NULL DEFAULT current_timestamp(),
  `mod_date` datetime DEFAULT NULL,
   PRIMARY KEY (`report_id`)
);




-- 관계 설정(개발 끝나고 나중에 erd 보여주기용, join문 작성시 참고용)
alter table board add foreign key(user_id) REFERENCES user(user_id);
alter table board add foreign key(cate_main, cate_sub) REFERENCES categories(cate_main, cate_sub);

alter table product add foreign key(brd_id) REFERENCES board(brd_id);
alter table product add foreign key(buyer_id) REFERENCES user(user_id);

alter table board_comment add foreign key(parent_id) REFERENCES board(brd_id); -- 이건 댓글을 참조하기도 해서 풀어놓아야 되나 싶슴다..
alter table board_comment add foreign key(user_id) REFERENCES user(user_id);

alter table report add foreign key (brd_id) REFERENCES board(brd_id);












