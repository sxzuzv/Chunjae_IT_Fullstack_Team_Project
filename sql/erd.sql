
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
  `report_cnt` int(10) DEFAULT 0,
  `ofile` varchar(100) DEFAULT NULL,
  `sfile` varchar(100) DEFAULT NULL,
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

insert into `categories`(`cate_main`, `cate_sub`, `cate_name`, `user_grade`) values
(1, null, '중고거래', 'E'),
(2, 1, '선생님요모조모 꿀팁나눠요', 'E'),
(2, 2, '선생님요모조모 고민 있어요', 'E'),
(2, 3, '선생님요모조모 수업 질문', 'E'),
(3, 1, '고객지원 문의사항', 'E')



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



-- user(관리자) 더미 데이터
INSERT INTO user(user_id, user_pwd, user_name, user_nick, user_cp, user_grade) VALUES('admin', 'admin', '관리자', '관리자', '010-0000-0000', 'A');

-- board(게시판) 더미 데이터 : 선생님 요모조모 - 꿀팁 나눠요
INSERT INTO board(user_id, title, content, cate_main, cate_sub) VALUES('choi_gr', '좋은 팁 나눠요!', '오늘도 좋은 하루 보내세요 ~', 2, 1);
INSERT INTO board(user_id, title, content, cate_main, cate_sub) VALUES('choi_yj', '여러분 그거 아시나요?', '오늘도 좋은 하루 보내세요 ~', 2, 1);
INSERT INTO board(user_id, title, content, cate_main, cate_sub) VALUES('choi_jh', '팁 공유 좀 해주세요 ㅠㅠ', '오늘도 좋은 하루 보내세요 ~', 2, 1);
INSERT INTO board(user_id, title, content, cate_main, cate_sub) VALUES('choi_sz', '오늘 학교에서 알아낸 좋은 팁이 있어요!', '오늘도 좋은 하루 보내세요 ~', 2, 1);
INSERT INTO board(user_id, title, content, cate_main, cate_sub) VALUES('choi_gd', '나누고 싶은 꿀팁 있어서 공유해요 ~', '오늘도 좋은 하루 보내세요 ~', 2, 1);
INSERT INTO board(user_id, title, content, cate_main, cate_sub) VALUES('choi_ma', '다들 주목! 좋은 팁 나눕니다!', '오늘도 좋은 하루 보내세요 ~', 2, 1);
INSERT INTO board(user_id, title, content, cate_main, cate_sub) VALUES('choi_yl', '더는 고민하지 마세요', '오늘도 좋은 하루 보내세요 ~', 2, 1);
INSERT INTO board(user_id, title, content, cate_main, cate_sub) VALUES('choi_jy', '드디어 알아냈습니다!', '오늘도 좋은 하루 보내세요 ~', 2, 1);
INSERT INTO board(user_id, title, content, cate_main, cate_sub) VALUES('choi_ny', '대박 정보입니다 !!!', '오늘도 좋은 하루 보내세요 ~', 2, 1);
INSERT INTO board(user_id, title, content, cate_main, cate_sub) VALUES('choi_je', '이런 경우에 쓸 수 있는 꿀팁 있나요?', '오늘도 좋은 하루 보내세요 ~', 2, 1);
INSERT INTO board(user_id, title, content, cate_main, cate_sub) VALUES('choi_jj', '다들 좋은 팁 나눠주셔서 감사합니다 ~', '오늘도 좋은 하루 보내세요 ~', 2, 1);
INSERT INTO board(user_id, title, content, cate_main, cate_sub) VALUES('choi_hj', '덕분에 도움이 많이 됐어요! 저도 꿀팁 나눠요 ~', '오늘도 좋은 하루 보내세요 ~', 2, 1);
INSERT INTO board(user_id, title, content, cate_main, cate_sub) VALUES('choi_my', '이건 모두 알고 계실까요 ..?', '오늘도 좋은 하루 보내세요 ~', 2, 1);

