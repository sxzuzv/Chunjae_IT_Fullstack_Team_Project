-- user(선생님) 더미 데이터
INSERT INTO user(user_id, user_pwd, user_name, user_nick, user_email, user_cp, user_addr, user_daddr, user_school) VALUES('choi_gr', 'choi_gr', '최경락', 'raknrak', 'choi_gr@gmail.com', '010-1111-2222', '서울 금천구 디지털로9길 23', '마리오아울렛 2관', '강화고등학교');
INSERT INTO user(user_id, user_pwd, user_name, user_nick, user_email, user_cp, user_addr, user_daddr, user_school) VALUES('choi_yj', 'choi_yj', '최영주', '한라봉', 'choi_yj@gmail.com', '010-2222-3333', '서울 금천구 디지털로9길 23', '마리오아울렛 2관', '강화고등학교');
INSERT INTO user(user_id, user_pwd, user_name, user_nick, user_email, user_cp, user_addr, user_daddr, user_school) VALUES('choi_jh', 'choi_jh', '최재혁', '부자', 'choi_jh@gmail.com', '010-4444-5555', '서울 금천구 디지털로9길 23', '마리오아울렛 2관', '강화고등학교');
INSERT INTO user(user_id, user_pwd, user_name, user_nick, user_email, user_cp, user_addr, user_daddr, user_school) VALUES('choi_sz', 'choi_sz', '최수진', '수수', 'choi_sj@gmail.com', '010-6666-7777', '서울 금천구 디지털로9길 23', '마리오아울렛 2관', '강화고등학교');
INSERT INTO user(user_id, user_pwd, user_name, user_nick, user_email, user_cp, user_addr, user_daddr, user_school) VALUES('choi_gd', 'choi_gd', '최길동', '길길', 'choi_gd@gmail.com', '010-0000-0000', '서울 금천구 디지털로9길 23', '마리오아울렛 2관', '천재교육초등학교');
INSERT INTO user(user_id, user_pwd, user_name, user_nick, user_email, user_cp, user_addr, user_daddr, user_school) VALUES('choi_ma', 'choi_ma', '최민아', '민민', 'choi_ma@gmail.com', '010-0000-0000', '서울 금천구 디지털로9길 23', '마리오아울렛 2관', '천재교육중학교');
INSERT INTO user(user_id, user_pwd, user_name, user_nick, user_email, user_cp, user_addr, user_daddr, user_school) VALUES('choi_yl', 'choi_yl', '최예림', '림림', 'choi_yl@gmail.com', '010-0000-0000', '서울 금천구 디지털로9길 23', '마리오아울렛 2관', '천재교육고등학교');
INSERT INTO user(user_id, user_pwd, user_name, user_nick, user_email, user_cp, user_addr, user_daddr, user_school) VALUES('choi_jy', 'choi_jy', '최주영', '영영', 'choi_jy@gmail.com', '010-0000-0000', '서울 금천구 디지털로9길 23', '마리오아울렛 2관', '천재교육초등학교');
INSERT INTO user(user_id, user_pwd, user_name, user_nick, user_email, user_cp, user_addr, user_daddr, user_school) VALUES('choi_ny', 'choi_ny', '최나연', '나나', 'choi_ny@gmail.com', '010-0000-0000', '서울 금천구 디지털로9길 23', '마리오아울렛 2관', '천재교육중학교');
INSERT INTO user(user_id, user_pwd, user_name, user_nick, user_email, user_cp, user_addr, user_daddr, user_school) VALUES('choi_je', 'choi_je', '최주은', '은은', 'choi_je@gmail.com', '010-0000-0000', '서울 금천구 디지털로9길 23', '마리오아울렛 2관', '천재교육고등학교');
INSERT INTO user(user_id, user_pwd, user_name, user_nick, user_email, user_cp, user_addr, user_daddr, user_school) VALUES('choi_jj', 'choi_jj', '최지연', '연연', 'choi_jy@gmail.com', '010-0000-0000', '서울 금천구 디지털로9길 23', '마리오아울렛 2관', '천재교육초등학교');
INSERT INTO user(user_id, user_pwd, user_name, user_nick, user_email, user_cp, user_addr, user_daddr, user_school) VALUES('choi_hj', 'choi_hj', '최지혜', '지지', 'choi_jh@gmail.com', '010-0000-0000', '서울 금천구 디지털로9길 23', '마리오아울렛 2관', '천재교육중학교');
INSERT INTO user(user_id, user_pwd, user_name, user_nick, user_email, user_cp, user_addr, user_daddr, user_school) VALUES('choi_my', 'choi_my', '최미연', '미미', 'choi_my@gmail.com', '010-0000-0000', '서울 금천구 디지털로9길 23', '마리오아울렛 2관', '천재교육고등학교');

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
INSERT INTO product(brd_id, price, deal_address, prd_type, buyer_id) VALUES(47, '15000', '일상용품', 'choi_ma');
INSERT INTO product(brd_id, price, deal_address, prd_type, buyer_id) VALUES(48, '25000', '교구', 'choi_gd');
INSERT INTO product(brd_id, price, deal_address, prd_type, buyer_id) VALUES(49, '20000', '교구', 'choi_sz');
INSERT INTO product(brd_id, price, deal_address, prd_type, buyer_id) VALUES(50, '3000', '일상용품', 'choi_jh');
INSERT INTO product(brd_id, price, deal_address, prd_type, buyer_id) VALUES(51, '23000', '교구', 'choi_yj');
INSERT INTO product(brd_id, price, deal_address, prd_type, buyer_id) VALUES(52, '20000', '교재', 'choi_gr');

-- board_comment 더미 데이터 (parent_id는 임의로 작성)
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