package kr.co.chunjae.security.mapper;


import kr.co.chunjae.member.vo.MemberVO;

public interface SecurityMemberMapper {

  public MemberVO read(String userid);

  MemberVO login(String username);
}
