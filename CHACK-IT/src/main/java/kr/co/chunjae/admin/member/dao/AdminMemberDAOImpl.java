package kr.co.chunjae.admin.member.dao;

import java.lang.reflect.Member;
import java.util.ArrayList;
import java.util.HashMap;

import kr.co.chunjae.member.vo.MemberVO;
import lombok.RequiredArgsConstructor;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

@RequiredArgsConstructor
@Repository("adminMemberDao")
public class AdminMemberDAOImpl implements AdminMemberDAO{
	private final SqlSession sqlSession;
	
	public ArrayList<MemberVO> listMember(HashMap condMap) throws DataAccessException{
		ArrayList<MemberVO>  memberList=(ArrayList)sqlSession.selectList("mapper.admin.member.listMember",condMap);
		return memberList;
	}
	
	public MemberVO memberDetail(String member_id) throws DataAccessException{
		MemberVO memberBean=(MemberVO)sqlSession.selectOne("mapper.admin.member.memberDetail",member_id);
		return memberBean;
	}
	
//	public void modifyMemberInfo(HashMap memberMap) throws DataAccessException{
//		sqlSession.update("mapper.admin.member.modifyMemberInfo",memberMap);
//	}

	public int modifyMemberInfo(MemberVO memberVO) throws DataAccessException {
		return sqlSession.update("mapper.admin.member.modifyMemberInfo", memberVO);
	}
	
	

}
