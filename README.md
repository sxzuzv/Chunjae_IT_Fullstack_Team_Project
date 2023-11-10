# 🍓 ‘후루티’ : 초등학생을 위한 온라인 코딩 학습 프로그램
천재교육에서 운영 중인 ‘밀크T’ 서비스를 참고하여 초등학생을 대상으로 한 온라인 코딩 학습 프로그램 ‘후루티’를 만들었습니다. 코딩 교육 시장이 활성화되어 있지만, 초등학생을 대상으로 한 코딩 강의 서비스는 부족하다고 생각되어 주제를 선정하게 되었습니다.
<br>본 프로젝트를 통해 MariaDB와 MyBatis 사용법, GitHub를 활용한 팀 협업 방법을 익힐 수 있었습니다.


<br>

## 🍊 팀원 GitHub
- 강윤식 : [Kang-YunSik (github.com)](https://github.com/Kang-YunSik)
- 노하은 : [00blowup (Haeun Noh) (github.com)](https://github.com/00blowup)
- 변재혁 : [jaehyukpyon2 (github.com)](https://github.com/jaehyukpyon2)
- 신수진 : [sxzuzv (backzxn) (github.com)](https://github.com/sxzuzv)
- 이지연 : [thegreatjy (Jiyeon Lee) (github.com)](https://github.com/thegreatjy)
<br><br><br>
## 🍋 Development Enviroment

- IntelliJ
- Java 11
- MariaDB 3.2.0
- MyBatis 3.5.13

<br><br>

## 🍏 Prerequisite
- MariaDB 3306 포트로 연결
    - 포트 수정 시, mybatis-config.xml 파일 수정
- huruTDB 데이터베이스, students 테이블, teachers 테이블, classes 테이블, lessons 테이블, reviews 테이블, questions 테이블, answers 테이블, student_class 테이블, student_lesson 테이블 생성
    
    ```sql
    -- 학생 테이블
    CREATE TABLE IF NOT EXISTS students (
    	student_idx		  			    INT					Primary key auto_increment,				
    	student_email	  			VARCHAR(50)			NOT NULL UNIQUE,
        student_nickname	  	VARCHAR(20)			NOT NULL UNIQUE,
        student_password		VARCHAR(50)			NOT NULL,
        student_joined 			DATETIME			default now() comment '회원 가입 날짜',
        student_points 			INT					default 0 comment '소지 포인트'
    );
    
    -- 선생님 테이블
    CREATE TABLE IF NOT EXISTS teachers (
    	teacher_idx		  				INT					Primary key auto_increment,				
    	teacher_email	  			VARCHAR(50)			NOT NULL UNIQUE comment 'email 형식의 사용자 아이디',
        teacher_name		  	VARCHAR(20)			NOT NULL,
        teacher_password		VARCHAR(50)			NOT NULL,
        teacher_joined 			DATETIME			default now() comment '회원 가입 날짜',
        teacher_points 			INT					default 0 comment '소지 포인트',
        class_cnt				INT					default 0 comment '총 담당 수업 개수'
    );
    
    -- 수업 테이블
    CREATE TABLE IF NOT EXISTS classes (
    	class_idx		  			    INT					Primary key auto_increment,				
    	class_name	  			VARCHAR(100)		NOT NULL,
        teacher_id			  	INT					NOT NULL comment '담당 선생님 idx',
        price					INT					NOT NULL,
        student_cnt 			INT					default 0 comment '환불 제외 누적 수강생',
        rating 					decimal				default NULL,
        lecture_cnt				INT					default 0,
    	seconds					INT					default 0,
        difficulty				INT					NOT NULL comment '난이도: 1쉬움-2중간-3어려움',
        FOREIGN KEY (teacher_id) REFERENCES teachers(teacher_idx)
        on update CASCADE -- 선생님 idx 변경 시, classes 테이블의 teacher_id도 변경된다.
        on delete RESTRICT -- 담당하는 수업이 있는 선생님은 선생님 테이블에서 튜플 삭제가 불가능하다. set null or restict 논의 해볼 것
    );
    
    -- 학습 테이블
    create table IF NOT EXISTS lessons (
    	lesson_idx					    INT					Primary key auto_increment,
        lesson_name				varchar(100)		NOT NULL,
        class_id				INT					NOT NULL,
        lessons_seconds			INT					NOT NULL,
        FOREIGN KEY (class_id) REFERENCES classes(class_idx)
        on update CASCADE -- class idx 변경 시, lessons 테이블의 class_id도 변경된다.
        on delete CASCADE
    );
    
    -- 강의평 테이블
    create table IF NOT EXISTS reviews (
    	review_idx					    INT					Primary key auto_increment,
        class_id				INT					NOT NULL,
        student_id				int			        NOT NULL,
        contents				text				NOT NULL,
        review_date     		DATETIME  			default now(),
        rating					INT					default NULL COMMENT '평점: 1낮음-5높음',
        FOREIGN KEY (class_id) REFERENCES classes(class_idx)
        on update CASCADE
        on delete CASCADE,
        FOREIGN KEY (student_id) REFERENCES students(student_idx)
        on update CASCADE
        on delete CASCADE
    );
    
    -- 질문 테이블
    create table IF NOT EXISTS questions (
    	question_idx					    INT					Primary key auto_increment,
        title					varchar(100)		NOT NULL,
        contents				TEXT				NOT NULL,
        student_id				INT					NOT NULL,
        class_id     			INT					NOT NULL,
        question_date			DATETIME		    default NOW(),
        FOREIGN KEY (student_id) REFERENCES students(student_idx)
        on update CASCADE
        on delete CASCADE,
        FOREIGN KEY (class_id) REFERENCES classes(class_idx)
        on update CASCADE
        on delete CASCADE
    );
    
    -- 학생, 수업 N:M 테이블
    create table IF NOT EXISTS student_class (
        student_class_idx int PRIMARY KEY AUTO_INCREMENT,
        student_id int,
        class_id int,
        Foreign Key (student_id) REFERENCES students(student_idx)
        on update CASCADE
        on delete CASCADE,
        Foreign Key (class_id) REFERENCES classes(class_idx)
        on update CASCADE
        on delete CASCADE
    );
    
    -- 학생, 학습 1:N 테이블
    create table IF NOT EXISTS student_lesson (
        student_lesson_idx int PRIMARY KEY AUTO_INCREMENT,
        student_id int,
        lesson_id int,
        finished boolean DEFAULT false COMMENT '학습 완료 여부',
        lesson_seconds int DEFAULT 0 COMMENT '학생의 학습 시간',
        Foreign Key (student_id) REFERENCES students(student_idx)
        on update CASCADE
        on delete CASCADE,
        Foreign Key (lesson_id) REFERENCES lessons(lesson_idx)
        on update CASCADE
        on delete CASCADE
    );
    ```
<br>

- 테이블별 데이터 입력
```sql
-- 학생 데이터
insert into students(student_email, student_nickname, student_password) values("chunjae", "이천재", "12345");
insert into students(student_email, student_nickname, student_password) values("chunjae2", "강혜진", "12345");
insert into students(student_email, student_nickname, student_password) values("chunjae3", "윤빈", "12345");
insert into students(student_email, student_nickname, student_password) values("chunjae4", "김연하", "12345");
insert into students(student_email, student_nickname, student_password) values("chunjae5", "오현진", "12345");

-- 선생님 데이터
insert into teachers(teacher_email, teacher_name, teacher_password) VALUES('teacher1', '이보영', '12345');
insert into teachers(teacher_email, teacher_name, teacher_password) VALUES('teacher2', '전수진', '12345');
insert into teachers(teacher_email, teacher_name, teacher_password) VALUES('teacher3', '김라나', '12345');
insert into teachers(teacher_email, teacher_name, teacher_password) VALUES('teacher4', '김연재', '12345');
insert into teachers(teacher_email, teacher_name, teacher_password) VALUES('teacher5', '박정은', '12345');

-- 수업 데이터
insert into classes(class_name, teacher_id, price, difficulty) VALUES('Algorithm', 1, 50000, 3);
insert into classes(class_name, teacher_id, price, difficulty) VALUES('Spring', 1, 20000, 3);
-- insert into classes(class_name, teacher_id, price, difficulty) VALUES('Java', 1, 34000, 1);
insert into classes(class_name, teacher_id, price, difficulty) VALUES('Python', 1, 25000, 1);
insert into classes(class_name, teacher_id, price, difficulty) VALUES('React.js', 1, 35000, 1);
insert into classes(class_name, teacher_id, price, difficulty) VALUES('Node.js', 4, 40000, 2);
insert into classes(class_name, teacher_id, price, difficulty) VALUES('Unity', 4, 45000, 3);
insert into classes(class_name, teacher_id, price, difficulty) VALUES('NestJS', 5, 25000, 2);

-- 학습 데이터
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

-- 질문 데이터
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

-- 강의평 데이터
insert into reviews(class_id, student_id, contents, rating) values(1, 1, "설명이 이해하기 쉬웠어요", 3);
insert into reviews(class_id, student_id, contents, rating) values(1, 2, "좋았어요", 4);
insert into reviews(class_id, student_id, contents, rating) values(1, 3, "재밌었어요", 5);

insert into reviews(class_id, student_id, contents, rating) values(2, 1, "이해하기 어려웠어요", 3);
insert into reviews(class_id, student_id, contents, rating) values(2, 4, "어려웠어요", 2);
insert into reviews(class_id, student_id, contents, rating) values(2, 5, "재밌었어요!", 5);

insert into reviews(class_id, student_id, contents, rating) values(3, 2, "어렵지만 재밌었어요!", 4);
insert into reviews(class_id, student_id, contents, rating) values(3, 4, "설명이 너무 어려워요", 1);
insert into reviews(class_id, student_id, contents, rating) values(3, 5, "보통이었어요", 3);

insert into reviews(class_id, student_id, contents, rating) values(4, 1, "별로였어요 ㅠㅠ", 2);
insert into reviews(class_id, student_id, contents, rating) values(4, 3, "좋았어요", 4);
insert into reviews(class_id, student_id, contents, rating) values(4, 4, "감사합니다!", 5);

insert into reviews(class_id, student_id, contents, rating) values(5, 2, "어려웠어요", 3);
insert into reviews(class_id, student_id, contents, rating) values(5, 3, "좋았어요!", 4);
insert into reviews(class_id, student_id, contents, rating) values(5, 4, "ㅠㅠ 너무 어려웠어요", 2);

insert into reviews(class_id, student_id, contents, rating) values(6, 1, "선생님 너무 좋아요!!!", 5);
insert into reviews(class_id, student_id, contents, rating) values(6, 2, "재미있었어요 ㅎㅎ", 5);
insert into reviews(class_id, student_id, contents, rating) values(6, 3, "너무 너무 좋았어요 !!!", 5);

insert into reviews(class_id, student_id, contents, rating) values(7, 4, "너무 어려워요 ㅠ", 1);
insert into reviews(class_id, student_id, contents, rating) values(7, 5, "괜찮았어요", 4);
insert into reviews(class_id, student_id, contents, rating) values(7, 1, "그저 그랬어요", 3);
```

<br><br>

## 🍑 How to Run in IntelliJ
1. File > Project Structure > Project Settings > Modules > Dependencies > + > 1. Add Jars에 [lombok.jar](lib), [mariadb-java-client-3.2.0.jav](lib), [mybatis-3.5.13.jar](lib) 파일을 추가한다.
2. HuruTMain 실행

<br><br>

## 🍇 Description
- ### 로그인/회원가능
  - 로그인 : DB에 등록된 회원정보가 일치하면 로그인된다. <br>
![teampj1_Login](https://github.com/Kang-YunSik/jsp_study/assets/145963623/674d41d1-fbd0-4963-b653-68e04544d880)


  - 회원가입 : User_ID가 중복되지 않는 선에서 새로운 회원으로 가입한다.<br>
![teampj1_SignUp](https://github.com/Kang-YunSik/jsp_study/assets/145963623/747174b3-5fe5-4e1c-89fe-67260a107027) 

- ### 학생 주요기능
  - 수업 등록 : 학생이 원하는 수업을 등록할 수 있다. <br>
![teampj1_Class_purchase](https://github.com/Kang-YunSik/jsp_study/assets/145963623/d8a21c61-2c18-45d4-be67-104654aa7343)


  - 수업 듣기 : 학생이 원하는 학습을 수강할 수 있다. <br>
![teampj1_lesson_start](https://github.com/Kang-YunSik/jsp_study/assets/145963623/33e5b8cf-a8bd-4da4-88ba-8060569d419e)


- ### 학생 부가기능
  - 강의평하기: 학생이 수업에 대한 강의평과 평점을 남긴다. <br>
![teampj1_evaluation](https://github.com/Kang-YunSik/jsp_study/assets/145963623/9e56e493-2e86-46d4-8ec6-54f7eab903d0)


  - 강의평보기: 다른 학생이 남긴 강의평을 본다. <br>
[강의평보기 영상](http://#) <br>

  - 질문하기: 학생이 본인 수업에 질문을 등록/수정/삭제 한다. <br>
![teampj1_question](https://github.com/Kang-YunSik/jsp_study/assets/145963623/b048e94b-69d6-4d4f-be42-1cbf017b520c)


- ### 선생님 주요기능
  - 수업관리 : 수업을 등록/수정/삭제 한다. <br>
![teampj1_class_register](https://github.com/Kang-YunSik/jsp_study/assets/145963623/0f3348fb-9297-4c37-b5e9-9074e8c4ca38)


  - 학습관리 : 학습을 등록/삭제 한다. <br>
[학습관리 영상](http://#) <br>

- ### 선생님 부가기능
  - 질문에 답변하기 : 학생이 등록한 질문에 답변을 한다. <br>
[질문에 답변달기 영상](http://#) <br>

  - 질문에 답변하기 : 수업을 등록/수정/삭제 한다. <br>
[질문에 답변달기 영상](http://#) <br>
