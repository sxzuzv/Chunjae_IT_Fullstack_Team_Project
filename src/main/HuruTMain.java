package main;

import dto.*;
import service.*;
import thread.Player;
import thread.PlayerController;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.*;

public class HuruTMain {
    
    // 필요한 서비스를 멤버로 받아오기

    // jy
    // 회원가입 서비스 객체
    static SignUpService_ys signUpService_ys = new SignUpService_ys();
    // 로그인 서비스 객체
    static LoginService_ys loginService_ys = new LoginService_ys();
    // 입력 스트림
    static BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
    // --------------------------------------------------------------
    public static StudentClassService_jh studentClassService_jh = new StudentClassService_jh();
    public static LessonService_jh lessonService_jh = new LessonService_jh();
    public static StudentLessonService_jh studentLessonService_jh = new StudentLessonService_jh();




    // 수업 관련 서비스 객체 (수업 등록/삭제/수정, 질문 보러 가기)
    static ClassService_jy classServiceJy;
    // 질문 관련 서비스 객체 (질문 조회)
    static QuestionService_jy questionServiceJy;
    // 학습 관련 서비스 객체
    static LessonService_jy lessonServiceJY;
    // 로그인된 선생님 객체. 로그인 전에는 null
    private static Teacher_jy teacherJy = null;
    public static Teacher_jy getTeacherJy(){
        return teacherJy;
    }


    // jh
    
    
    // sz

    public static void findClasses(int loginStudentIdx) {
        // sz
        // FindClasses(수업 찾기) 기능 구현
        // 1) 학생에게 현재 개설된 수업 리스트를 보여준다.
        // 2) 학생이 수업 번호를 선택한다.
        // 3) 학생에게 결제 여부를 물어본다. ('N번 수업을 결제하시겠습니까?')
        // 4) 'Y(YES)'를 입력할 시, 해당 수업 정보가 '학생_수업 테이블'에 저장된다.

        // FindClasses_sz의 객체를 생성한다. (클래스 FindClasses_sz를 인스턴스화한다.)
        FindClasses_sz findClassessz = new FindClasses_sz();
        Scanner scanner = new Scanner(System.in);
        boolean exist = false;


        while(true) {
            System.out.println("<지금 들을 수 있는 수업 목록이에요!>");
            System.out.println("=============================================================================================================================================");
            // viewAllClass() : 현재 수강 가능한 수업 목록을 보여주는 메소드
            findClassessz.viewAllClass();
            System.out.println("=============================================================================================================================================");
            System.out.println();

            System.out.print("듣고 싶은 수업을 선택해주세요. : ");
            int classNum = scanner.nextInt();
            System.out.println();

            // existClass(student_id, class_id) : 학생이 입력한 수업 번호가 student_class 테이블에 존재하는지 판단 (반환 타입 boolean)
            exist = findClassessz.existClass(loginStudentIdx, classNum);
            if(exist) {
                System.out.println("이미 구입한 수업이에요. 다른 수업을 선택해주세요!");
                System.out.println();
                continue;
            }

            System.out.print(classNum + "번 수업을 구입하시려면 'y'를 입력해주세요. : ");
            String choice = scanner.next();

            // 수업을 구매하는 메소드(purchaseClass(int studentIdx, int classNum)) 호출
            if(choice.equals("y")) {
                findClassessz.purchaseClass(1, classNum);
                break;
            }
        }
    }

    
    // ys

    
    // he
    static ReviewService_he reviewService_he = new ReviewService_he();


    // 필요한 기능을 메소드로 만들기

    // jy

    // 수업 등록
    public static void insertClass() throws Exception {
        System.out.println("**************************************************\n");
        System.out.println("아래의 정보를 입력하여 수업을 등록해 주세요.\n(난이도는 1=쉬움 / 2=보통 / 3=어려움 입니다.)\n");
        System.out.println("**************************************************\n");
        // 수업 정보 입력
        System.out.print("수업 제목 : ");
        String className = br.readLine();
        System.out.print("가격 : ");  // [리팩토링] 숫자 입력 예외 발생 시, 다시 입력 받기
        int price = Integer.parseInt(br.readLine());
        System.out.print("난이도 : "); // [리팩토링] 1-3 예외 발생 시, 다시 입력 받기
        int difficulty = Integer.parseInt(br.readLine());

        // 수업 등록
        classServiceJy.insertClass(className, price, difficulty);

        System.out.println("\n등록을 완료하였습니다.");
        System.out.println("**************************************************\n");
    }

    // 수업 조회: 본인 담당 수업만
    public static void getClasses() throws Exception {
        System.out.println("**************************************************\n");
        System.out.println("[ "+teacherJy.getTeacherName()+" 선생님의 수업 리스트 ]");
        System.out.printf("%-5s|%-17s | %10s | %5s | %6s | %-5s\n", "수업 번호", "수업 제목", "총 수업 시간", "학습 개수", "가격", "난이도");

        // 담당 수업 리스트를 불러온다.
        ArrayList<Class_jy> classesList = classServiceJy.getClasses();
        for(Class_jy classJy: classesList){
            // 수업 시간 단위 변경: 초 -> 분
            // DB에는 초 단위로 저장됨. 콘솔 출력은 분, 시간 단위로 출력
            int playtime = classJy.getSeconds() / 60;
            String playtimeStr = Integer.toString(playtime) + "분";

            if(playtime / 60 >= 1){  // 60분 이상 -> 시간 단위로 변경
                playtimeStr = Integer.toString(playtime/60).concat("시간 ");
                if(playtime%60 != 0)    playtimeStr = playtimeStr.concat(Integer.toString(playtime%60) + "분"); // 0분이면 분은 표시하지 않음
            }


            // 난이도: 숫자 -> 한글
            String difficultyStr = (classJy.getDifficulty()==1) ? "쉬움" : ((classJy.getDifficulty()==2) ? "보통" : "어려움");
            System.out.printf("%-8s %-17s %10s %10s %12s %-5s\n", classJy.getClassIdx(), classJy.getClassName(), playtimeStr,
                    classJy.getLectureCnt(), classJy.getPrice(), difficultyStr);
        }
        System.out.println("\n**************************************************\n");
    }


