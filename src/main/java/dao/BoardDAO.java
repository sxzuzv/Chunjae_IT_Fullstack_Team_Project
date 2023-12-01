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
    public int marketSelectCount(Map<String, Object> map) {
      SqlSession sqlSession = MyBatisSessionFactory.getSqlSession();
      BoardMapper mapper = sqlSession.getMapper(BoardMapper.class);
      int result = mapper.marketSelectCount(map);
      System.out.println("selectCount - 행 개수 = " + result);
      sqlSession.close();
      return result;
    }

  public List<BoardDTO> marketSelectListPage(Map<String, Object> map) {
    SqlSession sqlSession = MyBatisSessionFactory.getSqlSession();
    BoardMapper mapper = sqlSession.getMapper(BoardMapper.class);
    List<BoardDTO> result = mapper.marketSelectListPage(map);
    sqlSession.close();
    return result;
  }

  public int marketInsertWrite(BoardDTO dto) {
    SqlSession sqlSession = MyBatisSessionFactory.getSqlSession();
    BoardMapper mapper = sqlSession.getMapper(BoardMapper.class);
    int result = mapper.marketInsertWrite(dto);
    if (result == 1) {
      sqlSession.commit();
      System.out.println("새로운 mvcboard 저장 성공");
    } else {
      System.out.println("새로운 mvcboard 저장 실패");
    }
    sqlSession.close();
    return result;
  }

  public int marketInsertWritePdt(BoardDTO dto) {
    SqlSession sqlSession = MyBatisSessionFactory.getSqlSession();
    BoardMapper mapper = sqlSession.getMapper(BoardMapper.class);
    int result = mapper.marketInsertWritePdt(dto);
    if (result == 1) {
      sqlSession.commit();
      System.out.println("새로운 mvcboard 저장 성공");
    } else {
      System.out.println("새로운 mvcboard 저장 실패");
    }
    sqlSession.close();
    return result;
  }

  public BoardDTO marketSelectView(String brdId) {
    SqlSession sqlSession = MyBatisSessionFactory.getSqlSession();
    BoardMapper mapper = sqlSession.getMapper(BoardMapper.class);
    BoardDTO dto = mapper.marketSelectView(brdId);
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

  public int marketUpdatePost(BoardDTO dto) {
    SqlSession sqlSession = MyBatisSessionFactory.getSqlSession();
    BoardMapper mapper = sqlSession.getMapper(BoardMapper.class);
    int result = mapper.marketUpdatePost(dto);
    if (result == 1) {
      sqlSession.commit();
    } else {
      System.out.println("board update 중 오류 발생...");
    }
    sqlSession.commit();
    return result;
  }

  public int deletePost(String brdId) {
    SqlSession sqlSession = MyBatisSessionFactory.getSqlSession();
    BoardMapper mapper = sqlSession.getMapper(BoardMapper.class);
    int result = mapper.deletePost(brdId);
    if (result == 1) {
      sqlSession.commit();
    } else {
      System.out.println("board 삭제 중 오류 발생...");
    }
    return result;
  }

  public int deletePdtPost(String brdId) {
    SqlSession sqlSession = MyBatisSessionFactory.getSqlSession();
    BoardMapper mapper = sqlSession.getMapper(BoardMapper.class);
    int result = mapper.deletePdtPost(brdId);
    if (result == 1) {
      sqlSession.commit();
    } else {
      System.out.println("board 삭제 중 오류 발생...");
    }
    return result;
  }

  public boolean confirmPassword(String pass, String brdId) {
    Map<String, String> map = new HashMap<>();
    map.put("pass", Encrypt.getEncrypt(pass));
    map.put("brdId", brdId);
    SqlSession sqlSession = MyBatisSessionFactory.getSqlSession();
    BoardMapper mapper = sqlSession.getMapper(BoardMapper.class);
    int result = mapper.confirmPassword(map);
    if (result == 1) {
      return true;
    } else {
      return false;
    }
  }


  //최재혁
}