-- board(게시판) 더미 데이터 : 선생님 요모조모 - 고민 있어요
INSERT INTO board(user_id, title, content, cate_main, cate_sub) VALUES('choi_gr', '고민 있어요 ㅠㅠ', '고민 고민 하지마!', 2, 2);
INSERT INTO board(user_id, title, content, cate_main, cate_sub) VALUES('choi_yj', '여러분 저 진짜 심각해요 ...', '고민 고민 하지마!', 2, 2);
INSERT INTO board(user_id, title, content, cate_main, cate_sub) VALUES('choi_jh', '이럴 때 다들 어떻게 하세요 ..?', '고민 고민 하지마!', 2, 2);
INSERT INTO board(user_id, title, content, cate_main, cate_sub) VALUES('choi_sz', '여러분 모두 잘 될 거예요! 너무 크게 고민하지 마세요 ~', '고민 고민 하지마!', 2, 2);
INSERT INTO board(user_id, title, content, cate_main, cate_sub) VALUES('choi_gd', '고민만 늘어가는 요즘 ㅠㅠ ..', '고민 고민 하지마!', 2, 2);
INSERT INTO board(user_id, title, content, cate_main, cate_sub) VALUES('choi_ma', '다들 어떻게 헤쳐나가시나요 ..?', '고민 고민 하지마!', 2, 2);
INSERT INTO board(user_id, title, content, cate_main, cate_sub) VALUES('choi_yl', '교무실에서 신을 슬리퍼 뭐가 좋을까요?', '고민 고민 하지마!', 2, 2);
INSERT INTO board(user_id, title, content, cate_main, cate_sub) VALUES('choi_jy', '필요한 거 사려는데 좀 봐주세요!', '고민 고민 하지마!', 2, 2);
INSERT INTO board(user_id, title, content, cate_main, cate_sub) VALUES('choi_ny', '진짜 고민입니다 ..', '고민 고민 하지마!', 2, 2);
INSERT INTO board(user_id, title, content, cate_main, cate_sub) VALUES('choi_je', '고민 고민 하지마!', '고민 고민 하지마!', 2, 2);
INSERT INTO board(user_id, title, content, cate_main, cate_sub) VALUES('choi_jj', '어떡하면 좋을까요 ㅠㅠㅠㅠㅠ', '고민 고민 하지마!', 2, 2);
INSERT INTO board(user_id, title, content, cate_main, cate_sub) VALUES('choi_hj', '진짜 급해요 도움 구합니다 ㅠㅠ', '고민 고민 하지마!', 2, 2);
INSERT INTO board(user_id, title, content, cate_main, cate_sub) VALUES('choi_my', '저 진짜 어떡하죠 ...?', '고민 고민 하지마!', 2, 2);

-- board(게시판) 더미 데이터 : 선생님 요모조모 - 수업 질문
INSERT INTO board(user_id, title, content, cate_main, cate_sub) VALUES('choi_gr', '질문 있어요!', '우리 모두 파이팅!', 2, 3);
INSERT INTO board(user_id, title, content, cate_main, cate_sub) VALUES('choi_yj', '쌤들 수업하다가 이런 경우 있지 않나요?', '우리 모두 파이팅!', 2, 3);
INSERT INTO board(user_id, title, content, cate_main, cate_sub) VALUES('choi_jh', '수업 관련 질문입니다 ㅠㅠ', '우리 모두 파이팅!', 2, 3);
INSERT INTO board(user_id, title, content, cate_main, cate_sub) VALUES('choi_sz', '수업할 때 이렇게 해보세요!', '우리 모두 파이팅!', 2, 3);
INSERT INTO board(user_id, title, content, cate_main, cate_sub) VALUES('choi_gd', '교재 활용 관련하여 다들 어떻게 하시나요 ..?', '우리 모두 파이팅!', 2, 3);
INSERT INTO board(user_id, title, content, cate_main, cate_sub) VALUES('choi_ma', '수업 관련해서요 ..', '우리 모두 파이팅!', 2, 3);
INSERT INTO board(user_id, title, content, cate_main, cate_sub) VALUES('choi_yl', '어떡하면 더 잘할 수 있을까요?', '우리 모두 파이팅!', 2, 3);
INSERT INTO board(user_id, title, content, cate_main, cate_sub) VALUES('choi_jy', '제가 잘하고 있는 건가 싶어요 ㅠㅠ', '우리 모두 파이팅!', 2, 3);
INSERT INTO board(user_id, title, content, cate_main, cate_sub) VALUES('choi_ny', '첫 상담 ..! 질문입니다', '우리 모두 파이팅!', 2, 3);
INSERT INTO board(user_id, title, content, cate_main, cate_sub) VALUES('choi_je', '수업 관련해서 궁금한 게 있는데요 고참 선생님들 도와주세요 ..!', '우리 모두 파이팅!', 2, 3);
INSERT INTO board(user_id, title, content, cate_main, cate_sub) VALUES('choi_jj', '너무 너무 힘들어요 ㅠㅠ 도와주세요 ㅠㅠㅠ', '우리 모두 파이팅!', 2, 3);
INSERT INTO board(user_id, title, content, cate_main, cate_sub) VALUES('choi_hj', '수업 방식 질문해봐요', '우리 모두 파이팅!', 2, 3);
INSERT INTO board(user_id, title, content, cate_main, cate_sub) VALUES('choi_my', '다들 수업 잘 되시나요?', '우리 모두 파이팅!', 2, 3);

