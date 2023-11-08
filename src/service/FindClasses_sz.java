package service;

import dao.ClassDAO;
import dao.StudentClassDAO;
import factory.MyBatisMapperFactory;
import org.apache.ibatis.session.SqlSession;
import repository.mapper.ClassMapper_sz;
import repository.mapper.StudentClassMapper_sz;
import repository.mapper.PurchaseClassMapper_sz;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class FindClasses_sz {
    // FindClasses 클래스 : 학생이 수업 리스트에서 원하는 수업을 결제한다.
    // 1) 학생에게 현재 개설된 수업 리스트를 보여준다.
    // 2) 학생이 수업 번호를 선택한다.
    //    2-1) 선택한 수업 번호가 이미 결제한 수업일 경우, 다시 수업 리스트를 보여준다.
    // 3) 학생에게 결제 여부를 물어본다. ('N번 수업을 결제하시겠습니까?')
    // 4) 'y(YES)'를 입력할 시, 학생 아이디와 수업 아이디가 student_class 테이블(학생과 수업을 연결하는 다대다 테이블)에 저장된다.

    // viewAllClass() : 학생에게 현재 수강 가능한 수업 목록을 보여준다.
    public void viewAllClass() {
        SqlSession sqlSession = MyBatisMapperFactory.getSqlSession(); // 마이바티스 연동 확인 코드
        ClassMapper_sz mapper = sqlSession.getMapper(ClassMapper_sz.class); // 인터페이스에 객체 생성 후 마이바티스 연동

        // classes 테이블(수업 테이블)에서 가져온 수강 가능한 수업 목록을 저장한다.
        List<ClassDAO> allClass = mapper.viewAllClass();

        FindClasses_sz findClassesSz = new FindClasses_sz();


        // 반복문을 실행하여 학생에게 현재 수강 가능한 수업 목록을 보여준다.
        // 출력 시,classes 테이블에 저장된 선생님 아이디에 해당하는 선생님의 이름을 가져온다.
        // 1 선생님(선생님 아이디 형식) X => 신수진 선생님(선생님 이름 형식) O
        for(ClassDAO a: allClass) {
            int teacher_idx = a.getTeacherId();
            System.out.println(a.print(teacher_idx));
        }
        sqlSession.close();
    }

    // 학생이 수업 번호를 입력할 시, student_class 테이블에 입력 정보를 INSERT한다.
    public void purchaseClass(int studentIdx, int classNum) {
        SqlSession sqlSession = MyBatisMapperFactory.getSqlSession(); // 마이바티스 연동 확인 코드
        PurchaseClassMapper_sz mapper = sqlSession.getMapper(PurchaseClassMapper_sz.class); // 인터페이스에 객체 생성 후 마이바티스 연동

        Map<String, Integer> param = new HashMap<>();
        param.put("student_id", studentIdx);
        param.put("class_id", classNum);
        sqlSession.insert("repository.mapper.PurchaseClassMapper_sz.purchaseClass", param);
        sqlSession.commit();
        sqlSession.close();
        System.out.println(classNum + "번 수업을 구매하였습니다!");
    }

    // student_class에 학생이 입력한 수업 번호가 있는지 확인한다. (중복된 수업을 결제하려는 시도를 막는다.)
    public boolean existClass(int student_id, int classNum) {
        SqlSession sqlSession = MyBatisMapperFactory.getSqlSession(); // 마이바티스 연동 확인 코드
        StudentClassMapper_sz mapper = sqlSession.getMapper(StudentClassMapper_sz.class); // 인터페이스에 객체 생성 후 마이바티스 연동

        boolean exist = false;

        List<StudentClassDAO> existList = mapper.existClass(student_id);

        for (StudentClassDAO a : existList) {
            if (classNum == a.getClassId()) {
                exist = true;
                sqlSession.close();
                break;
            }
        }
        sqlSession.close();
        return exist;
    }
}

