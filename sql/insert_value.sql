
-- Active: 1697765718094@@127.0.0.1@3306@huruTDB
-- 학생
insert into students(student_email, student_nickname, student_password) values("chunjae", "이천재", "12345");
insert into students(student_email, student_nickname, student_password) values("chunjae2", "강혜진", "12345");
insert into students(student_email, student_nickname, student_password) values("chunjae3", "윤빈", "12345");
insert into students(student_email, student_nickname, student_password) values("chunjae4", "김연하", "12345");
insert into students(student_email, student_nickname, student_password) values("chunjae5", "오현진", "12345");

-- 선생님
insert into teachers(teacher_email, teacher_name, teacher_password) VALUES('teacher1', '이보영', '12345');
insert into teachers(teacher_email, teacher_name, teacher_password) VALUES('teacher2', '전수진', '12345');
insert into teachers(teacher_email, teacher_name, teacher_password) VALUES('teacher3', '김라나', '12345');
insert into teachers(teacher_email, teacher_name, teacher_password) VALUES('teacher4', '김연재', '12345');
insert into teachers(teacher_email, teacher_name, teacher_password) VALUES('teacher5', '박정은', '12345');

-- class
insert into classes(class_name, teacher_id, price, difficulty) VALUES('Algorithm', 1, 50000, 3);
insert into classes(class_name, teacher_id, price, difficulty) VALUES('Spring', 1, 20000, 3);
-- insert into classes(class_name, teacher_id, price, difficulty) VALUES('Java', 1, 34000, 1);
insert into classes(class_name, teacher_id, price, difficulty) VALUES('Python', 1, 25000, 1);
insert into classes(class_name, teacher_id, price, difficulty) VALUES('React.js', 1, 35000, 1);
insert into classes(class_name, teacher_id, price, difficulty) VALUES('Node.js', 4, 40000, 2);
insert into classes(class_name, teacher_id, price, difficulty) VALUES('Unity', 4, 45000, 3);
insert into classes(class_name, teacher_id, price, difficulty) VALUES('NestJS', 5, 25000, 2);
-- insert into classes(class_name, teacher_id, price, difficulty) VALUES('MySQL', 6, 30000, 1);


-- lesson
insert into lessons(lesson_name, class_id, lessons_seconds) values('Algorithm: lesson 1', 1, 3000);
insert into lessons(lesson_name, class_id, lessons_seconds) values('Algorithm: lesson 2', 1, 2700);
insert into lessons(lesson_name, class_id, lessons_seconds) values('Algorithm: lesson 3', 1, 3000);
insert into lessons(lesson_name, class_id, lessons_seconds) values('Algorithm: lesson 4', 1, 3300);
insert into lessons(lesson_name, class_id, lessons_seconds) values('Algorithm: lesson 5', 1, 2400);
update classes set lecture_cnt = 5, seconds = 14400 where class_idx = 1;

insert into lessons(lesson_name, class_id, lessons_seconds) values('Spring: lesson 1', 2, 3000);
insert into lessons(lesson_name, class_id, lessons_seconds) values('Spring: lesson 2', 2, 2700);
insert into lessons(lesson_name, class_id, lessons_seconds) values('Spring: lesson 3', 2, 3000);
insert into lessons(lesson_name, class_id, lessons_seconds) values('Spring: lesson 4', 2, 3300);
insert into lessons(lesson_name, class_id, lessons_seconds) values('Spring: lesson 5', 2, 2400);
insert into lessons(lesson_name, class_id, lessons_seconds) values('Spring: lesson 6', 2, 3300);
insert into lessons(lesson_name, class_id, lessons_seconds) values('Spring: lesson 7', 2, 2400);
update classes set lecture_cnt = 7, seconds = 20100 where class_idx = 2;

insert into lessons(lesson_name, class_id, lessons_seconds) values('Python: lesson 1', 3, 3000);
insert into lessons(lesson_name, class_id, lessons_seconds) values('Python: lesson 2', 3, 2700);
insert into lessons(lesson_name, class_id, lessons_seconds) values('Python: lesson 3', 3, 3000);
insert into lessons(lesson_name, class_id, lessons_seconds) values('Python: lesson 4', 3, 3300);
update classes set lecture_cnt = 4, seconds = 12000 where class_idx = 3;


