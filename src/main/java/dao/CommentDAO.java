package dao;

import dto.BoardCommentDTO;
import dto.BoardDTO;
import mybatis.factory.MyBatisSessionFactory;
import mybatis.mapper.CommentMapper;
import org.apache.ibatis.session.SqlSession;

import java.util.List;
import java.util.Map;

public class CommentDAO {
    //신수진


    //최경락


    //최영주
    public int insertWriteComment(BoardCommentDTO dto) {
      SqlSession sqlSession = MyBatisSessionFactory.getSqlSession();
      CommentMapper mapper = sqlSession.getMapper(CommentMapper.class);
      int result = mapper.insertWriteComment(dto);
      if (result == 1) {
        sqlSession.commit();
        System.out.println("새로운 코멘트 저장 성공");
      } else {
        System.out.println("새로운 코멘트 저장 실패");
      }
      sqlSession.close();
      return result;
    }

    public List<BoardCommentDTO> selectCommentList(Map<String, Object> map) {
      SqlSession sqlSession = MyBatisSessionFactory.getSqlSession();
      CommentMapper mapper = sqlSession.getMapper(CommentMapper.class);
      List<BoardCommentDTO> result = mapper.selectCommentList(map);
      sqlSession.close();
      return result;
    }

    //최재혁

}
