package kr.co.chunjae.member.service;

import java.util.Map;

import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import kr.co.chunjae.member.dao.MemberDAO;
import kr.co.chunjae.member.vo.MemberVO;

@Service("memberService")
@Transactional(propagation=Propagation.REQUIRED)
@RequiredArgsConstructor
public class MemberServiceImpl implements MemberService {

	private final MemberDAO memberDAO;
	
	@Override
	public MemberVO login(Map loginMap) throws Exception{
		return memberDAO.login(loginMap);
	}
	
	@Override
	public void addMember(MemberVO memberVO) throws Exception{
		memberDAO.insertNewMember(memberVO);
	}
	
	@Override
	public String overlapped(String id) throws Exception{
		return memberDAO.selectOverlappedID(id);
	}

	@Override
	public MemberVO authPwMember(Map<String, String> authMap) {
		return memberDAO.authPwMember(authMap);
	}

	@Override
	public int pwChange(MemberVO memberVO) {
		return memberDAO.pwChange(memberVO);
	}

	@Override
	public MemberVO idFind(Map<String, String> authMap) {
		return memberDAO.idFind(authMap);
	}
}
