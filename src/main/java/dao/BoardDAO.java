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
// [선생님 요모조모_소분류 공통] 검색 조건에 맞는 게시글 개수 카운트
public int tcselectCount(Map<String, Object> map) {
  SqlSession sqlSession = MyBatisSessionFactory.getSqlSession();
  BoardMapper mapper = sqlSession.getMapper(BoardMapper.class);

  // 쿼리문 실행 결과(= 검색 조건에 맞는 게시글 개수)를 totalCount에 저장
  int totalCount = mapper.tcselectCount(map);
  sqlSession.close();
  // 검색 조건에 맞는 게시글 개수를 서블릿(.java)으로 반환
  return totalCount;
}

  // [선생님 요모조모_소분류 공통] 검색 조건에 맞는 게시물 목록 출력
  public List<BoardDTO> tcselectListPage(Map<String, Object> map) {
    SqlSession sqlSession = MyBatisSessionFactory.getSqlSession();
    BoardMapper mapper = sqlSession.getMapper(BoardMapper.class);

    // 쿼리문 실행 결과(= 검색 조건에 맞는 게시물 목록)를 result에 저장
    List<BoardDTO> result = mapper.tcselectListPage(map);

    sqlSession.close();
    // 검색 조건에 맞는 게시물 목록을 서블릿(
    return result;
  }

  // [선생님 요모조모_소분류 공통] 게시물 페이징
  public List<BoardDTO> tcselectListPageWithPaging(Map<String, Object> map) {
    SqlSession sqlSession = MyBatisSessionFactory.getSqlSession();
    BoardMapper mapper = sqlSession.getMapper(BoardMapper.class);
    List<BoardDTO> result = mapper.tcselectListPageWithPaging(map);
    sqlSession.close();
    return result;
  }

  public BoardDTO tcselectView(String idx) {
    SqlSession sqlSession = MyBatisSessionFactory.getSqlSession();
    BoardMapper mapper = sqlSession.getMapper(BoardMapper.class);
    BoardDTO dto = mapper.tcselectView(idx);
    sqlSession.close();
    return dto;
  }

  // 조회수 기준 인기 게시글(3개) 리스트업
  public List<BoardDTO> selectTopList(Map<String, Object> map) {
    SqlSession sqlSession = MyBatisSessionFactory.getSqlSession();
    BoardMapper mapper = sqlSession.getMapper(BoardMapper.class);

    List<BoardDTO> result = mapper.tcselectTopList(map);
    sqlSession.close();
    return result;
  }

  // 게시물 수정
  public int tcUpdatePost(BoardDTO dto) {
    SqlSession sqlSession = MyBatisSessionFactory.getSqlSession();
    BoardMapper mapper = sqlSession.getMapper(BoardMapper.class);
    int result = mapper.tcUpdatePost(dto);
    if (result == 1) {
      sqlSession.commit();
    } else {
      System.out.println("board update 중 오류 발생...");
    }
    sqlSession.commit();
    return result;
  }

  public int tcinsertWrite(BoardDTO dto) {
    SqlSession sqlSession = MyBatisSessionFactory.getSqlSession();
    BoardMapper mapper = sqlSession.getMapper(BoardMapper.class);
    int result = mapper.tcinsertWrite(dto);
    if (result == 1) {
      sqlSession.commit();
      System.out.println("새로운 게시물 저장 성공");
    } else {
      System.out.println("새로운 게시물 저장 실패");
    }
    sqlSession.close();
    return result;
  }

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

  public int marketUpdatePostPdt(BoardDTO dto) {
    SqlSession sqlSession = MyBatisSessionFactory.getSqlSession();
    BoardMapper mapper = sqlSession.getMapper(BoardMapper.class);
    int result = mapper.marketUpdatePostPdt(dto);
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

  public boolean confirmPassword(String userId, String brdId) {
    Map<String, String> map = new HashMap<>();
    map.put("userId", userId);
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

