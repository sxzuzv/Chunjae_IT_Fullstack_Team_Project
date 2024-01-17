package kr.co.chunjae.member.service;

import kr.co.chunjae.member.vo.MemberVO;

import java.util.Map;

public interface MemberService {
	public MemberVO login(Map loginMap) throws Exception;
	public void addMember(MemberVO memberVO) throws Exception;
	public String overlapped(String id) throws Exception;
    public MemberVO authPwMember(Map<String, String> authMap);
    public int pwChange(MemberVO memberVO);

	public MemberVO idFind(Map<String, String> authMap);

	public void addAuth(String memberId);
}
