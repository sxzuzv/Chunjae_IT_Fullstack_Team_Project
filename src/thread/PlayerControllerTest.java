package thread;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.util.concurrent.Callable;

public class PlayerControllerTest {

    private Player player;

    public PlayerControllerTest(int studentPlayTime, int totalLessonTime, int lessonIdx) {
        this.player = new Player(studentPlayTime, totalLessonTime, lessonIdx);
    }

    private Callable<Integer> callable = new Callable<Integer>() {
        @Override
        public Integer call() throws Exception {
            BufferedReader reader = new BufferedReader(new InputStreamReader(System.in));
            System.out.println("학습을 중지하고 싶을 경우, 시청 중간에 1번을 입력해주세요.");
            System.out.println("학습 시작!");

            try {
                player.startPlay();
            } catch (Exception e) {
                return player.getStudentPlayTime();
            }

            outerWhile: while (true) {
                while (reader.ready() == false) {
//                    if (player.isFinished()) {
//                        return player.getStudentPlayTime();
//                    }
                }
                int userStopInput = Integer.parseInt(reader.readLine().trim());
                if (userStopInput != 1) {
                    System.out.println("잘못 입력하셨습니다. 학습을 중지하고 싶은 경우, 1번을 입력해주세요.");
                    continue outerWhile;
                } else {
                    player.stopPlay();
                    break outerWhile;
                }
            }
            return player.getStudentPlayTime();
        }
    };

    public void startPlay() {

    }
}
