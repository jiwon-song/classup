package com.hanul.project;


import java.util.HashMap;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import common.CommonService;
import lee.LeeMemberServiceImpl;
import lee.LeeMemberVO;


@Controller 
public class LeeController {
	@Autowired private LeeMemberServiceImpl service;
	@Autowired private CommonService common;
	private String teacher_id;
	
	//회원정보변경처리 요청
		@RequestMapping("/changeInfo")
		public String change(HttpSession session, LeeMemberVO vo,
				@RequestParam String pw) {
			teacher_id = common.getTeacherID(session);
			//기존의 salt를 사용해 새로 입력한 비밀번호를 암호화한다.
			String salt = service.member_salt(teacher_id);
			String salt_pw = common.getEncrypt(pw, salt);
			vo.setTeacher_pw(pw);
			
			vo.setSalt_pw(salt_pw);
			service.member_myinfo(vo);
			//세션의 로그인사용자정보를 변경된 정보로 바꿔 담는다
			
			return "redirect:/main";
		}

		//마이페이지화면 요청
		@RequestMapping("/myinfo")
		public String myinfo(Model model, HttpSession session) {
			teacher_id = common.getTeacherID(session);
			LeeMemberVO vo = service.getinfo(teacher_id);
			model.addAttribute("vo", vo);
			return "member/myinfo";
		}
		
	
	//회원가입화면 요청
		@RequestMapping("/member")
		public String member(HttpSession ss) {
			ss.setAttribute("category", "join");
			return "member/join";
		}
		
	//회원가입처리 요청
	@RequestMapping(value="/join", produces="text/html; charset=utf-8") 
	@ResponseBody
	public String join(LeeMemberVO vo, HttpServletRequest req) {
		//입력한 비밀번호를 암호화하기 위한 salt생성
		String salt = common.generateSalt();
		String salt_pw = common.getEncrypt(vo.getTeacher_pw(), salt);
		vo.setSalt(salt);
		vo.setSalt_pw(salt_pw);
		
		//화면에서 입력한 정보를 DB에 신규저장한 후
		StringBuffer msg = new StringBuffer("<script>");
		if( service.member_join(vo) ) {
			//회원가입 성공여부를 alert으로 띄운 후
			msg.append("alert('회원가입을 축하합니다!'); location='")
				.append( req.getContextPath() ).append("'; ");
		}else {
			msg.append("alert('회원가입 실패'); history.go(-1);");
		}
		msg.append("</script>");
		//응답화면 연결 - 웰컴
		return msg.toString();
	}
	/*
	//비밀번호변경처리 요청
	@RequestMapping("/changePw")
	public String change(HttpSession ss,
							@RequestParam String pw) {
		//화면에서 입력한 비밀번호를 새로운 비밀번호로 하여 DB에 변경저장
		//기존의 salt를 사용해 새로 입력한 비밀번호를 암호화한다.
		LeeMemberVO vo = (LeeMemberVO)ss.getAttribute("loginInfo");
		pw = common.getEncrypt(pw, vo.getSalt());
		vo.setSalt_pw(pw);
		service.member_reset_password(vo);
		//세션의 로그인사용자정보를 변경된 정보로 바꿔 담는다
		ss.setAttribute("loginInfo", vo);
			
		//응답화면 연결 - 웰컴페이지
		return "redirect:/";
	}
		
	*/
	//로그아웃처리 요청
	@RequestMapping("/logout")
	public String logout(HttpSession ss, HttpServletRequest req) {
		//카카오로그인 한 경우, 카카오계정도 함께 로그아웃되도록 처리
		//social: N, K, null
		String social 
		= ((LeeMemberVO)ss.getAttribute("loginInfo")).getSocial();
		
		//세션에 저장된 로그인사용자 정보를 삭제
		ss.removeAttribute("loginInfo");
		
		if( social != null && social.equals("K") ) {
			String app = req.getRequestURL().substring(0, 
					req.getRequestURL().length()-req.getServletPath().length() );
				
			StringBuffer url 
			= new StringBuffer("https://kauth.kakao.com/oauth/logout");
			url.append("?client_id=").append(KAKAO_ID);
			url.append("&logout_redirect_uri=").append(app);
			return "redirect:" + url.toString() ;
		}else
			return "redirect:/";
	}
		
