package main;

import dao.StudentDAO;
import service.LoginService_ys;
import service.SignUpService_ys;
import service.StudentService;

import java.lang.reflect.Array;
import java.util.ArrayList;
import java.util.Objects;
import java.util.Scanner;

public class HuruTMain {
    
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

    public static void CheckUserView() {
        System.out.println("*****************************************");
        System.out.println("        회원 종류를 입력 해주세요.");
        System.out.println("         1.학생 2.선생님");
        System.out.println("*****************************************");
        System.out.print(": ");
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
        System.out.println("*****************************************");
        System.out.println("        후루티에 오신 것을 환영합니다");
        System.out.println("*****************************************");
        System.out.println("1.로그인 2.회원가입");
        System.out.print("원하는 메뉴의 번호를 정수로 입력하세요: ");

        // 사용가 입력값을 input 변수로 사용
        int input = sc.nextInt();



        // 로그인 기능 시작
        if(input==1) {
            CheckUserView();
            int input2 = sc.nextInt(); // 두 번째 입력값을 input2 변수로 사용

            while (input2==1){
                System.out.println("*****************************************");
                System.out.println("        아이디와 비밀번호를 입력해주세요");
                System.out.println("*****************************************");
                System.out.print("아이디(이메일형식): ");
                String studentEmail = scan.nextLine();
                System.out.print("비밀번호: ");
                String studentPassword = scan.nextLine();

                int studentLogin = loginService_ys.studentLogin(studentEmail, studentPassword);

                if (studentLogin == 1) {
                    System.out.println("로그인 성공");
                    break;
                } else {
                    System.out.println("로그인 실패");
                    continue;
                }
            }
            while (input2==2){
                System.out.println("*****************************************");
                System.out.println("        아이디와 비밀번호를 입력해주세요");
                System.out.println("*****************************************");
                System.out.print("아이디(이메일형식): ");
                String teacherEmail = scan.nextLine();
                System.out.print("비밀번호: ");
                String teacherPassword = scan.nextLine();

                int teacherLogin = loginService_ys.teacherLogin(teacherEmail, teacherPassword);

                if (teacherLogin == 1) {
                    System.out.println("로그인 성공");
                    break;
                } else {
                    System.out.println("로그인 실패");
                    continue;
                }
            }


            // 회원가입 기능 시작
        } else if(input==2) {
            CheckUserView();
            int input2 = sc.nextInt(); // 두 번째 입력값을 input2 변수로 사용


            while (input2==1) {
                System.out.println("*****************************************");
                System.out.println("        아이디와 비밀번호를 입력해주세요");
                System.out.println("*****************************************");

                // 사용자 입력값을 각 변수에 대입
                System.out.print("아이디(이메일형식): ");
                String studentEmail = scan.nextLine();
                // 아이디 중복 확인
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
                    signUpService_ys.studentSignUp(studentEmail, studentPassword, studentNickname);
                    break;
                }else {
                    System.out.println("오류: 비밀번호가 동일하지 않습니다.");
                    continue;
                }
            }

            while (input2==2) {
                System.out.println("*****************************************");
                System.out.println("        아이디와 비밀번호를 입력해주세요");
                System.out.println("*****************************************");

                System.out.print("아이디(이메일형식): ");
                String teacherEmail = scan.nextLine();
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

                // 비밀번호 확인 로직
                if(Objects.equals(teacherPassword, teacherPassword2)) {
                    signUpService_ys.teacherSignUp(teacherEmail, teacherPassword, teacherName);
                    break;
                }else {
                    System.out.println("오류: 비밀번호가 동일하지 않습니다.");
                    continue;
                }
            }
        }


        // he


        
        
    }
    
}