    // 수업 수정
    public static void updateClass() throws Exception {
        System.out.println("**************************************************\n");
        System.out.println("몇 번째 수업을 수정하시겠습니까?\n");
        System.out.println("**************************************************\n");
        System.out.print("수업 번호 : ");
        int classIdx = Integer.parseInt(br.readLine());

        // 입력받은 classIdx이 해당 선생님의 수업 리스트에 있는지 확인
        // 선생님의 담당 수업 리스트
        ArrayList<Class_jy> classesList = classServiceJy.getClasses();
        boolean inCharge = false;
        for(Class_jy classJy: classesList){ // [리팩토링] 성능 개선을 위해 map으로 구현
            if(classIdx == classJy.getClassIdx()){
                inCharge = true;
                break;
            }
        }

        // 수업 번호 잘못 입력 시, 메인 화면으로 돌아간다.
        if(!inCharge){
            System.out.println("본인이 담당하고 있는 수업이 아니기 때문에 수정하실 수 없습니다.");
            System.out.println("본인이 담당하는 수업 번호를 입력해 주세요.");
            return;
        }

        // 수업 수정 정보 입력
        System.out.print("수업 제목 : ");
        String className = br.readLine();
        System.out.print("가격 : ");  // [리팩토링] 숫자 입력 예외 발생 시, 다시 입력 받기
        int price = Integer.parseInt(br.readLine());
        System.out.println("- 난이도는 1=쉬움 / 2=보통 / 3=어려움 입니다. -");
        System.out.print("난이도 : "); // [리팩토링] 1-3 예외 발생 시, 다시 입력 받기
        int difficulty = Integer.parseInt(br.readLine());

        // 수업 수정
        classServiceJy.updateClass(classIdx, className, price, difficulty);

        System.out.println("\n수정을 완료하였습니다.");
        System.out.println("**************************************************\n");
    }

    // 수업 삭제
    public static void deleteClass() throws Exception {
        System.out.println("**************************************************\n");
        System.out.println("몇 번째 수업을 삭제하시겠습니까?\n");
        System.out.println("**************************************************\n");
        System.out.print("수업 번호 : ");
        int classIdx = Integer.parseInt(br.readLine());

        // 입력받은 classIdx이 해당 선생님의 수업 리스트에 있는지 확인
        // 선생님의 담당 수업 리스트
        ArrayList<Class_jy> classesList = classServiceJy.getClasses();
        boolean inCharge = false;
        for(Class_jy classJy: classesList){ // [리팩토링] 성능 개선을 위해 map으로 구현
            if(classIdx == classJy.getClassIdx()){
                inCharge = true;
                break;
            }
        }

        // 수업 번호 잘못 입력 시, 메인 화면으로 돌아간다.
        if(!inCharge){
            System.out.println("본인이 담당하고 있는 수업이 아니기 때문에 삭제하실 수 없습니다.");
            System.out.println("본인이 담당하는 수업 번호를 입력해 주세요.");
            return;
        }

        // 수업 삭제
        classServiceJy.deleteClass(classIdx);

        System.out.println("\n삭제를 완료하였습니다.");
        System.out.println("**************************************************\n");
    }

    // 질문 검색: 담당하고 있는 수업에 관한 질문
    public static void searchQuestions() throws Exception {
        System.out.println("**************************************************\n");
        System.out.println("몇 번째 수업의 질문을 보러 가시겠습니까?\n");
        System.out.println("**************************************************\n");
        System.out.print("수업 번호 : ");
        int classIdx = Integer.parseInt(br.readLine());

        // 입력받은 classIdx이 해당 선생님의 수업 리스트에 있는지 확인
        // 선생님의 담당 수업 리스트
        ArrayList<Class_jy> classesList = classServiceJy.getClasses();
        boolean inCharge = false;
        for(Class_jy classJy: classesList){ // [리팩토링] 성능 개선을 위해 map으로 구현
            if(classIdx == classJy.getClassIdx()){
                inCharge = true;
                break;
            }
        }

        // 수업 번호 잘못 입력 시, 메인 화면으로 돌아간다.
        if(!inCharge){
            System.out.println("본인이 담당하는 수업 번호를 입력해 주세요.");
            return;
        }

        // 질문 검색
        ArrayList<Question_jy> questionsList = questionServiceJy.getQuestions(classIdx);

        // 질문 리스트 출력
        System.out.println("\n**************************************************\n");
        System.out.println("       질문 제목        |          질문 내용        |    작성자   | 질문 작성일자"); // [리팩토링] 강의 이름이 들어가야 할 것 같음
        for(Question_jy question: questionsList){
            // 질문의 작성자 조회
            String writer = questionServiceJy.getWriter(question.getQuestionIdx());
            System.out.printf("%-20s %-20s %-10s %-20s\n", question.getTitle(), question.getContents(), writer, question.getQuestionDateString());
        }

        System.out.println("\n**************************************************\n");
    }

