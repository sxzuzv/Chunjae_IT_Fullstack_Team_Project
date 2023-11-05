package main;

import service.LessonService_jh;
import service.StudentClassService_jh;
import service.StudentLessonService_jh;
import thread.Player;
import thread.PlayerController;

import java.io.BufferedReader;
import java.io.InputStreamReader;
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
    public static int studentIdx_jh = 3;
    public static String studentNickName_jh = "user3";
    public static StudentClassService_jh studentClassService_jh = new StudentClassService_jh();
    public static LessonService_jh lessonService_jh = new LessonService_jh();
    private static StudentLessonService_jh studentLessonService_jh = new StudentLessonService_jh();

    public static void studentMainMenu_jh() {
        /*Scanner scanner = new Scanner(System.in);
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
        }*/
    }

    public static void studentMainMenuMyClass_jh() {

        while (true) {

            Scanner scanner = new Scanner(System.in);
            Map<Integer, Map<String, Object>> classTakingMap = studentClassService_jh.printListForStudentMainMenuMyClass(1);
            List<Integer> classIdxList = new ArrayList<>(classTakingMap.keySet());
            Collections.sort(classIdxList);
            System.out.println("****************************************");
            System.out.printf("[%s 학생의 수업 리스트]\n", studentNickName_jh);
            System.out.printf("%-5s | %-10s | %-3s | %-8s\n", "수업번호", "수업제목", "선생님", "진도율%");
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
            System.out.printf("1.수업듣기 | 2.이전 단계로 이동 >> ");
            int menu = Integer.parseInt(scanner.nextLine().trim());
            System.out.println("****************************************");
            switch (menu) {
                case 1:
                    classIdxSelectionMenu_jh(classTakingMap, takingClassIdxSet);
                    break;
                case 2:
                    return;
            }

        }
    }

    public static void classIdxSelectionMenu_jh(Map<Integer, Map<String, Object>> classTakingMap,
                                                Set<Integer> takingClassIdxSet) {
        outerWhile: while (true) {
            Scanner scanner = new Scanner(System.in);
            System.out.println("\n****************************************");
            System.out.println("이어서 수강할 '수업번호'를 입력해주세요.\n이전 단계로 돌아가려면 단어 'exit'을 입력해주세요.");

            System.out.printf("수업번호? : ");
            while (true) {
                String userInputString = scanner.nextLine();
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
                    studentMainMenuMyClassRoomTakeClass_jh(userInputInteger,
                            classTakingMap.get(userInputInteger));
                    continue outerWhile;
                }
            }
            /*int classIdx = Integer.parseInt(scanner.nextLine().trim());
            studentMainMenuMyClassRoomTakeClass_jh(classIdx, classTakingMap.get(classIdx));*/
        }
    }

    public static void studentMainMenuMyClassRoomTakeClass_jh(int classIdx, Map<String, Object> classInformation) {
        while (true) {
            Scanner scanner = new Scanner(System.in);
            System.out.println("\n****************************************");
            System.out.printf("[%s 학생의 '%s'의 학습 리스트]\n", studentNickName_jh, (String) classInformation.get("className"));

            // classIdx에 해당되는 모든 클래스 가져오기
            List<Integer> lessonIdxList = lessonService_jh.getAllLessonIdxListByClassIdx(classIdx);
            List<Map<String, Object>> printMap = studentLessonService_jh // 사용자가 한 번이라도 수강한 이력이 있는 레슨 정보 가져오기
                    .getStudentCurrentlyTakingLessonInformationForPrint(studentIdx_jh, lessonIdxList);


            List<Integer> currentlyTakingLessonIdxList = new ArrayList<>();
            printMap.forEach(e -> currentlyTakingLessonIdxList.add((Integer) e.get("lesson_idx")));

            List<Map<String, Object>> notCurrentlyTakingLessonIdxInformation = // 사용자가 아직 한 번도 수강하지 않은 레슨 정보 가져오기
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
            System.out.printf("%10s | %10s | %10s | %10s", "1.학습시작", "2.강의평 하러가기", "3.질의응답 하러가기", "4.이전페이지\n");
            System.out.printf("메뉴 선택: ");
            while (true) {
                String userInputString = scanner.nextLine().trim();
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
                        studentMainMenuMyClassTakeLesson(classIdx,
                                lessonIdxInformationForSpecificClassIdxKeyMap);
                        break;
                    case 4:
                        return;
                }
            }
        }
    }

    private static void studentMainMenuMyClassTakeLesson(int classIdx,
                                    Map<Integer, Map<String, Object>> lessonIdxInformationForSpecificClassIdxKeyMap) {
        // lessonIdxInformationForSpecificClassIdxKeyMap -> 한 개의 classIdx에 대해서 그 수업에 포함된 학습에 대한
        // 학습의 정보들이 map의 key값으로 저장되어 있다.
        outermostWhile: while (true) {
            Scanner scanner = new Scanner(System.in);
            System.out.println("학습을 시작할 '학습번호'를 입력해주세요.");
            System.out.printf("학습 번호: ");
            int userInputLessonIdx = Integer.parseInt(scanner.nextLine().trim());

            int originalStudentStudyTime = (Integer) lessonIdxInformationForSpecificClassIdxKeyMap
                    .get(userInputLessonIdx).get("studentStudyTime");
            int totalLessonTime = (Integer) lessonIdxInformationForSpecificClassIdxKeyMap
                    .get(userInputLessonIdx).get("lessonTotalSeconds");
            int tempStudentStudyTime = originalStudentStudyTime;

            outerWhile: while (true) {
                if (tempStudentStudyTime >= 1) {
                    // 1초이상 수강한 경우
                    System.out.println("\n이전에 학습한 기록이 있어 이어서 시작합니다.");
                    System.out.println("학습 시작!");
                    BufferedReader reader = new BufferedReader(new InputStreamReader(System.in));
                    System.out.println("****************************************");
                    System.out.println("               플레이어 메뉴");
                    System.out.println("[학습중지: 1번, 뒤로가기: 2번, 앞으로가기: 3번]");
                    System.out.println("****************************************");
                    Player player = new Player(tempStudentStudyTime, totalLessonTime,
                            userInputLessonIdx);
                    PlayerController playerController = new PlayerController(player);
                    playerController.start();
                    try {
                        player.startPlay();
                        System.out.println("학습 진행율 100% 완료.");
                    } catch (Exception e) {
                        System.out.println("학습 일시 중지.");
                    } finally {
                        playerController.interrupt();
                        System.out.println("총 학습 시간: " + player.getStudentPlayTime() + "초");
//                    tempStudentStudyTime = player.getStudentPlayTime();
                        System.out.println("다음 메뉴 중 하나를 선택해주세요.");
                        while (true) {
                            System.out.printf("%s | %s | %s | %s\n", "1.이어듣기(계속진행)", "2.처음부터 재시작",
                                    "3.현재 시청 기록을 저장 후 나가기", "4.시청 기록을 저장하지 않고 이전으로 이동");
                            String userInputRepeatStr = scanner.nextLine().trim();
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
                                    break;
                                case 4:
                                    return;
                            }
                        }
                    }
                } else {
                    // 1초미만 수강(수강 안 한)경우
                    System.out.println("처음부터 시작합니다.\n");
                }
            } // outer while
        }
        /*if (studentStudyTime >= 1) {
            // 1초이상 수강한 경우
            System.out.println("\n이전에 학습한 기록이 있어 이어서 시작합니다.");
            System.out.println("학습 시작!");
            BufferedReader reader = new BufferedReader(new InputStreamReader(System.in));
            System.out.println("****************************************");
            System.out.println("               플레이어 메뉴");
            System.out.println("[학습중지: 1번, 뒤로가기: 2번, 앞으로가기: 3번]");
            System.out.println("****************************************");
            Player player = new Player(studentStudyTime, totalLessonTime,
                    userInputLessonIdx);
            PlayerController playerController = new PlayerController(player);
            playerController.start();
            try {
                player.startPlay();
                System.out.println("학습 완료.");
            } catch (Exception e) {
                System.out.println("학습 일시 중지.");
                System.out.println("총 학습 시간: " + player.getStudentPlayTime() +"초");
            } finally {
                playerController.interrupt();
                // int studentTotalStudyTime =
            }
        } else {
            // 1초미만 수강(수강 안 한)경우
            System.out.println("이전에 학습한 기록이 없기 때문에 처음부터 시작합니다.\n");
        }*/
    }

    // sz

    
    // ys

    
    // he
    


    
    
    public static void main(String[] args) {
        // 메인 메소드. 프로그램을 시작하기 위해 이 메인 메소드를 실행시켜야 한다.

        // 사용할 실행 코드를 작성하기

        // jy


        // jh
        Scanner scanner_jh = new Scanner(System.in);
        System.out.println("****************************************");
        System.out.printf("%s 학생 반갑습니다!\n", studentNickName_jh);
        System.out.println("****************************************");
        while (true) {
            System.out.println();
            System.out.println("이용할 메뉴를 선택해 주세요.");
            System.out.printf("1.나의교실 | 2.수업찾기 | 3.장바구니 | 4.마이페이지 | 5.로그아웃 >> ");
            int input = Integer.parseInt(scanner_jh.nextLine().trim());
            switch (input) {
                case 1:
                    studentMainMenuMyClass_jh();
                    break;
            }
        }
        // sz


        // ys


        // he


        
        
    }
}