	//비밀번호변경화면 요청
	@RequestMapping("/password")
	public String change(HttpSession ss) {
		//로그인된 상태인 경우만 화면 연결 가능
		LeeMemberVO vo = (LeeMemberVO)ss.getAttribute("loginInfo");
		if( vo==null )
			return "redirect:login";
		else {			
			ss.setAttribute("category", "password");
			return "member/password";
		}
	}
	
	//비밀찾기재발급 요청
	@ResponseBody 
	@RequestMapping(value="/resetPw"
					, produces="text/html; charset=utf-8" )
	public String reset(LeeMemberVO vo) {
		//화면에서 입력한 아이디에 대한 임시비밀번호를 입력한 이메일로 전송한다
		//임시비밀번호를 랜덤하게 만들어내도록 한다
		String pw = common.resetPassword(
						vo.getTeacher_id(), vo.getTeacher_name(), vo.getEmail());
		
		
		String salt_pw="";
		//비밀번호를 만들기 위해서 암호화에 사용할 salt
		String salt = common.generateSalt();
		
		//임시발급된 비밀번호를 salt를 사용해 암호화한다.
		salt_pw = common.getEncrypt(pw, salt);  //암호화된 비밀번호
		
		//화면에서 입력한 아이디에 대해 salt, 암호화된 비밀번호로 DB에 변경저장한다
		vo.setSalt(salt);
		vo.setSalt_pw(salt_pw);
		vo.setTeacher_pw(pw);
		boolean reset = service.member_reset_password(vo);
		
		//응답할 화면 - 비밀번호가 정상 발급된 경우 로그인화면
		//                       발급되지 않은 경우 비밀번호 재발급화면
		StringBuffer msg = new StringBuffer();		
		msg.append("<script>");
		if( reset ) {
			msg.append("alert('임시 비밀번호가 발급되었습니다^^\\n이메일을 확인하세요');")
				.append("location='../project';");
			
		}else {
			msg.append("alert('임시 비밀번호발급 실패ㅠㅠ'); history.go(-2);");
		}
		msg.append("</script>");
		return msg.toString();
	}
	
		
	//비밀찾기화면 요청
	@RequestMapping("/findPw")
	public String find(HttpSession session) {
		session.setAttribute("category", "find");
		return "member/find";
	}
	
	
	//로그인처리 요청
	@ResponseBody @RequestMapping("/home")
	public boolean login(String id, String pw, HttpSession session) {
		//회원id에 해당하는 salt를 조회
		String salt = service.member_salt(id);
		//salt 를 사용해 로그인시 입력한 비밀번호를 암호화한 후 
		//암호화 한 비밀번호를 사용해 로그인한다
		String salt_pw = common.getEncrypt(pw, salt);
		System.out.println(salt_pw);
		//화면에서 입력한 아이디와 비밀번호가 일치하는 회원정보가 DB에 있는지 조회한 후(비지니스로직)
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("id", id);
		map.put("salt_pw", salt_pw);
		LeeMemberVO vo = service.member_login(map);
		
		//일치하는 회원정보를 세션에 attribute로 담는다
		session.setAttribute("loginInfo", vo);
		
		//로그인여부를 응답한다.
		return vo==null ? false : true;
	}
		
	//아이디 중복확인 요청
	@ResponseBody @RequestMapping("/id_check")
	public boolean id_check(String id) {
		//화면에서 입력한 아이디가 DB에 존재하는지 확인하여
		//존재여부를 ajax통신쪽으로 가지고 돌아간다
		//0 ? false(사용가능아이디) : true(이미사용중인아이디)
		return service.member_id_check(id);
	}
		
		private String NAVER_ID = "nSU3FcDBSR0dEiJT2SZA";
		private String NAVER_SECRET = "rS6EMiQkej";
		private String KAKAO_ID = "5d5c21b429ef41d1b109563b28dfd044"; //REST API 키	
		
		//카카오로그인
		@RequestMapping("/kakao_login")
		public String kakaologin(HttpServletRequest req) {
			String app = req.getRequestURL().substring(0, 
					req.getRequestURL().length()-req.getServletPath().length() );
			StringBuffer url 
			= new StringBuffer("https://kauth.kakao.com/oauth/authorize?response_type=code");
			url.append("&client_id=").append(KAKAO_ID);
			url.append("&redirect_uri=").append(app).append("/kakaocallback");
			
			return "redirect:"+url.toString();
		}
		