    // 학습 조회: ALL
    // 특정 class의 모든 lessons을 화면에 출력
    public static void getLessons(int inputByTeacherLessonManage_classIdx) throws Exception {
        // classIdx를 통해 class 객체를 하나 가져옴
        Class_jy aClass = classServiceJy.getClass(inputByTeacherLessonManage_classIdx);
        System.out.println("\n" + teacherJy.getTeacherName()+" 선생님의 ["+aClass.getClassName()+"] 학습 리스트\n");

        // 특정 class의 lessons을 불러옴
        ArrayList<Lesson_jy> lessonsList = lessonServiceJY.getLessons(inputByTeacherLessonManage_classIdx);

        // lessons 출력
        System.out.println("학습번호 |        학습제목        | 학습시간(분)\n");
        for(Lesson_jy lesson: lessonsList){
            int minutes = lesson.getLessonsSeconds()/60;
            System.out.printf("%-7s %-23s %-3s분\n", lesson.getLessonIdx(), lesson.getLessonName(), minutes);
        }
        System.out.println("\n**************************************************\n");
    }

    // 학습 등록
    // 선생님으로부터 lesson 정보 입력 받은 후, classIdx의 class에 등록
    public static void insertLesson(int classIdx) throws Exception{
        System.out.println("**************************************************\n");
        System.out.print("학습 제목 : ");
        String lessonName = br.readLine();
        System.out.print("학습 시간 (분) : ");
        int lessonsMinutes = Integer.parseInt(br.readLine());   // 선생님한테 분 단위로 입력 받음
        int lessonsSeconds = lessonsMinutes * 60;               // DB에 삽입 시, 초 단위로 삽입
        // 학습 등록
        lessonServiceJY.insertLesson(lessonName, classIdx, lessonsSeconds);
        // 수업 객체 불러오기
        Class_jy aClass = classServiceJy.getClass(classIdx);
        // 수업 갱신: 학습 개수, 수업 총 시간
        // 학습 개수 += 1
        // 수업 총 시간 += 학습 시간
        classServiceJy.updateClassByLesson(classIdx, aClass.getLectureCnt() + 1,aClass.getSeconds() + lessonsSeconds);

        System.out.println("\n등록을 완료하였습니다.");
        System.out.println("**************************************************\n");
    }

    // 학습 삭제
    public static void deleteLesson(int classIdx) throws Exception{
        System.out.println("**************************************************\n");
        System.out.println("삭제할 학습 번호를 입력해 주세요.");
        System.out.print("학습 번호 : ");
        int lessonIdx = Integer.parseInt(br.readLine());

        // 해당 수업의 학습이 맞는지 확인
        int validateClassIdx = 0;
        // validateClassIdx = lessonIdx 학습을 가진 수업 인덱스
        validateClassIdx = lessonServiceJY.getClassIdx(lessonIdx);
        // 삭제하려는 학습이 현재 수업에 없을 경우
        // 삭제하려는 학습이 데이터베이스에 존재하지 않을 경우
        if(validateClassIdx != classIdx){
            System.out.println("학습 번호를 잘못 입력하였습니다.");
            return;
        }

        // 수업 객체 불러오기
        Class_jy aClass = classServiceJy.getClass(classIdx);
        // 학습 객체 불러오기
        Lesson_jy lesson = lessonServiceJY.getLesson(lessonIdx);

        // 수업 갱신: 학습 개수, 수업 총 시간
        // 학습 개수 -= 1
        // 수업 총 시간 -= 학습 시간
        classServiceJy.updateClassByLesson(classIdx, aClass.getLectureCnt() - 1,aClass.getSeconds() - lesson.getLessonsSeconds());
        // 학습 삭제
        lessonServiceJY.deleteLesson(lessonIdx);

        System.out.println("\n삭제를 완료하였습니다.");
        System.out.println("**************************************************\n");
    }

    
    // jh
    // 로그인한 회원 정보 값의 변수
    public static int loginStudentIdx; // 로그인한 학생의 idx값
    public static String loginStudentNickName; // 로그인한 학생의 닉네임
    public static int loginTeacherIdx; // 로그인한 선생님의 idx값
    public static String loginTeacherName; // 로그인한 선생님의 이름

    // 학생/선생님 회원종류 선택화면
    public static void checkUserView() {
        System.out.println();
        System.out.println("*****************************************");
        System.out.println("          회원 종류를 입력 해주세요.");
        System.out.println("*****************************************");
        System.out.println("1.학생 2.선생님");

    }

    // 첫 시작화면
    public static void startView() {
        System.out.println();
        System.out.println("*****************************************");
        System.out.println("        후루티에 오신 것을 환영합니다");
        System.out.println("*****************************************");
        System.out.println("1.로그인 2.회원가입 3.프로그램 종료");
    }

    // 로그인 입력화면
    public static void loginView() {
        System.out.println();
        System.out.println("*****************************************");
        System.out.println("        아이디와 비밀번호를 입력해주세요");
        System.out.println("*****************************************");
    }

    // 회원가입 입력화면
    public static void signUpView() {
        System.out.println();
        System.out.println("*****************************************");
        System.out.println("            회원가입을 시작합니다.");
        System.out.println("           아래 항목을 입력해주세요.");
        System.out.println("*****************************************");
    }