-- board(게시판) 더미 데이터 : 중고 거래
INSERT INTO board(user_id, title, content, cate_main, cate_sub) VALUES('choi_gr', '교재 일괄 판매', '구매하세요!', 1, null);
INSERT INTO board(user_id, title, content, cate_main, cate_sub) VALUES('choi_yj', '교구 일괄 판매해요!', '구매하세요!', 1, null);
INSERT INTO board(user_id, title, content, cate_main, cate_sub) VALUES('choi_jh', '담요 팔아요!', '구매하세요!', 1, null);
INSERT INTO board(user_id, title, content, cate_main, cate_sub) VALUES('choi_sz', '안 쓰는 물품 일괄 판매해요!', '구매하세요!', 1, null);
INSERT INTO board(user_id, title, content, cate_main, cate_sub) VALUES('choi_gd', '싼 값에 가져가세요 ~', '구매하세요!', 1, null);
INSERT INTO board(user_id, title, content, cate_main, cate_sub) VALUES('choi_ma', '화일 판매해요!', '구매하세요!', 1, null);
INSERT INTO board(user_id, title, content, cate_main, cate_sub) VALUES('choi_yl', '교구 사가세요', '구매하세요!', 1, null);
INSERT INTO board(user_id, title, content, cate_main, cate_sub) VALUES('choi_jy', '깨끗한 새 물건입니다 ~', '구매하세요!', 1, null);
INSERT INTO board(user_id, title, content, cate_main, cate_sub) VALUES('choi_ny', '아깝지만 판매해요 ㅠㅠ', '구매하세요!', 1, null);
INSERT INTO board(user_id, title, content, cate_main, cate_sub) VALUES('choi_je', '쏠쏠한 물품 팔아요 !!', '구매하세요!', 1, null);
INSERT INTO board(user_id, title, content, cate_main, cate_sub) VALUES('choi_jj', '핫팩 일괄 판매해요 ~', '구매하세요!', 1, null);
INSERT INTO board(user_id, title, content, cate_main, cate_sub) VALUES('choi_hj', '교구 판매합니다!', '구매하세요!', 1, null);
INSERT INTO board(user_id, title, content, cate_main, cate_sub) VALUES('choi_my', '교재 싸게 팔아요 ~', '구매하세요!', 1, null);

