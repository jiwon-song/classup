package lee;

import java.util.HashMap;

public interface LeeMemberService {
	//CRUD(Create, Read, Update, Delete)
	boolean member_join(LeeMemberVO vo); //회원가입시 회원정보저장
	LeeMemberVO member_login(HashMap<String, String> map); //로그인처리
	void member_myinfo(LeeMemberVO vo);//내정보보기
	boolean member_id_check(String id); //아이디중복확인(아이디존재여부)
	boolean member_update(LeeMemberVO vo); //내정보수정
	boolean member_delete(String id); //회원탈퇴시
	
	String member_salt(String id); //회원id에 해당하는 salt를 조회
	boolean member_reset_password(LeeMemberVO vo); //비밀번호 변경하기
}