    // 학생 로그인 기능
    public static void studentLogin() throws Exception {
        // 로그인 화면
        loginView();
        // 사용자 입력값
        System.out.print("아이디: ");
        String studentEmail = br.readLine();
        System.out.print("비밀번호: ");
        String studentPassword = br.readLine();

        // DB에 id/pwd 정보가 있는지 확인 기능
        int studentLogin = loginService_ys.studentLogin(studentEmail, studentPassword);

        // DB에 존재하면 로그인 성공
        if (studentLogin == 1) {
            System.out.println("로그인 성공");

            // 로그인 한 학생 정보를 loginStudentValue에 저장
            StudentDTO_ys loginStudentValue = loginService_ys.getLoginStudent(studentEmail);
            // 로그인 정보를 넘겨줄 변수에 저장
            loginStudentIdx = loginStudentValue.getStudentIdx();
            loginStudentNickName = loginStudentValue.getStudentNickname();

            // 학생 메인메뉴 나의교실로 이동
            System.out.println("****************************************");
            System.out.printf("'%s' 학생 반갑습니다!\n", loginStudentNickName);
            System.out.println("****************************************");
            while (true) {
                System.out.println();
                System.out.println("이용할 메뉴를 선택해 주세요.");
                System.out.printf("1.나의교실 | 2.수업찾기 | 3.장바구니 | 4.마이페이지 | 5.로그아웃 >> ");
                emptyBuffer(br);
                int input = Integer.parseInt(br.readLine().trim());
                switch (input) {
                    case 1:
                        studentMainMenu_MyClass_jh();
                        break;
                    case 2:
                        // 신수진거
                        findClasses(loginStudentIdx);
                    case 5:
                        return;
                }
            }
            // DB에 존재하지 않으면 로그인 실패
        } else {
            System.out.println("로그인 실패");
            studentLogin();
        }
    }

    public static void teacherLogin() throws Exception {
        // 로그인 화면 출력
        loginView();
        // 사용자 입력값
        System.out.print("아이디: ");
        String teacherEmail = br.readLine();
        System.out.print("비밀번호: ");
        String teacherPassword = br.readLine();

        // DB에 id/pwd 정보가 있는지 확인 기능
        int teacherLogin = loginService_ys.teacherLogin(teacherEmail, teacherPassword);

        // DB에 존재하면 로그인 성공
        if (teacherLogin == 1) {
            System.out.println("로그인 성공");

            // 로그인 한 선생님 정보를 loginStudentValue에 저장
            TeacherDTO_ys loginTeacherValue = loginService_ys.getLoginTeacher(teacherEmail);
            // 로그인 정보를 넘겨줄 변수에 저장
            loginTeacherIdx = loginTeacherValue.getTeacherIdx();
            loginTeacherName = loginTeacherValue.getTeacherName();

            /*
             *  선생님 메인 페이지로 이동 메소드 추가
             * */

            teacherJy = new Teacher_jy(loginTeacherIdx, loginTeacherValue.getTeacherEmail(), loginTeacherName,
                    loginTeacherValue.getTeacherPassword(), loginTeacherValue.getTeacherJoined(),
                    loginTeacherValue.getTeacherPoints(), loginTeacherValue.getClassCnt());

            // 선생님 로그인 후 welcome 화면
            // 1. 수업 관리 2. 학습 관리 3. 마이페이지 4. 로그아웃
            System.out.println("**************************************************\n");
            System.out.println(teacherJy.getTeacherName()+" 선생님 반갑습니다.\n");
            System.out.println("**************************************************\n");

            // 수업 관련 서비스 객체
            classServiceJy = new ClassService_jy();
            // 질문 관련 서비스 객체
            questionServiceJy = new QuestionService_jy();
            // 학습 관련 서비스 객체
            lessonServiceJY = new LessonService_jy();
            // 로그인 상태 여부
            boolean logIn = true;

            while(logIn) {  // 로그아웃 되기 전까지 반복
                // inputByTeacherInWelcome
                System.out.println("**************************************************\n");
                System.out.println("이용할 메뉴를 선택해 주세요.");
                System.out.println("\n1. 수업 관리 2. 학습 관리 3. 로그아웃");
                System.out.print("메뉴 : ");
                int inputByTeacherInWelcome = Integer.parseInt(br.readLine());
                System.out.println("**************************************************\n");

                switch (inputByTeacherInWelcome) {
                    // 1. 수업 관리
                    case 1:
                        System.out.println("[ 수업 관리 ]");
                        // 담당 수업 목록 출력
                        getClasses();

                        // 수업 관리 서브 메뉴 inputByTeacherClassManage
                        System.out.println("1. 수업 등록하기 2. 수업 수정하기 3. 수업 삭제하기 4. 질문 보러 가기 5. 메인으로 돌아가기");
                        System.out.print("메뉴 : ");
                        int inputByTeacherClassManage = Integer.parseInt(br.readLine());

                        if(inputByTeacherClassManage == 1){ // 1. 수업 등록하기
                            insertClass();
                        }else if(inputByTeacherClassManage == 2){ // 2. 수업 수정하기
                            updateClass();
                        }else if(inputByTeacherClassManage == 3){ // 3. 수업 삭제하기
                            deleteClass();
                        }else if(inputByTeacherClassManage == 4){ // 4. 질문 보러 가기
                            searchQuestions();
                        }else if(inputByTeacherClassManage == 5){ // 5. 메인으로 돌아가기
                            // 메인으로 돌아감
                        }else{  // 예외
                            System.out.println("잘못 입력하셨습니다.");
                        }
                        break;
                    // 2. 학습 관리
                    case 2:
                        System.out.println("[ 학습 관리 ]");
                        // 담당 수업 목록 출력
                        getClasses();

                        System.out.println("\n몇 번째 수업의 학습을 관리하시겠습니까?");
                        System.out.print("수업 번호 : "); // inputByTeacherLessonManage_classIdx
                        int inputByTeacherLessonManage_classIdx = Integer.parseInt(br.readLine());

                        // 본인 수업 맞는지 확인
                        // 입력받은 classIdx이 해당 선생님의 수업 리스트에 있는지 확인
                        // 선생님의 담당 수업 리스트
                        ArrayList<Class_jy> classesList = classServiceJy.getClasses();
                        boolean inCharge = false;
                        for(Class_jy classJy: classesList){ // [리팩토링] 성능 개선을 위해 map으로 구현
                            if(inputByTeacherLessonManage_classIdx == classJy.getClassIdx()){
                                inCharge = true;
                                break;
                            }
                        }

                        // 수업 번호 잘못 입력 시, 메인 화면으로 돌아간다.
                        if(!inCharge){
                            System.out.println("본인이 담당하는 수업 번호를 입력해 주세요.");
                            break; // 메인 메뉴로 돌아간다. switch (inputByTeacherInWelcome) 탈출
                        }

                        // 특정 수업의 학습 리스트 출력
                        getLessons(inputByTeacherLessonManage_classIdx);

                        // 1.학습 등록하기 2.학습 수정하기 3.학습 삭제하기
                        System.out.println("1.학습 등록 2.학습 삭제 3. 메인으로 돌아가기"); // inputByTeacherLessonManage_menu
                        int inputByTeacherLessonManage_menu = Integer.parseInt(br.readLine());

                        if(inputByTeacherLessonManage_menu == 1){ // 1. 학습 등록
                            insertLesson(inputByTeacherLessonManage_classIdx);
                        }else if(inputByTeacherLessonManage_menu == 2){ // 2. 학습 삭제
                            deleteLesson(inputByTeacherLessonManage_classIdx);
                        }else if(inputByTeacherLessonManage_menu == 3){ // 3. 메인으로 돌아가기
                            // 메인으로 돌아간다.
                        }else{  // 예외
                            System.out.println("잘못 입력하셨습니다.");
                            System.out.println("메인으로 돌아갑니다.");
                        }
                        break;
                    // 3. 로그아웃
                    case 3:
                        logIn = false;
                        break;
                    // 입력 예외
                    default:
                        System.out.println("잘못 입력하셨습니다.");
                        System.out.println("메뉴를 다시 입력해 주세요.");
                }
            }
            System.out.println("로그아웃 되었습니다.");


        } else { // DB에 존재하지 않으면 로그인 실패
            System.out.println("로그인 실패");
            teacherLogin();
        }
    }