-- product 더미 데이터 (brd_id 임의 작성)
INSERT INTO product(brd_id, price, deal_address, prd_type, buyer_id) VALUES(40, '50000', '서울 강남구', '교재', 'choi_my');
INSERT INTO product(brd_id, price, deal_address, prd_type, buyer_id) VALUES(41, '25000', '서울 강북구', '교구', 'choi_hj');
INSERT INTO product(brd_id, price, deal_address, prd_type, buyer_id) VALUES(42, '5000', '경기 화성시', '일상용품', 'choi_jj');
INSERT INTO product(brd_id, price, deal_address, prd_type, buyer_id) VALUES(43, '25000', '경기 성남시', '일상용품', 'choi_je');
INSERT INTO product(brd_id, price, deal_address, prd_type, buyer_id) VALUES(44, '10000', '경기 수원시', '일상용품', 'choi_ny');
INSERT INTO product(brd_id, price, deal_address, prd_type, buyer_id) VALUES(45, '5000', '서울 강서구', '교구', 'choi_jy');
INSERT INTO product(brd_id, price, deal_address, prd_type, buyer_id) VALUES(46, '30000', '서울 금천구', '교구', 'choi_yl');
INSERT INTO product(brd_id, price, deal_address, prd_type, buyer_id) VALUES(47, '15000', '서울 강남구', '일상용품', 'choi_ma');
INSERT INTO product(brd_id, price, deal_address, prd_type, buyer_id) VALUES(48, '25000', '서울 강북구', '교구', 'choi_gd');
INSERT INTO product(brd_id, price, deal_address, prd_type, buyer_id) VALUES(49, '20000', '경기 화성시', '교구', 'choi_sz');
INSERT INTO product(brd_id, price, deal_address, prd_type, buyer_id) VALUES(50, '3000', '경기 수원시', '일상용품', 'choi_jh');
INSERT INTO product(brd_id, price, deal_address, prd_type, buyer_id) VALUES(51, '23000', '경기 성남시', '교구', 'choi_yj');
INSERT INTO product(brd_id, price, deal_address, prd_type, buyer_id) VALUES(52, '20000', '서울 금천구', '교재', 'choi_gr');

-- board_comment 더미 데이터 (parent_id 임의 작성)
INSERT INTO board_comment(parent_id, com_content, user_id) VALUES(10, '행복하세요 ^-^', 'choi_gr');
INSERT INTO board_comment(parent_id, com_content, user_id) VALUES(11, '행복하세요 ^-^', 'choi_yj');
INSERT INTO board_comment(parent_id, com_content, user_id) VALUES(12, '행복하세요 ^-^', 'choi_jh');
INSERT INTO board_comment(parent_id, com_content, user_id) VALUES(13, '행복하세요 ^-^', 'choi_sz');
INSERT INTO board_comment(parent_id, com_content, user_id) VALUES(14, '행복하세요 ^-^', 'choi_gd');
INSERT INTO board_comment(parent_id, com_content, user_id) VALUES(15, '행복하세요 ^-^', 'choi_ma');
INSERT INTO board_comment(parent_id, com_content, user_id) VALUES(16, '행복하세요 ^-^', 'choi_yl');
INSERT INTO board_comment(parent_id, com_content, user_id) VALUES(17, '행복하세요 ^-^', 'choi_jy');
INSERT INTO board_comment(parent_id, com_content, user_id) VALUES(18, '행복하세요 ^-^', 'choi_ny');
INSERT INTO board_comment(parent_id, com_content, user_id) VALUES(19, '행복하세요 ^-^', 'choi_je');
INSERT INTO board_comment(parent_id, com_content, user_id) VALUES(20, '행복하세요 ^-^', 'choi_jj');
INSERT INTO board_comment(parent_id, com_content, user_id) VALUES(21, '행복하세요 ^-^', 'choi_hj');
INSERT INTO board_comment(parent_id, com_content, user_id) VALUES(22, '행복하세요 ^-^', 'choi_my');




-- 관계 설정(개발 끝나고 나중에 erd 보여주기용, join문 작성시 참고용)
alter table board add foreign key(user_id) REFERENCES user(user_id);
alter table board add foreign key(cate_main, cate_sub) REFERENCES categories(cate_main, cate_sub);

alter table product add foreign key(brd_id) REFERENCES board(brd_id);
alter table product add foreign key(buyer_id) REFERENCES user(user_id);

alter table board_comment add foreign key(parent_id) REFERENCES board(brd_id); -- 이건 댓글을 참조하기도 해서 풀어놓아야 되나 싶슴다..
alter table board_comment add foreign key(user_id) REFERENCES user(user_id);

alter table report add foreign key (brd_id) REFERENCES board(brd_id);