insert into lessons(lesson_name, class_id, lessons_seconds) values('React.js: lesson 1', 4, 3000);
insert into lessons(lesson_name, class_id, lessons_seconds) values('React.js: lesson 2', 4, 2700);
insert into lessons(lesson_name, class_id, lessons_seconds) values('React.js: lesson 3', 4, 3000);
insert into lessons(lesson_name, class_id, lessons_seconds) values('React.js: lesson 4', 4, 3300);
insert into lessons(lesson_name, class_id, lessons_seconds) values('React.js: lesson 5', 4, 3000);
insert into lessons(lesson_name, class_id, lessons_seconds) values('React.js: lesson 6', 4, 3300);
insert into lessons(lesson_name, class_id, lessons_seconds) values('React.js: lesson 7', 4, 3000);
insert into lessons(lesson_name, class_id, lessons_seconds) values('React.js: lesson 8', 4, 3300);
insert into lessons(lesson_name, class_id, lessons_seconds) values('React.js: lesson 9', 4, 3000);
insert into lessons(lesson_name, class_id, lessons_seconds) values('React.js: lesson 10', 4, 2700);
update classes set lecture_cnt = 10, seconds = 30300 where class_idx = 4;

insert into lessons(lesson_name, class_id, lessons_seconds) values("Node.js: lesson 1", 5, 2500);
insert into lessons(lesson_name, class_id, lessons_seconds) values("Node.js: lesson 2", 5, 2500);
insert into lessons(lesson_name, class_id, lessons_seconds) values("Node.js: lesson 3", 5, 2500);
insert into lessons(lesson_name, class_id, lessons_seconds) values("Node.js: lesson 4", 5, 2500);
insert into lessons(lesson_name, class_id, lessons_seconds) values("Node.js: lesson 5", 5, 2500);
update classes set lecture_cnt = 5, seconds = 12500 where class_idx = 5;

insert into lessons(lesson_name, class_id, lessons_seconds) values("Unity: lesson 1", 6, 3000);
insert into lessons(lesson_name, class_id, lessons_seconds) values("Unity: lesson 2", 6, 3100);
insert into lessons(lesson_name, class_id, lessons_seconds) values("Unity: lesson 3", 6, 3200);
insert into lessons(lesson_name, class_id, lessons_seconds) values("Unity: lesson 4", 6, 3300);
insert into lessons(lesson_name, class_id, lessons_seconds) values("Unity: lesson 5", 6, 3400);
update classes set lecture_cnt = 5, seconds = 16000 where class_idx = 6;

insert into lessons(lesson_name, class_id, lessons_seconds) values("NestJS: lesson 1", 7, 2500);
insert into lessons(lesson_name, class_id, lessons_seconds) values("NestJS: lesson 2", 7, 1700);
insert into lessons(lesson_name, class_id, lessons_seconds) values("NestJS: lesson 3", 7, 2900);
insert into lessons(lesson_name, class_id, lessons_seconds) values("NestJS: lesson 4", 7, 3300);
insert into lessons(lesson_name, class_id, lessons_seconds) values("NestJS: lesson 5", 7, 4600);
update classes set lecture_cnt = 5, seconds = 15000 where class_idx = 7;

-- questions 
-- 1번 학생 수업의 질문
insert into questions(title, contents, student_id, class_id) values('10번 알고리즘 질문', 'a에서 b가 되는 과정이 잘 이해가 되지 않습니다.', 1, 1);
insert into questions(title, contents, student_id, class_id) values('리액트는 왜 쓰는 건가요?', '설명 부탁드립니다', 1, 4);
insert into questions(title, contents, student_id, class_id) values('NestJS는 누가 만든건가요?', '답변 부탁드립니다', 1, 7);

-- 2번 학생의 질문
insert into questions(title, contents, student_id, class_id) values('Spring이 너무 어려워요 ㅠㅠ', '어디서부터 공부해야 될까요?', 2, 2);
insert into questions(title, contents, student_id, class_id) values('이 강의를 들으면 게임을 만들 수 있나요?', 'ㅈㄱㄴ', 2, 6);

