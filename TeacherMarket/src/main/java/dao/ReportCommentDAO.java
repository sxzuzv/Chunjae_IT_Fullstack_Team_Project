package dao;

import dto.BoardCommentDTO;
import dto.ReportCommentDTO;
import mybatis.factory.MyBatisSessionFactory;
import mybatis.mapper.CommentMapper;
import mybatis.mapper.ReportCommentMapper;
import org.apache.ibatis.session.SqlSession;

import java.util.List;
import java.util.Map;

public class ReportCommentDAO {
    //신수진


    //최경락


    //최영주
    public int insertWriteComment(ReportCommentDTO dto) {
      SqlSession sqlSession = MyBatisSessionFactory.getSqlSession();
      ReportCommentMapper mapper = sqlSession.getMapper(ReportCommentMapper.class);
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

    public List<ReportCommentDTO> selectCommentList(Map<String, Object> map) {
      SqlSession sqlSession = MyBatisSessionFactory.getSqlSession();
      ReportCommentMapper mapper = sqlSession.getMapper(ReportCommentMapper.class);
      List<ReportCommentDTO> result = mapper.selectCommentList(map);
      sqlSession.close();
      return result;
    }

    public int deleteComment(String comId) {
        SqlSession sqlSession = MyBatisSessionFactory.getSqlSession();
        ReportCommentMapper mapper = sqlSession.getMapper(ReportCommentMapper.class);
        int result = mapper.deleteComment(comId);
        if (result == 1) {
            sqlSession.commit();
        } else {
            System.out.println("Comment 삭제 중 오류 발생...");
        }
        return result;
    }

    public int updateComment(ReportCommentDTO dto) {
        SqlSession sqlSession = MyBatisSessionFactory.getSqlSession();
        ReportCommentMapper mapper = sqlSession.getMapper(ReportCommentMapper.class);
        int result = mapper.updateComment(dto);
        if (result == 1) {
            sqlSession.commit();
        } else {
            System.out.println("Comment update 중 오류 발생...");
        }
        sqlSession.commit();
        return result;
    }
    //최재혁

}
