package dao;


import dto.BoardDTO;
import mybatis.factory.MyBatisSessionFactory;
import mybatis.mapper.BoardMapper;
import org.apache.ibatis.session.SqlSession;
import util.Encrypt;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

// categories, report 테이블의 경우 여기서 모두 접근
public class BoardDAO {
    //신수진 신수진 ~


    //최경락


    //최영주
    public int selectCount(Map<String, Object> map) {
      SqlSession sqlSession = MyBatisSessionFactory.getSqlSession();
      BoardMapper mapper = sqlSession.getMapper(BoardMapper.class);
      int result = mapper.selectCount(map);
      System.out.println("selectCount - 행 개수 = " + result);
      sqlSession.close();
      return result;
    }

  public List<BoardDTO> selectListPage(Map<String, Object> map) {
    SqlSession sqlSession = MyBatisSessionFactory.getSqlSession();
    BoardMapper mapper = sqlSession.getMapper(BoardMapper.class);
    List<BoardDTO> result = mapper.selectListPage(map);
    sqlSession.close();
    return result;
  }

  public int insertWrite(BoardDTO dto) {
    SqlSession sqlSession = MyBatisSessionFactory.getSqlSession();
    BoardMapper mapper = sqlSession.getMapper(BoardMapper.class);
    int result = mapper.insertWrite(dto);
    if (result == 1) {
      sqlSession.commit();
      System.out.println("새로운 mvcboard 저장 성공");
    } else {
      System.out.println("새로운 mvcboard 저장 실패");
    }
    sqlSession.close();
    return result;
  }

  public int insertWritePdt(BoardDTO dto) {
    SqlSession sqlSession = MyBatisSessionFactory.getSqlSession();
    BoardMapper mapper = sqlSession.getMapper(BoardMapper.class);
    int result = mapper.insertWritePdt(dto);
    if (result == 1) {
      sqlSession.commit();
      System.out.println("새로운 mvcboard 저장 성공");
    } else {
      System.out.println("새로운 mvcboard 저장 실패");
    }
    sqlSession.close();
    return result;
  }

  public BoardDTO selectView(String brdId) {
    SqlSession sqlSession = MyBatisSessionFactory.getSqlSession();
    BoardMapper mapper = sqlSession.getMapper(BoardMapper.class);
    BoardDTO dto = mapper.selectView(brdId);
    sqlSession.close();
    return dto;
  }

  public void updateVisitCount(String brdId) {
    SqlSession sqlSession = MyBatisSessionFactory.getSqlSession();
    BoardMapper mapper = sqlSession.getMapper(BoardMapper.class);
    int result = mapper.updateVisitCount(brdId);
    System.out.println("update query result val = " + result);
    if (result == 1) {
      sqlSession.commit();
    } else {
      System.out.println("조회수 증가 중 오류 발생");
    }
    sqlSession.close();
  }
    //최재혁
}
