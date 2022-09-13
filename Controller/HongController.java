package com.hanul.project;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import common.CommonService;
import hong.ClassListVO;
import hong.HongCheckinVO;
import hong.HongService;
import hong.HongStudentListVO;
import hong.ScheduleListVO;
import hong.TestDetailVO;
import hong.TestVO;

@Controller
public class HongController {
	@Autowired private HttpSession session;
	@Autowired private HongService service;	
	@Autowired private CommonService common;	
	
	private String teacher_id;
	private String new_num = "";
	
	//public static boolean onOff = false;
	
	
	// 메인화면 연결
	@RequestMapping(value = "/main", method = RequestMethod.GET)
	public String home(Locale locale, Model model, HttpSession session) {
		teacher_id = common.getTeacherID(session);
				
		// 사이드메뉴에 반목록 가져오기
		List<ClassListVO> list = null;	
		list = service.class_list(teacher_id);
		model.addAttribute("list", list);
		model.addAttribute("teacher_id", teacher_id);	
		
		//샘일정 포스트잇
		List<ScheduleListVO> teacher_schedule = null;	
		teacher_schedule = service.schedule_list(teacher_id);
		
		System.out.println(teacher_schedule.size());
		
		model.addAttribute("teacher_schedule", teacher_schedule);
		
		if(teacher_schedule.size() == 0 ) {
			model.addAttribute("teacher_schedule", "no");			
		}
		
		return "index";
	}
	
	
	// 반별 테스트 목록 가죠오기
	@RequestMapping("test_list.ho")
	public String test_list(Model model, int class_id, String class_name, String dis, HttpSession session) {
		teacher_id = common.getTeacherID(session);
		
		// 사이드 메뉴에 붙일 클래스 목록
		List<ClassListVO> list = null;
		list = service.class_list(teacher_id);
		model.addAttribute("list", list);
		model.addAttribute("dis", dis);

		// 클래스 이름 뜨게 하기
		model.addAttribute("class_id", class_id);	// 클래스 이름 가져오게 수정할 것
		model.addAttribute("class_name", class_name);	// 클래스 이름 가져오게 수정할 것
		model.addAttribute("teacher_id", teacher_id);
		
		// 테스트 목록
		List<TestVO> test_list = null;
		test_list = service.test_list(class_id, teacher_id);
		
		model.addAttribute("test_list", test_list);
		
		//선택한 반 이름 뜨게 하기
		
		return "hong/test_list";	
	}
	
