package thread;

import main.HuruTMain;

import java.util.concurrent.Callable;
import java.util.concurrent.FutureTask;

public class Player {

    private int studentPlayTime;
    private int totalLessonTime;
    private int lessonIdx;

    public Player(int studentPlayTime, int totalLessonTime, int lessonIdx) {
        this.studentPlayTime = studentPlayTime;
        this.totalLessonTime = totalLessonTime;
        this.lessonIdx = lessonIdx;
    }

    public int getStudentPlayTime() {
        if (studentPlayTime > totalLessonTime) {
            return totalLessonTime;
        } else if (studentPlayTime < 0) {
            return 0;
        } else {
            return studentPlayTime;
        }
    }

    public boolean isFinished() {
        if (totalLessonTime <= getStudentPlayTime()) {
            return true;
        } else {
            return false;
        }
    }

    public Callable<Integer> callable = new Callable<Integer>() {
        @Override
        public Integer call() throws Exception {
            while (studentPlayTime <= totalLessonTime) {
                System.out.printf("[학습번호 %d번 시청 중입니다... 진행상황: %s / %s]\n", lessonIdx,
                        HuruTMain.convertTime(studentPlayTime), HuruTMain.convertTime(totalLessonTime));
                Thread.sleep(1500); // 1.5초동안 스레드 sleep...
                goFront();
            }
            return getStudentPlayTime();
        }
    };

    private FutureTask<Integer> futureTask = new FutureTask<>(callable);

    public int startPlay() throws Exception {
        Thread thread = new Thread(futureTask);
        thread.start();
        int studentPlayTime = futureTask.get(); // 예외발생가능성 중간에 1번을 누루면 여기로 와서 에러터진다.
        return studentPlayTime; // 다 들었을때 여기로 오고
    }

    public void stopPlay() {
        futureTask.cancel(true);
    }

    public synchronized void goBack() {
        if (studentPlayTime - 10 < 0) {
            studentPlayTime = 0;
        } else {
            studentPlayTime -= 10;
        }
    }

    public synchronized void goFront() {
        studentPlayTime += 5;
    }
}
