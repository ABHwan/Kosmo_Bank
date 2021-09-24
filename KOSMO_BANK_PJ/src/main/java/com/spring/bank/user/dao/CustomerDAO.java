package com.spring.bank.user.dao;

import java.util.Map;

import com.spring.bank.user.vo.UserVO;

public interface CustomerDAO {
	
	// ID 중복확인 처리
	public int idCheck(Map<String, Object> map);
	
	// 회원가입 처리
	public int insertUser(UserVO vo);
	
	// 로그인 처리
	public int idPasswordChk(Map<String, Object> map);
	
	// 이메일 인증 성공 처리
	public int emailSuccess(UserVO vo);
	
	// 이메일 인증
	public int emailChk(String strId);

	// 회원정보 탈퇴 처리
	public int deleteUser(String strId);
	
	// 회원정보 상세 페이지 처리
	public UserVO getUserInfo(String strId);
	
	// 회원 정보 수정 처리
	public int updateUser(UserVO vo);
	
	// 아이디 찾기
	public UserVO idFind(Map<String, Object> map);
	
	// 비밀번호 찾기(입력받은 정보로 멤버 정보 가져오기) 이메일 발송 위해
	public UserVO customerFind(Map<String, Object> map);
	
	// 비밀번호 변경(재설정한 비밀번호 저장)
	public int updatePassword(UserVO vo);

}