	// 테스트 추가하기 (vo에 저장되어 있는 class_id 사용)
	@RequestMapping("test_insert.ho")
	public String test_insert(TestVO vo) {
		
		//vo 에 저장되어 있으므로 사용하기만 하면 됨 			
		// 테스트 추가하는 메소드 
		service.test_insert(vo);
		String class_name = null;
		try {
			class_name = URLEncoder.encode(vo.getClass_name(), "UTF-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		
		return "redirect:test_list.ho?class_id="+vo.getClass_id()+"&dis=3&class_name="+class_name;	
	}
	
	
	// 테스트 삭제하기 (vo 를 사용하지 않기 떄문에 test_id 따로 넣어줘서 사용)
	@RequestMapping("test_delete.ho")
	public String test_delete(int test_id, int class_id, String class_name) {
		
		service.test_delete(test_id);		
		try {
			class_name = URLEncoder.encode(class_name, "UTF-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		return "redirect:test_list.ho?class_id="+class_id+"&dis=3&class_name="+class_name;
	}
	
	// 테스트 수정할수 있는 페이지 요청하기
	@RequestMapping("test_modify.ho")
	public String test_modify(Model model, int test_id, int class_id, String class_name, String test_name,  String dis, HttpSession session) {
		teacher_id = common.getTeacherID(session);
		
		
		// 사이드 메뉴에 붙일 클래스 목록
		List<ClassListVO> list = null;
		list = service.class_list(teacher_id);
		model.addAttribute("list", list);
		model.addAttribute("dis", dis);

		// 선택한 클래스의 이름이 뜨게 하기 위해서
		model.addAttribute("class_id", class_id);	// 클래스 이름 가져오게 수정할 것
		model.addAttribute("class_name", class_name);	// 클래스 이름 가져오게 수정할 것
		model.addAttribute("teacher_id", teacher_id);

		// 수정 선택한 테스트의 아이디를 가져옴
		model.addAttribute("test_id", test_id);	// 클래스 이름 가져오게 수정할 것

		// 테스트 목록
		List<TestVO> test_list = null;
		test_list = service.test_list(class_id, teacher_id);
		
		model.addAttribute("test_list", test_list);
		
		return "hong/test_modify";
	}
	
	// 테스트 수정 요청 보내기
	@RequestMapping("test_update.ho")
	public String test_update(Model model, TestVO vo, int class_id, int test_id, String class_name, String test_name, String test_date, HttpSession session) {
		teacher_id = common.getTeacherID(session);
		
		
		// 사이드 메뉴에 붙일 클래스 목록
		List<ClassListVO> list = null;
		list = service.class_list(teacher_id);
		model.addAttribute("list", list);	

		// 선택한 클래스의 이름이 뜨게 하기 위해서
		model.addAttribute("class_name", class_name);	// 클래스 이름 가져오게 수정할 것	
			
		service.test_update(vo);	
	
		return "redirect:test_list.ho?class_id="+class_id+"&dis=3";
	}
	
	
	
	
	// 테스트 상세 화면 불러오기 ////////////////////////////////////////////////////////////////////////////////////
	@RequestMapping(value="test_detail.ho",  produces="text/plain;charset=UTF-8")
	public String test_detail(Model model, int test_id, String test_name, String class_name, int class_id, String dis, HttpSession session) {
		teacher_id = common.getTeacherID(session);
		
		
		// 사이드 메뉴에 붙일 클래스 목록
		List<ClassListVO> list = null;
		list = service.class_list(teacher_id);
		model.addAttribute("list", list);	
		model.addAttribute("test_id", test_id);	
		model.addAttribute("class_id", class_id);	
		model.addAttribute("dis", dis);

		
		model.addAttribute("test_name", test_name);	
		model.addAttribute("class_name", class_name);	
		model.addAttribute("teacher_id", teacher_id);	
		
		List<TestDetailVO> test_detail_list = null; 		
		
		test_detail_list = service.test_detail(test_id);
		model.addAttribute("test_detail_list", test_detail_list);	
		System.out.println(test_detail_list.size());
		
		// 테스트 목록 가져오기
		List<TestVO> test_list = null;
		test_list = service.test_list(class_id, teacher_id);
		
		model.addAttribute("test_list", test_list);
		
		
		
		return "hong/test_detail";
	}
	

	// test_id 받아서 테스트명, 클래스명, 클래스 아이디 가져오기 , 한글 깨지는 현상 처리해줌
	@RequestMapping(value="test_id.ho" ,  produces="text/plain;charset=UTF-8")
	public String test_id(Model model, int test_id) {
		
		TestVO vo = service.test_id(test_id);
		String test_name = vo.getTest_name();
		String class_name = vo.getClass_name();
		int class_id = vo.getClass_id();
		
		try {
			test_name = URLEncoder.encode(test_name, "UTF-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}

		try {
			class_name = URLEncoder.encode(class_name, "UTF-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		
		return "redirect:test_detail.ho?test_id="+test_id+"&test_name="+test_name+"&class_name="+class_name+"&class_id="+class_id;
	}
	
	
	// 테스트 상세화면 수정 화면 요청하기 (=점수입력)
	@RequestMapping(value="test_detail_modify.ho" )
	public String test_detail_modify(Model model, int test_id, String student_id, HttpSession session, String dis) {
		teacher_id = common.getTeacherID(session);
		
		// 사이드 메뉴에 붙일 클래스 목록
		List<ClassListVO> list = null;
		list = service.class_list(teacher_id);
		model.addAttribute("list", list);	
		
		System.out.println(test_id);
		TestVO vo = service.test_id(test_id);
		String test_name = vo.getTest_name();
		System.out.println("test_name : "+ test_name);
		String class_name = vo.getClass_name();
		int class_id = vo.getClass_id();
		
		model.addAttribute("test_id", test_id);
		model.addAttribute("test_name", test_name);
		model.addAttribute("class_id", class_id);
		model.addAttribute("class_name", class_name);
		model.addAttribute("student_id", student_id);
		model.addAttribute("dis", dis);
		
		List<TestDetailVO> test_detail_list = null; 		
		
		test_detail_list = service.test_detail(test_id);
		model.addAttribute("test_detail_list", test_detail_list);	
		System.out.println(test_detail_list.size());
		
		// 테스트 목록 가져오기
		List<TestVO> test_list = null;
		test_list = service.test_list(class_id, teacher_id);
		
		model.addAttribute("test_list", test_list);
		
		
		
		return "hong/test_detail_modify";
	}
	
	// 테스트 상세화면 수정하기 (=점수입력)
	@RequestMapping(value="test_detail_update.ho" )
	public String test_detail_update(TestDetailVO dvo, Model model, int test_id, String student_id, int test_score , HttpSession session) {
		teacher_id = common.getTeacherID(session);
		

		System.out.println("test_id" + test_id);
		System.out.println("student_id" + student_id);
		System.out.println("test_score" + test_score);
		
		TestVO vo = service.test_id(test_id);
		String test_name = vo.getTest_name();
		
		String class_name = vo.getClass_name();
		int class_id = vo.getClass_id();
		
		model.addAttribute("test_id", test_id);
		model.addAttribute("test_name", test_name);
		model.addAttribute("class_id", class_id);
		model.addAttribute("class_name", class_name);
		
		
		
		dvo.setTest_id(test_id);
		dvo.setStudent_id(student_id);
		dvo.setTest_score(test_score);

		// 점수 입력하기 전에 존재하는지 찾기
		int check = service.test_count(dvo);
		System.out.println("check : "+ check);
		// 입력한 점수처리하기
		if(check>0) {
			service.test_detail_update(dvo);			
		}else {
			service.test_detail_insert(dvo);
		}
		
		
		
		List<TestDetailVO> test_detail_list = null; 		
		
		test_detail_list = service.test_detail(test_id);
		model.addAttribute("test_detail_list", test_detail_list);	
		System.out.println(test_detail_list.size());
		
		// 테스트 목록 가져오기
		List<TestVO> test_list = null;
		test_list = service.test_list(class_id, teacher_id);
		
		model.addAttribute("test_list", test_list);
		
		
		
		return "redirect:test_detail.ho";
	}
	
	
	
	
	// iot //////////////////////////////////////////////////////////////////////////////////////////
	
	// iot 화면 불러오기 ( 반목록 가져오기)
	@RequestMapping("iotReg")
	public String iotReg(HttpServletRequest request, Model model, String class_idp, String checkcard_num) {
		System.out.println("iotReg() 새로고침");
		
		teacher_id = common.getTeacherID(session);
		
		
		if(class_idp == null) {
			class_idp = "0";
		}
		int class_id = Integer.parseInt(class_idp);
		
		
		

		System.out.println(new_num);
		if(new_num != "") {
			checkcard_num = new_num;
		}
		

		// 사이드 메뉴에 붙일 클래스 목록
		List<ClassListVO> list = null;
		list = service.class_list(teacher_id);
		model.addAttribute("list", list);	
				
		model.addAttribute("checkcard_num", checkcard_num);
		model.addAttribute("teacher_id", teacher_id);
		model.addAttribute("class_id", class_id);
		
		// 반별 학생 목록 가져오기
		List<HongStudentListVO> stu_list = null;
		stu_list = service.student_list(class_id);
		
		if(class_id == 0) {
			stu_list = service.student_all_list(teacher_id);
		}
		model.addAttribute("stu_list", stu_list);
		
		// 오늘 출결 리스트 가져오기
		List<HongCheckinVO> check_list = null;
		
		check_list = service.check_list(teacher_id);
		model.addAttribute("check_list", check_list);
		
			
		return "hong/iotReg";
	}
		
	
	
	// 출결 카드 등록
	@RequestMapping("check_insert.ho")
	public String check_insert( HttpServletRequest request, Model model, String student_id, String checkcard_num, HongCheckinVO vo) {
		System.out.println(checkcard_num);
		// 이미 있는 출결 카드 번호 지우기
		service.check_delete(checkcard_num);
		
		// 출결 카드 번호 추가하기
		service.check_insert(vo);
		new_num="";
		return "redirect:iotReg";
	}
	
	
	// iot 출석카드 찍었을 시 작동
	@RequestMapping("iotRegcheck")
	public String iotRegcheck( HttpServletRequest request, Model model) {
				
		System.out.println("iotRegcheck() 들어옴");
		
		String checkcard_num = request.getParameter("checkcard_num");
		
		System.out.println(checkcard_num);
		
		model.addAttribute("checkcard_num", checkcard_num);
		
		// 출석카드 정보가 DB에 있는지 검색
		HongCheckinVO vo = service.doublecheck(checkcard_num);
		int check = vo.getCheckc();
		
		HongCheckinVO vo2 = null;
		if(check != 0 ) {
			// 먼저 카드번호에 오늘 출석 결과가 있는지 검색
			vo2 = service.check_count(checkcard_num);
			System.out.println("count: " +vo2.getCount());
			// 카드 찍었을 시 이미 출석 있는지 검색
			
			if(vo2.getCount() == 0) {
				service.checkin(checkcard_num);			
			}else if(vo2.getCount() > 0) {
				service.checkout(checkcard_num);
			}			
		}else if(check == 0) {
		}
		new_num = checkcard_num;			
		
		int state = 0;  // 인식 에러
		if(check == 0) {  // 등록되지 않은 카드
			state = 1;
		}else if(check != 0 && vo2.getCount() == 0) {  // 입실처리됨
			state = 2;
		}else if(check != 0 && vo2.getCount() > 0) {  // 퇴실처리됨
			state = 3;
		}
		
		System.out.println("state : " + state);
		
		model.addAttribute("state", String.valueOf(state));	
		
		
		return "hong/iotReturn";
	}
	
	// 체크인 삭제하기
	@RequestMapping("checkin_delete.ho")
	public String checkin_delete( int class_id, int checkin_num) {
		
		service.checkin_delete(checkin_num);		
		
		return "redirect:iotReg";
	}
	
	
	

	
	
}