    // 학생 회원가입 기능
    public static void studentSignUp() throws Exception {
        emptyBuffer(br);
        // 회원가입 화면 출력
        signUpView();
        // 사용자 입력값
        String studentEmail;
        while (true) {
            System.out.print("아이디: ");
            studentEmail = br.readLine();
            // 아이디 중복 확인. 중복 시 회원가입 재실행
            if (signUpService_ys.studentEmailDuplicationCheck(studentEmail) == 1) {
                System.out.println("동일한 아이디가 존재합니다.");
            } else {
                break;
            }
        }
        String studentPassword;
        while (true) {
            System.out.print("비밀번호: ");
            studentPassword = br.readLine();
            System.out.print("비밀번호확인: ");
            String studentPassword2 = br.readLine();
            // 비밀번호 확인 검사. 틀렸을 때 회원가입 재실행
            if (!Objects.equals(studentPassword, studentPassword2)) {
                System.out.println("비밀번호 확인이 틀렸습니다.");
            } else {
                break;
            }
        }
        String studentNickname;
        while (true) {
            System.out.print("닉네임: ");
            studentNickname = br.readLine();
            if (signUpService_ys.studentNicknameDuplicationCheck(studentNickname) == 1) {
                System.out.println("동일한 닉네임이 존재합니다.");
            } else {
                break;
            }
        }
        // DB에 회원정보 등록
        signUpService_ys.studentSignUp(studentEmail, studentPassword, studentNickname);
        System.out.println("회원가입에 성공하였습니다.");
    }

    // 선생님 회원가입 기능
    public static void teacherSignUp() throws Exception {
        emptyBuffer(br);
        // 회원가입 화면 출력
        signUpView();
        // 사용자 입력값
        String teacherEmail;
        while (true) {
            System.out.print("아이디: ");
            teacherEmail = br.readLine();
            // 아이디 중복 확인. 중복 시 회원가입 재실행
            if (signUpService_ys.teacherEmailDuplicationCheck(teacherEmail) == 1) {
                System.out.println("동일한 아이디가 존재합니다."); // 회원가입 재실행
            } else {
                break;
            }
        }
        String teacherPassword;
        while (true) {
            System.out.print("비밀번호: ");
            teacherPassword = br.readLine();
            System.out.print("비밀번호 확인: ");
            String teacherPassword2 = br.readLine();
            // 비밀번호 확인 검사. 틀렸을 때 회원가입 재실행
            if (!Objects.equals(teacherPassword, teacherPassword2)) {
                System.out.println("비밀번호 확인이 틀렸습니다.");
            } else {
                break;
            }
        }
        System.out.print("성함: ");
        String teacherName = br.readLine();

        // DB에 회원정보 등록
        signUpService_ys.teacherSignUp(teacherEmail, teacherPassword, teacherName);
        System.out.println("회원가입에 성공하였습니다.");
    }
    // ---------------------------------------------------------------