		//카카오콜백
		@RequestMapping("/kakaocallback")
		public String kakaocallback(HttpSession ss	
									, String code, String error) {
		if( error!=null ) return "redirect:/"; 
		
		//접근토큰발급요청
		StringBuffer url 
		= new StringBuffer("https://kauth.kakao.com/oauth/token?grant_type=authorization_code");
		url.append("&client_id=").append(KAKAO_ID);
		url.append("&code=").append(code);
		JSONObject json = new JSONObject( common.requestAPI(url) );
		String type = json.getString("token_type");
		String token = json.getString("access_token");
		
		//토큰을 사용해 프로필정보 가져오기
		url = new StringBuffer("https://kapi.kakao.com/v2/user/me");
		json = new JSONObject( common.requestAPI(url, type + " " + token) );
		//카카오 프로필정보를 사이트회원정보를 저장하자
		LeeMemberVO vo = new LeeMemberVO();
		vo.setSocial("K");
		vo.setTeacher_id( json.get("id").toString() );
		json = json.getJSONObject("kakao_account");
		vo.setTeacher_name( json.has("name") ? json.getString("name") : "");
		vo.setEmail( json.has("email") ? json.getString("email"): "" );
		if( vo.getTeacher_name().isEmpty() ) {
			//name 정보가 없으면 nickname 을 넣는다
			String name = json.getJSONObject("profile").getString("nickname");
			vo.setTeacher_name( name );
		}
		vo.setTeacher_pw("social");
		//카카오로그인이 처음이면(아이디존재여부) 신규저장 아니면 변경저장
		//0? false : true
		if( service.member_id_check(vo.getTeacher_id()) )
			service.member_update(vo);
		else
			service.member_join(vo);
	
		ss.setAttribute("loginInfo", vo);
		
		return "redirect:/main"; 
	}
	
	//네이버로그인
	@RequestMapping("/naver_login")
	public String naverlogin(HttpSession session, HttpServletRequest req) {
		
		String state = UUID.randomUUID().toString();
		session.setAttribute("state", state);
		
		String app = req.getRequestURL().substring(0, 
			req.getRequestURL().length()-req.getServletPath().length() );
		
		StringBuffer url
		= new StringBuffer("https://nid.naver.com/oauth2.0/authorize?response_type=code");
		url.append("&client_id=").append(NAVER_ID);
		url.append("&state=").append(state);
		url.append("&redirect_uri=").append(app).append("/navercallback");
		//url.append("&scope=account_email");
		
		return "redirect:" + url.toString();
	}
	
	//네이버아이디로로그인 연동한 결과
	@RequestMapping("/navercallback")
	public String navercallback(HttpSession ss
					, String code, String state, String error) {
		
		if( error!=null 
			|| !state.equals((String)ss.getAttribute("state")) ) return "redirect:/";
		
		StringBuffer url 
		= new StringBuffer("https://nid.naver.com/oauth2.0/token?grant_type=authorization_code");
		url.append("&client_id=").append(NAVER_ID);
		url.append("&client_secret=").append(NAVER_SECRET);
		url.append("&code=").append(code);
		url.append("&state=").append(state);
		
		String result = common.requestAPI(url);
		//String -> JSON 변환
		JSONObject json = new JSONObject(result);
		String access_token = json.getString("access_token");
		String token_type = json.getString("token_type");
		
		//네이버프로필정보 조회해오기
		url = new StringBuffer("https://openapi.naver.com/v1/nid/me");
		json = new JSONObject(
				common.requestAPI(url, token_type + " " + access_token) );
		
		if( json.getString("resultcode").equals("00") ) {
			//프로필정보를 사이트 회원정보를 저장하자
			LeeMemberVO vo = new LeeMemberVO();
			vo.setSocial("N");
			json = json.getJSONObject("response");
			vo.setTeacher_id( json.getString("id") );
			vo.setTeacher_name( json.has("name") ? json.getString("name") 
										 : json.getString("nickname") );
			vo.setEmail( json.getString("email") );
			vo.setTeacher_pw("social");
			//네이버로그인이 처음이면(아이디존재여부) 신규저장  아니면 변경저장
			//0 ? false : true
			if( service.member_id_check( vo.getTeacher_id() ) ) {
				//변경저장
				service.member_update(vo);
			}else {
				//신규저장
				service.member_join(vo);
			}
			ss.setAttribute("loginInfo", vo);
		}
		
		//응답할 화면지정-웰컴
		return "redirect:/main";
	}

}