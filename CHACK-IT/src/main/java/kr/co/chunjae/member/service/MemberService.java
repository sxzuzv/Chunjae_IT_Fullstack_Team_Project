package kr.co.chunjae.member.service;

import kr.co.chunjae.member.vo.MemberVO;
import org.springframework.security.core.Authentication;
import org.springframework.ui.Model;

import java.util.Map;

public interface MemberService {
	public MemberVO login(Map loginMap) throws Exception;
	public int addMember(MemberVO memberVO) throws Exception;
	public String overlapped(String id) throws Exception;
    public MemberVO authPwMember(Map<String, String> authMap);
    public int pwChange(MemberVO memberVO);

	public MemberVO idFind(Map<String, String> authMap);

	public void addAuth(String memberId);


}