    public static void studentMainMenu_MyClass_jh() throws Exception {
        emptyBuffer(br);
        outerWhile: while (true) {
            //Scanner scanner = new Scanner(System.in);
            Map<Integer, Map<String, Object>> classTakingMap = studentClassService_jh
                    .printListForStudentMainMenuMyClass(loginStudentIdx);

            if (classTakingMap == null) {
                // 학생이 아직 아무 수업도 신청하지 않아서 보여줄 수업 리스트가 없을 경우..
                System.out.println("아직 신청한 수업 내용이 없습니다. 수업을 먼저 신청해주세요.");
                return;
            }

            List<Integer> classIdxList = new ArrayList<>(classTakingMap.keySet());
            Collections.sort(classIdxList);
            System.out.println("****************************************");
            System.out.printf("[%s 학생의 수업 리스트]\n", loginStudentNickName);
            System.out.printf("%-5s | %-10s | %-3s | %-8s\n", "수업번호", "수업제목", "선생님", "진도율(%)");
            Set<Integer> takingClassIdxSet = new HashSet<>();
            for (Integer classIdx : classIdxList) {
                String className = (String) classTakingMap.get(classIdx).get("className");
                String teacherName = (String) classTakingMap.get(classIdx).get("teacherName");
                double status = (Double) classTakingMap.get(classIdx).get("status");
                System.out.printf("%-7d | %-10s | %-3s | %-8.2f\n", classIdx, className, teacherName, status);
                takingClassIdxSet.add(classIdx);
            }
            System.out.println("----------------------------------------");
            System.out.println("이용할 메뉴를 선택해주세요:");
            System.out.printf("1.수업듣기\n이전 단계로 돌아가려면 단어 'exit'을 입력해주세요. >> ");
            int menu;
            innerWhile: while (true) {
                String userInputStr = br.readLine().trim();
                if (userInputStr == null || userInputStr.equals("")) {
                    System.out.println("잘못 입력하셨습니다. 다시 입력해 주세요.");
                    continue;
                }
                if (userInputStr.equals("exit")) {
                    return;
                }
                try {
                    menu = Integer.parseInt(userInputStr);
                    if (menu != 1) throw new Exception();
                } catch (Exception e) {
                    System.out.println("잘못 입력하셨습니다. 다시 입력해 주세요.");
                    continue;
                }
                break;
            } // innerWhile ends
            System.out.println("****************************************");
            switch (menu) {
                case 1:
                    classIdxSelectionMenu_jh(classTakingMap, takingClassIdxSet);
                    break;
            } // switch ends
        } // outerWhile ends
    } // method ends

    public static void classIdxSelectionMenu_jh(Map<Integer, Map<String, Object>> classTakingMap,
                                                Set<Integer> takingClassIdxSet) throws Exception {
        outerWhile: while (true) {
            emptyBuffer(br);
            //Scanner scanner = new Scanner(System.in);
            System.out.println("\n****************************************");
            System.out.println("이어서 수강할 '수업번호'를 입력해주세요.\n이전 단계로 돌아가려면 단어 'exit'을 입력해주세요.");
            System.out.printf("수업번호? : ");
            while (true) {
                String userInputString = br.readLine().trim();
                if (userInputString == null || userInputString.equals("")) {
                    System.out.println("잘못 입력하셨습니다. 다시 입력해주세요.");
                    continue;
                }
                if (userInputString.equals("exit")) {
                    return;
                }
                int userInputInteger;
                try {
                    userInputInteger = Integer.parseInt(userInputString);
                } catch (Exception e) {
                    System.out.println("잘못 입력하셨습니다. 다시 입력해주세요.");
                    continue;
                }
                if (!takingClassIdxSet.contains(userInputInteger)) {
                    System.out.println("현재 수강중인 수업이 아닙니다. 다시 입력해주세요.");
                } else {
                    System.out.println("****************************************");
                    studentMainMenu_MyClassRoom_TakeClass_jh(userInputInteger,
                            classTakingMap.get(userInputInteger));
                    continue outerWhile;
                }
            }
        }
    }

