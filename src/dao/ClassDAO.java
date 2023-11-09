package dao;

import factory.MyBatisMapperFactory;
import lombok.Getter;
import lombok.ToString;
import main.HuruTMain;
import org.apache.ibatis.session.SqlSession;
import repository.mapper.ClassMapper_sz;
import repository.mapper.PurchaseClassMapper_sz;
import repository.mapper.TeacherMapper_sz;
import service.FindClasses_sz;

@Getter
public class ClassDAO {
    FindClasses_sz findClassesSz = new FindClasses_sz();

    private int classIdx;
    private String className;
    private int teacherId;
    private int price;
    private int studentCnt;
    private double rating;
    private int lectureCnt;
    private int seconds;
    private int difficulty;

    public String print(int teacher_idx) {
        SqlSession sqlSession = MyBatisMapperFactory.getSqlSession(); // 마이바티스 연동 확인 코드
        TeacherMapper_sz teacherMapper_sz = sqlSession.getMapper(TeacherMapper_sz.class);

        ClassDAO classDAO = new ClassDAO();

        String difficulty = "";

        if (this.difficulty == 1) {
            difficulty = "쉬워요.";
        } else if (this.difficulty == 2) {
            difficulty = "보통이에요.";
        } else {
            difficulty = "어려워요.";
        }

        String teacherName = teacherMapper_sz.teacherName(teacherId).getTeacherName();

        int playtime = seconds/60;
        String playtimeStr = Integer.toString(playtime)+"분";
        if(playtime >= 60){
            playtimeStr = Integer.toString(playtime/60)+"시간";
            if(playtime % 60 > 0){
                playtimeStr = playtimeStr.concat(" "+Integer.toString(playtime % 60) + "분");
            }
        }
        PurchaseClassMapper_sz purchaseClassMapper = sqlSession.getMapper(PurchaseClassMapper_sz.class);
        Double rate = purchaseClassMapper.getRatingByClassIdx(classIdx);
        if (rate == null)
            this.rating = 0.0;
        else {
            this.rating = Math.ceil(rate * 100) / 100.0;
        }
        sqlSession.close();

        String result = String.format("%10d \t    | %20s \t | %15s \t | %17d \t    | %7.2f             \t | %10d \t | %15s \t | %10s",
                classIdx, className, teacherName, price, this.rating, lectureCnt, HuruTMain.convertTime(seconds), difficulty);
        return result;
        /*return "[수업 번호 " + classIdx +"]" +
                " 수업명 : " + className + " |" +
                " 선생님 : " + teacherName + " 선생님 |" +
                " 수업 가격 : " + price + "원 |" +
                " 수강 평점 : " + this.rating + "점 |" +
                " 학습 개수 : " + lectureCnt + "개 |" +
                " 총 수업 시간 : " + playtimeStr + " |" +
                " 난이도 : " + difficulty;*/
    }
}