-- 3번 학생의 질문
insert into questions(title, contents, student_id, class_id) values('수강 철회가 가능한가요?', '잘 못 신청했는데, 수강 철회해주세요', 3, 3);

-- 4번 학생의 질문
insert into questions(title, contents, student_id, class_id) values('이 수업을 들으려면 JS를 알고 있어야 하나요?', '제가 JS는 처음인데 따라갈 수 있을지 걱정입니다...', 4, 5);

-- 5번 학생의 질문
insert into questions(title, contents, student_id, class_id) values('강의 잘봤습니다', '더 많은 문제를 풀어보고 싶은데 추천해주세요.', 5, 1);
insert into questions(title, contents, student_id, class_id) values('설정 문의', '영상과 똑같이 설정했는데 에러가 발생합니다.', 5, 2);
insert into questions(title, contents, student_id, class_id) values('오류가 있는 것 같습니다', '3번째 학습에서 말씀하신 내용이 인터넷 내용과 다릅니다.', 5, 4);
insert into questions(title, contents, student_id, class_id) values('2번째 학습 질문', '잘 이해가 되지 않습니다.', 5, 5);
insert into questions(title, contents, student_id, class_id) values('강의 내용이 너무 어려워요', '더 쉬운 강의를 추천해주실 수 있나요?', 5, 7);

-- review
insert into reviews(class_id, student_id, contents, rating) values(1, 1, "설명이 이해하기 쉬웠어요.", 3);
insert into reviews(class_id, student_id, contents, rating) values(1, 2, "알고리즘에 대해서 자세히 알게 됐어요.", 4);
insert into reviews(class_id, student_id, contents, rating) values(1, 3, "이제 알고리즘이 두렵지 않아요!", 5);

insert into reviews(class_id, student_id, contents, rating) values(2, 1, "이해하기 어려웠어요.", 3);
insert into reviews(class_id, student_id, contents, rating) values(2, 4, "스프링에 대한 가닥을 잡고 싶었는데 아쉬워요.", 2);
insert into reviews(class_id, student_id, contents, rating) values(2, 5, "덕분에 스프링이 재밌어졌어요!", 5);

insert into reviews(class_id, student_id, contents, rating) values(3, 2, "파이썬에 대한 가닥이 잡혔어요.", 4);
insert into reviews(class_id, student_id, contents, rating) values(3, 4, "설명이 너무 어려워요. 실망했습니다.", 1);
insert into reviews(class_id, student_id, contents, rating) values(3, 5, "가격 대비 좋았습니다.", 3);

insert into reviews(class_id, student_id, contents, rating) values(4, 1, "가격 대비 별로였어요 ㅠㅠ", 2);
insert into reviews(class_id, student_id, contents, rating) values(4, 3, "리액트가 이런 거였군요!", 4);
insert into reviews(class_id, student_id, contents, rating) values(4, 4, "리액트 최강자 ,, 감사합니다!", 5);

insert into reviews(class_id, student_id, contents, rating) values(5, 2, "강의 내용에 비해 가격이 비싸다고 느껴집니다.", 3);
insert into reviews(class_id, student_id, contents, rating) values(5, 3, "덕분에 첫걸음을 잘 뗄 수 있었습니다.", 4);
insert into reviews(class_id, student_id, contents, rating) values(5, 4, "실망했습니다.", 2);

insert into reviews(class_id, student_id, contents, rating) values(6, 1, "강의 듣고 취업했습니다 감사합니다 !!!", 5);
insert into reviews(class_id, student_id, contents, rating) values(6, 2, "설명 너무 잘해주세요 감사합니다!", 5);
insert into reviews(class_id, student_id, contents, rating) values(6, 3, "덕분에 유니티 고수가 된 것 같아요!", 5);

insert into reviews(class_id, student_id, contents, rating) values(7, 4, "가격 더 낮추셔도 될 것 같아요 ...", 1);
insert into reviews(class_id, student_id, contents, rating) values(7, 5, "조금 감이 잡혔어요.", 4);
insert into reviews(class_id, student_id, contents, rating) values(7, 1, "보통이었습니다.", 3);