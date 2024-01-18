package kr.co.chunjae.member.dao;

import kr.co.chunjae.member.vo.MemberVO;
import org.springframework.dao.DataAccessException;

import java.util.Map;

public interface MemberDAO {
	public MemberVO login(Map loginMap) throws DataAccessException;
	public int insertNewMember(MemberVO memberVO) throws DataAccessException;
	public String selectOverlappedID(String id) throws DataAccessException;
    public MemberVO authPwMember(Map<String, String> authMap) throws DataAccessException;
    public int pwChange(MemberVO memberVO) throws DataAccessException;

    public MemberVO idFind(Map<String, String> authMap) throws DataAccessException;

  public void insertAuth(String memberId);
}
