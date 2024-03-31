package kr.co.chunjae.admin.member.dao;

import java.util.ArrayList;
import java.util.HashMap;

import kr.co.chunjae.member.vo.MemberVO;
import org.springframework.dao.DataAccessException;

public interface AdminMemberDAO {
	public ArrayList<MemberVO> listMember(HashMap condMap) throws DataAccessException;
	public MemberVO memberDetail(String member_id) throws DataAccessException;
//	public void modifyMemberInfo(HashMap memberMap) throws DataAccessException;
	public int modifyMemberInfo(MemberVO memberVO) throws DataAccessException;
}
