# 🍓 ‘후루T’ : 초등학생을 위한 온라인 코딩 학습 프로그램
천재교육에서 운영 중인 ‘밀크T’ 서비스를 참고하여 초등학생을 대상으로 한 온라인 코딩 학습 프로그램 ‘후루T’를 만들었습니다. 코딩 교육 시장이 활성화되어 있지만, 초등학생을 대상으로 한 코딩 강의 서비스는 부족하다고 생각되어 주제를 선정하게 되었습니다.
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

<br>

- SQL 문

| 구분 | 링크 |
| --- | --- |
| 테이블 생성 | [create_table.sql](https://github.com/ChunjaeHuruT/HuruT/blob/main/sql/create_table.sql)   
| 데이터 입력 | [insert_value.sql](https://github.com/ChunjaeHuruT/HuruT/blob/main/sql/insert_value.sql)   |




<br><br>

## 🍑 How to Run in IntelliJ
1. File > Project Structure > Project Settings > Modules > Dependencies > + > 1. Add Jars에 [lombok.jar](lib), [mariadb-java-client-3.2.0.jar](lib), [mybatis-3.5.13.jar](lib) 파일을 추가한다.
2. HuruTMain 실행

<br><br>

## 🍇 Description
- ### 로그인/회원가능
  - 로그인 : DB에 등록된 회원정보가 일치하면 로그인된다. <br>
![teampj1_Login](https://github.com/Kang-YunSik/jsp_study/assets/145963623/674d41d1-fbd0-4963-b653-68e04544d880)


  - 회원가입 : User_ID가 중복되지 않는 선에서 새로운 회원으로 가입한다.<br>
![teampj1_SignUp](https://github.com/Kang-YunSik/jsp_study/assets/145963623/747174b3-5fe5-4e1c-89fe-67260a107027) ​
​
- ### 학생 주요기능
  - 수업 등록 : 학생이 원하는 수업을 등록할 수 있다. <br>
![teampj1_Class_purchase](https://github.com/Kang-YunSik/jsp_study/assets/145963623/d8a21c61-2c18-45d4-be67-104654aa7343)


  - 수업 듣기 : 학생이 원하는 학습을 수강할 수 있다. <br>
![teampj1_lesson_start](https://github.com/Kang-YunSik/jsp_study/assets/145963623/33e5b8cf-a8bd-4da4-88ba-8060569d419e)

​​
- ### 학생 부가기능
  - 강의평하기: 학생이 수업에 대한 강의평과 평점을 남긴다. <br>
![teampj1_evaluation](https://github.com/Kang-YunSik/jsp_study/assets/145963623/9e56e493-2e86-46d4-8ec6-54f7eab903d0)


  - 강의평보기: 다른 학생이 남긴 강의평을 본다. <br> (🛠수정필요)


  - 질문하기: 학생이 본인 수업에 질문을 등록/수정/삭제 한다. <br>
![teampj1_question](https://github.com/Kang-YunSik/jsp_study/assets/145963623/b048e94b-69d6-4d4f-be42-1cbf017b520c)


- ### 선생님 주요기능
  - 수업관리 : 수업을 등록/수정/삭제 한다. <br>
![teampj1_class_register](https://github.com/Kang-YunSik/jsp_study/assets/145963623/0f3348fb-9297-4c37-b5e9-9074e8c4ca38)


  - 학습관리 : 학습을 등록/삭제 한다. <br>
![teampj1_lesson_register](https://github.com/Kang-YunSik/jsp_study/assets/145963623/2d973cd2-d5b2-45a5-8c18-ee4e888bb148)


- ### 선생님 부가기능
  - 질문에 답변하기 : 학생이 등록한 질문에 답변을 한다. <br>
 (❌ 미구현)<br>

​
---
