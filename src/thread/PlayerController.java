package thread;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.concurrent.Callable;

public class PlayerController extends Thread {

    private Player player;

    public PlayerController(Player player) {
        this.player = player;
    }

    @Override
    public void run() {
        BufferedReader reader = new BufferedReader(new InputStreamReader(System.in));

        outerWhile: while (true) {
            try {
                while (reader.ready() == false) {
                    Thread.sleep(1);
                } // while
                String userInputString = reader.readLine().trim();
                if (userInputString == null && userInputString.equals("")) {
                    emptyBuffer(reader);
                    continue outerWhile;
                }
                int menu = Integer.parseInt(userInputString);
                if (menu == 1) {
                    player.stopPlay();
                    emptyBuffer(reader);
                } else if (menu == 2) {
                    player.goBack();
                    emptyBuffer(reader);
                } else if (menu == 3) {
                    player.goFront();
                    emptyBuffer(reader);
                } else {
                    System.out.println("잘못 입력하셨습니다. 학습중지: 1번, 뒤로가기: 2번, 앞으로가기: 3번");
                    emptyBuffer(reader);
                }
            } catch (IOException io) {
                System.out.println("io 예외 발생.");
                emptyBuffer(reader);
                continue outerWhile;
            } catch (InterruptedException ie) {
                System.out.println("강의 플레이어 콘트롤러 종료.");
                return;
            } catch (Exception e) {
                System.out.println("콘트롤로 예외 발생, reloading in progress.");
                emptyBuffer(reader);
            }
        } // outer while
    }

    public void emptyBuffer(BufferedReader reader) {
        try {
            if (reader.ready()) {
                reader.readLine();
            }
        } catch (Exception e) {
            System.out.println("BufferedREader empty() 중 예외 발생.");
        }
    }
}