    public static void studentMainMenu_MyClassRoom_TakeClass_jh(int classIdx, Map<String, Object> classInformation)
                                                                                                    throws Exception {
        outerWhile: while (true) {
            emptyBuffer(br);
            //Scanner scanner = new Scanner(System.in);
            System.out.println("\n****************************************");
            System.out.printf("[수업번호: '%d번', 수업이름: '%s'의 학습 리스트]\n", classIdx,
                                                                            (String) classInformation.get("className"));

            // classIdx에 해당되는 모든 클래스 가져오기
            List<Integer> lessonIdxList = lessonService_jh.getAllLessonIdxListByClassIdx(classIdx);

            // 사용자가 한 번이라도 수강한 이력이 있는 레슨 정보 가져오기
            List<Map<String, Object>> printMap = studentLessonService_jh
                    .getStudentCurrentlyTakingLessonInformationForPrint(loginStudentIdx, lessonIdxList);

            List<Integer> currentlyTakingLessonIdxList = new ArrayList<>();
            printMap.forEach(e -> currentlyTakingLessonIdxList.add((Integer) e.get("lesson_idx")));

            // 사용자가 아직 한 번도 수강하지 않은 레슨 정보 가져오기
            List<Map<String, Object>> notCurrentlyTakingLessonIdxInformation =
                    lessonService_jh.getStudentNotCurrentlyTakingLessonIdxInformation(classIdx,
                            currentlyTakingLessonIdxList);

            for (Map<String, Object> temp : notCurrentlyTakingLessonIdxInformation) {
                temp.put("student_study_time", 0);
            }

            printMap.addAll(notCurrentlyTakingLessonIdxInformation);
            printMap.sort((a, b) -> ((Integer) a.get("lesson_idx")) - ((Integer) b.get("lesson_idx")));

            Map<Integer, Map<String, Object>> lessonIdxInformationForSpecificClassIdxKeyMap = new HashMap<>();
            System.out.printf("%6s | %14s | %12s | %9s | %8s\n", "학습번호", "학습이름", "총길이(초)", "학습시간(초)", "학습율(%)");
            for (Map<String, Object> map : printMap) {
                Map<String, Object> info = new HashMap<>();
                int lessonIdx = (Integer) map.get("lesson_idx");
                String lessonName = (String) map.get("lesson_name");
                int lessonTotalSeconds = (Integer) map.get("lesson_total_second");
                int studentStudyTime = (Integer) map.get("student_study_time");
                info.put("lessonName", lessonName);
                info.put("lessonTotalSeconds", lessonTotalSeconds);
                info.put("studentStudyTime", studentStudyTime);
                lessonIdxInformationForSpecificClassIdxKeyMap.put(lessonIdx, info);

                System.out.printf("%6d | %15s | %14d | %10d | %10.2f\n", lessonIdx, lessonName, lessonTotalSeconds,
                        studentStudyTime, (((double) studentStudyTime / lessonTotalSeconds) * 100));
            }
            System.out.println("--------------------------------------------------");
            System.out.println("이용할 메뉴를 선택해주세요:");
            System.out.printf("%15s | %10s | %10s | %7s", "1.학습페이지로 이동하기", "2.강의평 하러가기", "3.질의응답 하러가기", "4.이전페이지\n");
            System.out.printf("메뉴 선택: ");
            while (true) {
                String userInputString = br.readLine().trim();
                int menu;
                try {
                    menu = Integer.parseInt(userInputString);
                    if (menu < 1 || menu > 4) {
                        System.out.println("잘못 입력하셨습니다. 다시 입력해 주세요.");
                        continue;
                    }
                } catch (Exception e) {
                    System.out.println("숫자만 입력할 수 있습니다. 다시 입력해 주세요.");
                    continue;
                }
                switch (menu) {
                    case 1: // 학생메인메뉴_나의교실_수업듣기_학습시작
                        System.out.println("****************************************");
                        studentMainMenu_MyClassRoom_TakeClass_StartLesson_jh(classIdx,
                                lessonIdxInformationForSpecificClassIdxKeyMap);
                        break;
                    case 2:
                        reviewService_he.addReview(loginStudentIdx, classIdx);
                    case 4:
                        return;
                }
                continue outerWhile;
            }
        }
    }

