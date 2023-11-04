package main;

import service.LessonService_jh;
import service.StudentClassService_jh;
import service.StudentLessonService_jh;

import java.util.*;

public class HuruTMain {
    
    // 필요한 서비스를 멤버로 받아오기

    // jy

    
    // jh
    
    
    // sz

    
    // ys

    
    // he
    


    // 필요한 기능을 메소드로 만들기

    // jy

    
    // jh
    public static int studentIdx_jh = 1;
    public static String studentNickName_jh = "test";
    public static StudentClassService_jh studentClassService_jh = new StudentClassService_jh();
    public static LessonService_jh lessonService_jh = new LessonService_jh();
    private static StudentLessonService_jh studentLessonService_jh = new StudentLessonService_jh();

    public static void studentMainMenu_jh() {
        Scanner scanner = new Scanner(System.in);
        System.out.println("****************************************");
        System.out.printf("%s 학생 반갑습니다!\n", studentNickName_jh);
        System.out.println("****************************************");
        System.out.println();
        System.out.println("이용할 메뉴를 선택해 주세요.");
        System.out.printf("1.나의교실 | 2.수업찾기 | 3.장바구니 | 4.마이페이지 | 5.로그아웃 >> ");
        int input = Integer.parseInt(scanner.nextLine().trim());
        switch (input) {
            case 1:
                studentMainMenuMyClass_jh();
                break;
        }
    }

    public static void studentMainMenuMyClass_jh() {
        Scanner scanner = new Scanner(System.in);
        Map<Integer, Map<String, Object>> classTakingMap = studentClassService_jh.printListForStudentMainMenuMyClass(1);
        List<Integer> classIdxList = new ArrayList<>(classTakingMap.keySet());
        Collections.sort(classIdxList);
        System.out.println("****************************************");
        System.out.printf("[%s 학생의 수업 리스트]\n", studentNickName_jh);
        System.out.printf("%-5s | %-10s | %-3s | %-8s\n", "수업번호", "수업제목", "선생님", "진도율%");
        for (Integer classIdx : classIdxList) {
            String className = (String) classTakingMap.get(classIdx).get("className");
            String teacherName = (String) classTakingMap.get(classIdx).get("teacherName");
            double status = (Double) classTakingMap.get(classIdx).get("status");
            System.out.printf("%-7d | %-10s | %-3s | %-8.2f\n", classIdx, className, teacherName, status);
        }
        System.out.println("****************************************");
        System.out.println("이용할 메뉴를 선택해주세요:");
        System.out.printf("1.수업듣기 | 2.수업 환불하기 | 3.메인으로 이동 >> ");
        int menu = Integer.parseInt(scanner.nextLine().trim());
        switch (menu) {
            case 1:
                classIdxSelectionMenu_jh(classTakingMap);
        }
    }

    public static void classIdxSelectionMenu_jh(Map<Integer, Map<String, Object>> classTakingMap) {
        Scanner scanner = new Scanner(System.in);
        System.out.println("\n****************************************");
        System.out.println("이어서 수강할 '수업번호'를 입력해주세요.");
        System.out.println("****************************************");
        System.out.printf("수업번호? : ");
        int classIdx = Integer.parseInt(scanner.nextLine().trim());
        studentMainMenuMyClassRoomTakeClass_jh(classIdx, classTakingMap.get(classIdx));
    }

    public static void studentMainMenuMyClassRoomTakeClass_jh(int classIdx, Map<String, Object> classInformation) {
        Scanner scanner = new Scanner(System.in);
        System.out.println("\n****************************************");
        System.out.printf("[%s 학생의 '%s'의 학습 리스트]\n", studentNickName_jh, (String) classInformation.get("className"));

        // classIdx에 해당되는 모든 클래스 가져오기
        List<Integer> lessonIdxList = lessonService_jh.getAllLessonIdxListByClassIdx(classIdx);
        List<Map<String, Object>> printMap = studentLessonService_jh.getStudentTakingLessonInformationForPrint(studentIdx_jh, lessonIdxList);
        System.out.printf("%4s | %10s | %10s | %7s | %6s\n", "번호", "학습이름", "총길이(초)", "학습시간", "학습율(%)");
        for (Map<String, Object> map : printMap) {
            int lessonIdx = (Integer) map.get("lesson_idx");
            String lessonName = (String) map.get("lesson_name");
            int lessonTotalSeconds = (Integer) map.get("lesson_total_second");
            int studentStudyTime = (Integer) map.get("student_study_time");

            System.out.printf("%4d | %10s | %10d | %7d | %6.2f\n", lessonIdx, lessonName, lessonTotalSeconds, studentStudyTime, (((double)studentStudyTime / lessonTotalSeconds) * 100));
        }
        System.out.println("****************************************");
    }
    
    // sz

    
    // ys

    
    // he
    


    
    
    public static void main(String[] args) {
        // 메인 메소드. 프로그램을 시작하기 위해 이 메인 메소드를 실행시켜야 한다.

        // 사용할 실행 코드를 작성하기

        // jy


        // jh
        studentMainMenu_jh();

        // sz


        // ys


        // he


        
        
    }
}
