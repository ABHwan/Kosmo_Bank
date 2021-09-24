package com.spring.bank.admin.encrypt;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;

import com.spring.bank.user.vo.MemberVO;
import com.spring.bank.user.vo.UserVO;

// UserDetailService : 스프링 프레임워크에 내장된 인터페이스

// 로그인 인증을 처리
public class AdminAuthenticationService implements UserDetailsService {
	
	@Autowired
	SqlSessionTemplate sqlSession;
	
	// security-context.xml 에서 주입
	
	public AdminAuthenticationService(SqlSessionTemplate sqlSession) {
		this.sqlSession = sqlSession;
	}

	// 핵심코드
	/*
	 * 로그인 인증을 처리하는 메서드
	 * 매개변수 username => userid로 수정
	 * 매개변수로 전달된 아이디값에 해당하는 테이블의 레코드를 읽어온다.
	 * 테이블의 암호화된 비밀번호와 사용자가 입력한 비밀번호를 내부적으로 비교 처리
	 * 정보가 없으면 예외처리를 발생시키고, 있으면 해당정보를 Map(VO)로 리턴함
	 * 
	 * 로그인 처리시 [login-processing-url="/user/login_check.do"]에 의해 loadUserByUsername 호출
	 */
	@Override
	public UserDetails loadUserByUsername(String id) throws UsernameNotFoundException {
		
		UserVO user = sqlSession.selectOne("com.spring.bank.admin.dao.AdminDAO.SelectUser", id);
		System.out.println("로그인 체크 => " + id);
		
		// 인증실패 시 인위적으로 예외 발생'
		if(user == null) throw new UsernameNotFoundException(id);
		
		List<GrantedAuthority> authority = new ArrayList<GrantedAuthority>();
		authority.add(new SimpleGrantedAuthority(user.getMember_authority()));
		
		// 오라클에서는 필드명을 대문자로 취급
		// 사용자가 입력한 값과 테이블의 USERNAME, PASSWORD 룰 비교해서
		// 비밀번호가 불일치시 userLoginFailureHandler로 자동 이동
		// 비밀번호가 일치 시 userLoginSuccessHandler로 자동 이동
		
		return new MemberVO(user.getMember_name(),
						"{bcrypt}" + user.getMember_password(),
						user.getMember_enabled() == 1,
						true, true, true, user.getMember_id(), authority);
	}

}
