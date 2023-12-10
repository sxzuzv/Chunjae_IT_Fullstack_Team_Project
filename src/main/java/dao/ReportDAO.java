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
  public List<ReportDTO> reportListPageWithPaging(Map<String, Object> map) {
    SqlSession sqlSession = MyBatisSessionFactory.getSqlSession();
    ReportMapper mapper = sqlSession.getMapper(ReportMapper.class);
    List<ReportDTO> result = mapper.reportListPageWithPaging(map);
    sqlSession.close();
    return result;
  }

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

  public int reportSelectCount(Map<String, Object> map) {
    SqlSession sqlSession = MyBatisSessionFactory.getSqlSession();
    ReportMapper mapper = sqlSession.getMapper(ReportMapper.class);
    int result = mapper.reportSelectCount(map);
    System.out.println("selectCount - 행 개수 = " + result);
    sqlSession.close();
    return result;
  }

  public List<ReportDTO> reportSelectListPage(Map<String, Object> map) {
    SqlSession sqlSession = MyBatisSessionFactory.getSqlSession();
    ReportMapper mapper = sqlSession.getMapper(ReportMapper.class);
    List<ReportDTO> result = mapper.reportSelectListPage(map);
    sqlSession.close();
    return result;
  }

  public ReportDTO reportSelectView(String reportId) {
    SqlSession sqlSession = MyBatisSessionFactory.getSqlSession();
    ReportMapper mapper = sqlSession.getMapper(ReportMapper.class);
    ReportDTO dto = mapper.reportSelectView(reportId);
    sqlSession.close();
    return dto;
  }

  public int reportDelete(String reportId) {
    SqlSession sqlSession = MyBatisSessionFactory.getSqlSession();
    ReportMapper mapper = sqlSession.getMapper(ReportMapper.class);
    int result = mapper.reportDelete(reportId);
    if (result == 1) {
      sqlSession.commit();
    } else {
      System.out.println("report 삭제 중 오류 발생...");
    }
    return result;
  }



  //최재혁

}
