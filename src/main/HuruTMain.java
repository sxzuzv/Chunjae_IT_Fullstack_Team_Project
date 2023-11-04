package main;

import service.StudentService;

public class HuruTMain {
    
    // 필요한 서비스를 멤버로 받아오기
    private static StudentService studentService = new StudentService();

    public static void main(String[] args) {
        // 메인 메소드. 프로그램을 시작하기 위해 이 메인 메소드를 실행시켜야 한다.


        Scanner sc = new Scanner(System.in);

        // 메인 화면을 콘솔에 출력하는 코드 작성
        System.out.println("*****************************************");
        System.out.print("환영 메시지");
        System.out.println("*****************************************");

        System.out.println("1. 로그인");
        System.out.println("2. 회원가입");

        // 사용자가 원하는 메뉴를 고르도록 하는 코드 작성
        System.out.print("원하는 메뉴의 번호를 정수로 입력하세요: ");
        int input = sc.nextInt();


        // if-else if-else문 또는 switch-case문으로, 각 메뉴마다 해당하는 Service 인스턴스 내의 메소드를 호출

        // 비어있는 조건문을 만든 상태에서 코드를 나눠받은 다음,
        // 본인이 맡은 분기에 해당하는 공간을 호출문으로 채워주시면 됩니다!
        if(input==1) {
            // 로그인 맡은 사람이 채우기
        } else if (input==2) {
            // 회원가입 맡은 사람이 채우기
        }
    }
    
}
