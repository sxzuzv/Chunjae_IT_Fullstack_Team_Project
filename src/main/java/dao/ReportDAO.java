package dao;


import dto.BoardDTO;
import dto.ReportDTO;
import mybatis.factory.MyBatisSessionFactory;
import mybatis.mapper.BoardMapper;
import mybatis.mapper.ReportMapper;
import org.apache.ibatis.session.SqlSession;

import java.util.List;
import java.util.Map;

public class ReportDAO {
  //신수진


  //최경락


  //최영주
  public int reportInsertWrite(ReportDTO dto) {
    SqlSession sqlSession = MyBatisSessionFactory.getSqlSession();
    ReportMapper mapper = sqlSession.getMapper(ReportMapper.class);
    int result = mapper.reportInsertWrite(dto);
    if (result == 1) {
      sqlSession.commit();
      System.out.println("신고글 신규 저장 성공");
    } else {
      System.out.println("신고글 신규 저장 실패");
    }
    sqlSession.close();
    return result;
  }



  //최재혁

}
