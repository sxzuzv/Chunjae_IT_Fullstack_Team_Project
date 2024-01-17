package kr.co.chunjae.member.dao;

import kr.co.chunjae.member.vo.MemberVO;
import lombok.RequiredArgsConstructor;
import org.apache.ibatis.session.SqlSession;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import java.util.Map;

@Repository("memberDAO")
@RequiredArgsConstructor
public class MemberDAOImpl  implements MemberDAO{

	private final SqlSession sqlSession;
	
	@Override
	public MemberVO login(Map loginMap) throws DataAccessException{
		MemberVO member=(MemberVO)sqlSession.selectOne("mapper.member.login",loginMap);
	   return member;
	}
	
	@Override
	public void insertNewMember(MemberVO memberVO) throws DataAccessException{
		sqlSession.insert("mapper.member.insertNewMember",memberVO);
	}

	@Override
	public String selectOverlappedID(String id) throws DataAccessException {
		String result =  sqlSession.selectOne("mapper.member.selectOverlappedID",id);
		return result;
	}

	@Override
	public MemberVO authPwMember(Map<String, String> authMap) {
		return sqlSession.selectOne("mapper.member.authMember", authMap);
	}

	@Override
	public int pwChange(MemberVO memberVO) throws DataAccessException {
		return sqlSession.update("mapper.member.pwChange", memberVO);
	}

	@Override
	public MemberVO idFind(Map<String, String> authMap) throws DataAccessException {
		return sqlSession.selectOne("mapper.member.authId", authMap);
	}

	@Override
	public void insertAuth(String memberId) {
		sqlSession.insert("mapper.member.insertAuth", memberId);
	}
}
