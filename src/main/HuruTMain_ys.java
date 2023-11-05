package main;

import service.LoginService_ys;
import service.SignUpService_ys;

import java.util.Objects;
import java.util.Scanner;

public class HuruTMain_ys {
    
    // 필요한 서비스를 멤버로 받아오기

    // jy

    
    // jh
    
    
    // sz

    
    // ys
    public static SignUpService_ys signUpService_ys = new SignUpService_ys();
    public static LoginService_ys loginService_ys = new LoginService_ys();

    // he
    


    // 필요한 기능을 메소드로 만들기

    // jy

    
    // jh
    
    
    // sz

    
    // ys

    // 학생/선생님 회원종류 선택화면
    public static void checkUserView() {
        System.out.println("*****************************************");
        System.out.println("        회원 종류를 입력 해주세요.");
        System.out.println("         1.학생 2.선생님");
        System.out.println("*****************************************");
        System.out.print(": ");
    }

    // 첫 시작화면
    public static void startView() {
        System.out.println("*****************************************");
        System.out.println("        후루티에 오신 것을 환영합니다");
        System.out.println("*****************************************");
        System.out.println("1.로그인 2.회원가입");
        System.out.print("원하는 메뉴의 번호를 정수로 입력하세요: ");
    }

    // 로그인 입력화면
    public static void loginView() {
        System.out.println("*****************************************");
        System.out.println("        아이디와 비밀번호를 입력해주세요");
        System.out.println("*****************************************");
    }

    // 회원가입 입력화면
    public static void signUpView() {
        System.out.println("*****************************************");
        System.out.println("  만드실 아이디, 비밀번호, 이름을 입력해주세요");
        System.out.println("*****************************************");
    }
    
    // he
    


    
    
    public static void main(String[] args) {
        // 메인 메소드. 프로그램을 시작하기 위해 이 메인 메소드를 실행시켜야 한다.

        // 사용할 실행 코드를 작성하기

        // jy


        // jh


        // sz


        // ys
        Scanner sc = new Scanner(System.in);
        Scanner scan = new Scanner(System.in);


        // 시작화면 출력
        startView();

        // 사용가 입력값을 input 변수로 사용
        int input = sc.nextInt();

        // 로그인 기능
        if(input==1) {
            // 학생/선생님 회원종류 선택화면 출력
            checkUserView();
            int input2 = sc.nextInt(); // 두 번째 입력값을 input2 변수로 사용

            // 학생 로그인
            while (true){
                if(input2==1) {
                    // 로그인 화면 출력
                    loginView();

                    // 사용자 입력값
                    System.out.print("아이디(이메일형식): ");
                    String studentEmail = scan.nextLine();
                    System.out.print("비밀번호: ");
                    String studentPassword = scan.nextLine();

                    // DB에 id/pwd 정보가 있는지 확인 기능
                    int studentLogin = loginService_ys.studentLogin(studentEmail, studentPassword);

                    // DB에 존재하면 로그인 성공
                    if (studentLogin == 1) {
                        System.out.println("로그인 성공");
                        break;
                        // DB에 존재하지 않으면 로그인 실패
                    } else {
                        System.out.println("로그인 실패");
                        continue;
                    }
                // 선생님 로그인
                }else if(input2==2){
                    // 로그인 화면 출력
                    loginView();

                    // 사용자 입력값
                    System.out.print("아이디(이메일형식): ");
                    String teacherEmail = scan.nextLine();
                    System.out.print("비밀번호: ");
                    String teacherPassword = scan.nextLine();

                    // DB에 id/pwd 정보가 있는지 확인 기능
                    int teacherLogin = loginService_ys.teacherLogin(teacherEmail, teacherPassword);

                    // DB에 존재하면 로그인 성공
                    if (teacherLogin == 1) {
                        System.out.println("로그인 성공");
                        break;
                        // DB에 존재하지 않으면 로그인 실패
                    } else {
                        System.out.println("로그인 실패");
                        continue;
                    }
                }else {
                    System.out.println("정확한 메뉴번호를 입력해주세요.");
                }
            }


        // 회원가입 기능 시작
        } else if(input==2) {
            // 학생/선생님 회원종류 선택화면 출력
            checkUserView();
            int input2 = sc.nextInt(); // 두 번째 입력값을 input2 변수로 사용


            while (input2==1) {
                // 회원가입 화면 출력
                signUpView();
                // 사용자 입력값
                System.out.print("아이디(이메일형식): ");
                String studentEmail = scan.nextLine();
                // 아이디 중복 확인. 중복 시 회원가입 재실행(continue)
                if(signUpService_ys.studentEmailDuplicationCheck(studentEmail) == 1) {
                    System.out.println("동일한 아이디가 존재합니다.");
                    continue;
                }
                System.out.print("비밀번호: ");
                String studentPassword = scan.nextLine();
                System.out.print("비밀번호확인: ");
                String studentPassword2 = scan.nextLine();
                System.out.print("닉네임: ");
                String studentNickname = scan.nextLine();

                // 비밀번호 재확인 검사
                if(Objects.equals(studentPassword, studentPassword2)) {
                    // 일치하면 DB에 회원정보 등록
                    signUpService_ys.studentSignUp(studentEmail, studentPassword, studentNickname);
                    break;
                // 일치하지 않으면 회원가입 재실행(continue)
                }else {
                    System.out.println("오류: 비밀번호가 동일하지 않습니다.");
                    continue;
                }
            }

            while (input2==2) {
                // 회원가입 화면 출력
                signUpView();
                // 사용자 입력값
                System.out.print("아이디(이메일형식): ");
                String teacherEmail = scan.nextLine();
                // 아이디 중복 확인. 중복 시 회원가입 재실행(continue)
                if(signUpService_ys.teacherEmailDuplicationCheck(teacherEmail) == 1) {
                    System.out.println("동일한 아이디가 존재합니다.");
                    continue;
                }
                System.out.print("비밀번호: ");
                String teacherPassword = scan.nextLine();
                System.out.print("비밀번호확인: ");
                String teacherPassword2 = scan.nextLine();
                System.out.print("성함: ");
                String teacherName = scan.nextLine();

                // 비밀번호 재확인 검사
                if(Objects.equals(teacherPassword, teacherPassword2)) {
                    // 일치하면 DB에 회원정보 등록
                    signUpService_ys.teacherSignUp(teacherEmail, teacherPassword, teacherName);
                    break;
                // 일치하지 않으면 회원가입 재실행(continue)
                }else {
                    System.out.println("오류: 비밀번호가 동일하지 않습니다.");
                    continue;
                }
            }
        }


        // he


        
        
    }
    
}