    private static void studentMainMenu_MyClassRoom_TakeClass_StartLesson_jh(int classIdx,
                                 Map<Integer, Map<String, Object>> lessonIdxInformationForSpecificClassIdxKeyMap)
                                                                                                throws Exception {
        // lessonIdxInformationForSpecificClassIdxKeyMap -> 한 개의 classIdx에 대해서 그 수업에 포함된 학습에 대한
        // 학습의 정보들이 map의 key값으로 저장되어 있다.
        outermostWhile: while (true) {
            emptyBuffer(br);
            System.out.println("\n****************************************");
            //Scanner scanner = new Scanner(System.in);
            System.out.println("학습을 시작할 '학습번호'를 입력해주세요.");
            System.out.printf("학습 번호: ");

            int userInputLessonIdx;
            while (true) {
                try {
                    userInputLessonIdx = Integer.parseInt(br.readLine().trim());
                    if (lessonIdxInformationForSpecificClassIdxKeyMap.containsKey(userInputLessonIdx) == false) {
                        System.out.println("현재 '수업'에서 시청할 수 없는 '학습'입니다. 올바른 '학습번호'를 입력해주세요.");
                        continue;
                    }
                } catch (Exception e) {
                    System.out.println("숫자만 입력할 수 있습니다. '학습번호'를 다시 입력해주세요.");
                    continue;
                }
                break;
            }

            int originalStudentStudyTime = (Integer) lessonIdxInformationForSpecificClassIdxKeyMap
                    .get(userInputLessonIdx).get("studentStudyTime");
            // originalStudentStudyTime: 현 시점 DB에 저장되어 있는 학생의 마지막 학습 시청 시간.
            int totalLessonTime = (Integer) lessonIdxInformationForSpecificClassIdxKeyMap
                    .get(userInputLessonIdx).get("lessonTotalSeconds");

            int tempStudentStudyTime = originalStudentStudyTime;

            outerWhile: while (true) {
                if (tempStudentStudyTime > 0) {
                    System.out.println("\n이전에 학습한 기록이 있어 이어서 시작합니다.");
                } else {
                    System.out.println("처음부터 시작합니다.");
                }
                System.out.println("학습 시작!");
                System.out.println("+---------------------------------------------------+");
                System.out.println("|                   플레이어 메뉴                     |");
                System.out.println("| 1번.학습일시정지 | 2번.뒤로5초이동 | 3번.앞으로10초이동  |");
                System.out.println("+---------------------------------------------------+");
                Player player = new Player(tempStudentStudyTime, totalLessonTime,
                        userInputLessonIdx);
                PlayerController playerController = new PlayerController(player);
                playerController.start();
                try {
                    player.startPlay();
                    System.out.println("+---------------------------+");
                    System.out.println("|    학습 진행율 100% 완료     |");
                } catch (Exception e) {
                    System.out.println("+---------------------------+");
                    System.out.println("|   학습이 일시 중지되었습니다   |");
                } finally {
                    playerController.interrupt();
                    System.out.println("|    총 학습 시간: " + player.getStudentPlayTime() + "초     |");
                    System.out.println("+---------------------------+");
                    System.out.println("다음 메뉴 중 하나를 선택해주세요.");

                    innerWhile: while (true) {
                        System.out.printf("%s | %s | %s | %s\n", "1.이어듣기(계속진행)", "2.처음부터 재시작",
                                "3.현재 시청 기록을 저장 후 '학습리스트'로 이동", "4.시청 기록을 저장하지 않고 '학습리스트'로 이동");
                        System.out.print("메뉴 선택: ");
                        String userInputRepeatStr = br.readLine().trim();
                        int userInputRepeatInt;
                        if (userInputRepeatStr == null || userInputRepeatStr.equals("")) {
                            System.out.println("잘못 입력하셨습니다. 다시 입력해주세요.");
                            continue;
                        }
                        try {
                            userInputRepeatInt = Integer.parseInt(userInputRepeatStr);
                        } catch (Exception e) {
                            System.out.println("잘못 입력하셨습니다. 다시 입력해주세요.");
                            continue;
                        }
                        if (userInputRepeatInt > 4) {
                            System.out.println("잘못 입력하셨습니다. 다시 입력해주세요.");
                            continue;
                        }
                        switch (userInputRepeatInt) {
                            case 1:
                                tempStudentStudyTime = player.getStudentPlayTime();
                                continue outerWhile;
                            case 2:
                                tempStudentStudyTime = 0;
                                continue outerWhile;
                            case 3:
                                // DB 저장코드
                                tempStudentStudyTime = player.getStudentPlayTime();
                                boolean result = studentLessonService_jh.saveStudentLessonProgressUpdate(loginStudentIdx,
                                        userInputLessonIdx, tempStudentStudyTime);
                                if (result) {
                                    System.out.println("학습 기록이 저장되었습니다.");
                                } else {
                                    System.out.println("학습 기록 저장하는 중 오류 발생...");
                                }
                                return;
                            case 4: // 시청 기록을 저장하지 않고 '학습리스트(이전)'으로 이동.
                                return;
                        }
                    } // innerWhile ends
                } // try-catch-finally ends
            } // outer while ends
        } // outermost while ends
    } // method ends

    private static void emptyBuffer(BufferedReader reader) {
        try {
            if (reader.ready()) {
                reader.ready();
            }
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
    }

    // sz

    
    // ys

    
    // he
    


    
    
    public static void main(String[] args) throws Exception {
        // 메인 메소드. 프로그램을 시작하기 위해 이 메인 메소드를 실행시켜야 한다.

        // 사용할 실행 코드를 작성하기

        // jy


        // jh

        // 프로그램 시작 변수
        boolean start = true;
        while (start) {
            // 시작 화면 출력
            startView();
            int inputByStartView = Integer.parseInt(br.readLine());
            switch (inputByStartView) {
                // 1.로그인
                case 1:
                    // 회원 종류 선택 화면
                    checkUserView();
                    // 사용자 입력 변수 선언
                    int inputByCheckUserView = Integer.parseInt(br.readLine());

                    // 1.학생 로그인
                    if (inputByCheckUserView == 1) {
                        studentLogin();
                        // 2.선생님 로그인
                    } else if (inputByCheckUserView == 2) {
                        teacherLogin();
                        // 잘못된 입력
                    } else {
                        System.out.println("잘못 입력하셨습니다.");
                    }
                    break; // 수정필요: while()문 이동 -> case1 으로 이동

                // 2. 회원가입
                case 2:
                    // 회원 종류 선택 화면
                    checkUserView();
                    // 사용자 입력 변수 선언
                    int inputByCheckUserView2 = Integer.parseInt(br.readLine());

                    // 1.학생 회원가입
                    if (inputByCheckUserView2 == 1) {
                        studentSignUp();
                        // 2.선생님 회원가입
                    } else if (inputByCheckUserView2 == 2) {
                        teacherSignUp();
                        // 잘못된 입력
                    } else {
                        System.out.println("잘못 입력하셨습니다.");
                    }
                    break; // 수정필요: while()문 이동 -> case1 으로 이동

                // 3.프로그램 종료
                case 3:
                    System.out.println("프로그램을 종료합니다.");
                    start = false;
                    break;
                // 잘못된 입력
                default:
                    System.out.println("잘못 입력하셨습니다.");
                    System.out.println("메뉴를 다시 입력해 주세요.");
            }
        }
        // sz


        // ys


        // he



        
        
    }
}
