package kr.co.chunjae.classarchive.mapper.member;

import kr.co.chunjae.classarchive.dto.member.MemberDTO;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface MemberMapper {
  // 아이디로 회원 정보 조회
  public MemberDTO selectMemberById(String memberId);
}