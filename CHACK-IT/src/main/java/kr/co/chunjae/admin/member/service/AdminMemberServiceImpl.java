package kr.co.chunjae.admin.member.service;

import java.util.ArrayList;
import java.util.HashMap;

import kr.co.chunjae.member.vo.MemberVO;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import kr.co.chunjae.admin.member.dao.AdminMemberDAO;


@Service("adminMemberService")
@RequiredArgsConstructor
@Transactional(propagation=Propagation.REQUIRED)
public class AdminMemberServiceImpl implements AdminMemberService {
	private final AdminMemberDAO adminMemberDAO;

	public ArrayList<MemberVO> listMember(HashMap condMap) throws Exception{
		return adminMemberDAO.listMember(condMap);
	}

	public MemberVO memberDetail(String member_id) throws Exception{
		 return adminMemberDAO.memberDetail(member_id);
	}
	
//	public void modifyMemberInfo(HashMap memberMap) throws Exception{
//		 String member_id=(String)memberMap.get("member_id");
//		 adminMemberDAO.modifyMemberInfo(memberMap);
//	}

	public int modifyMemberInfo(MemberVO memberVO) throws Exception {
		return adminMemberDAO.modifyMemberInfo(memberVO);
	}
}
