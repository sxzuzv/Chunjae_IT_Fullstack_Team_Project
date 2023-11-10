create database huruTDB;
use huruTDB;
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
-- 수업 테이블teachers
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
-- 레슨 테이블
create table IF NOT EXISTS lessons (
	lesson_idx					    INT					Primary key auto_increment,
    lesson_name				varchar(100)		NOT NULL,
    class_id				INT					NOT NULL,
    lessons_seconds			INT					NOT NULL,
    FOREIGN KEY (class_id) REFERENCES classes(class_idx)
    on update CASCADE -- class idx 변경 시, lessons 테이블의 class_id도 변경된다.
    on delete CASCADE
);
-- 리뷰 테이블@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@속성 이름 변경
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
create table IF NOT EXISTS answers (
    answer_idx int PRIMARY KEY AUTO_INCREMENT,
    contents text not null,
    answer_date DATETIME DEFAULT NOW(),
    teacher_id int not null,
    question_id int not null,
    Foreign Key (teacher_id) REFERENCES teachers(teacher_idx)
    on update CASCADE
    on delete CASCADE,
    Foreign Key (question_id) REFERENCES questions(question_idx)
    on update CASCADE
    on delete CASCADE
);
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
-- @@@@@@@@@@@@ lessons_seconds -> study_seconds
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