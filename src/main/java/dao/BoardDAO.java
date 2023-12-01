package dao;


import dto.BoardDTO;
import mybatis.factory.MyBatisSessionFactory;
import mybatis.mapper.AdminMapper;
import mybatis.mapper.BoardMapper;
import mybatis.mapper.UserMapper;
import org.apache.ibatis.session.SqlSession;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

// categories, report 테이블의 경우 여기서 모두 접근
public class BoardDAO {

    //신수진 신수진 ~


    //최경락
    private final SqlSession sqlSession;

    public BoardDAO(SqlSession sqlSession) {
        this.sqlSession = sqlSession;
    }

    /*public List<BoardDTO> selectBoardCate(int cateNo5, int cateNo6) {
        Map<String, Object> parameterMap = new HashMap<>();
        parameterMap.put("cateNo5", 5);
        parameterMap.put("cateNo6", 6);

        return sqlSession.selectList("selectBoardCate", parameterMap);
    }*/


    public List<BoardDTO> getPostsByCategories(int cateNo5, int cateNo6) {
        Map<String, Object> parameterMap = new HashMap<>();
        parameterMap.put("cateNo5", 5);
        parameterMap.put("cateNo6", 6);

        return sqlSession.selectList("selectBoardCate", parameterMap);
    }
}


    //최영주


    //최재혁

