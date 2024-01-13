package kr.co.chunjae.member.dao;

import java.util.Map;

import org.springframework.dao.DataAccessException;

import kr.co.chunjae.member.vo.MemberVO;

public interface MemberDAO {
	public MemberVO login(Map loginMap) throws DataAccessException;
	public void insertNewMember(MemberVO memberVO) throws DataAccessException;
	public String selectOverlappedID(String id) throws DataAccessException;
    public MemberVO authPwMember(Map<String, String> authMap) throws DataAccessException;
    public int pwChange(MemberVO memberVO)throws DataAccessException;
}
