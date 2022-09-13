package com.hanul.project;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.time.LocalDate;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import common.CommonService;
import ham.HamCheckVO;
import ham.HamHomeworkVO;
import ham.HamService;
import ham.HomeworkDetailVO;
import hong.ClassListVO;
import hong.HongService;

@Controller
public class HamController {
	
	@Autowired private HamService service;	
	@Autowired private HongService hongservice;	
	@Autowired private CommonService common;	

	private String teacher_id;
	
	
	// 반별 과제 목록 가져오기
	@RequestMapping("homework_list.ha")
	public String homework_list(Model model, int class_id, String class_name, String dis, HttpSession session) {
		teacher_id = common.getTeacherID(session);
		
					
		// 사이드 메뉴에 붙일 클래스 목록
		List<ClassListVO> list = null;
		
		list = hongservice.class_list(teacher_id);
		model.addAttribute("list", list);
		model.addAttribute("dis", dis);

		// 클래스 이름 뜨게 하기
		model.addAttribute("class_id", class_id);	// 클래스 이름 가져오게 수정할 것
		model.addAttribute("class_name", class_name);	// 클래스 이름 가져오게 수정할 것
		model.addAttribute("teacher_id", teacher_id);
		
		// 과제 목록
		List<HamHomeworkVO> homework_list = null;
		homework_list = service.homework_list(class_id, teacher_id);
		
		model.addAttribute("homework_list", homework_list);
		
		//선택한 반 이름 뜨게 하기
		
		return "ham/homework_list";	
	}
	
	// 과제 추가하기 (vo에 저장되어 있는 class_id 사용)
	@RequestMapping("homework_insert.ha")
	public String homework_insert(HamHomeworkVO vo, String class_name) {
		
		//vo 에 저장되어 있으므로 사용하기만 하면 됨 			
		// 테스트 추가하는 메소드 
		service.homework_insert(vo);

		try {
			class_name = URLEncoder.encode(class_name, "UTF-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		
		return "redirect:homework_list.ha?class_id="+vo.getClass_id()+"&dis=2&class_name="+class_name;	
	}
	
	
	//과제 삭제하기 (vo 를 사용하지 않기 떄문에 test_id 따로 넣어줘서 사용)
	@RequestMapping("homework_delete.ha")
	public String homework_delete(int homework_id, int class_id, String class_name) {
			
		service.homework_delete(homework_id);
		
		try {
			class_name = URLEncoder.encode(class_name, "UTF-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		return "redirect:homework_list.ha?class_id="+class_id+"&dis=2&class_name="+class_name;
	}
	
	//과제 수정할 수 있는 페이지 요청하기
	@RequestMapping("homework_modify.ha")
	public String homework_modify(Model model, int homework_id, int class_id, String class_name, String dis, HttpSession session) {
		teacher_id = common.getTeacherID(session);
		
		// 사이드 메뉴에 붙일 클래스 목록
		List<ClassListVO> list = null;
		list = hongservice.class_list(teacher_id);
		model.addAttribute("list", list);
		model.addAttribute("dis", dis);

		// 선택한 클래스의 이름이 뜨게 하기 위해서
		model.addAttribute("class_id", class_id);	// 클래스 이름 가져오게 수정할 것
		model.addAttribute("class_name", class_name);	// 클래스 이름 가져오게 수정할 것
		model.addAttribute("teacher_id", teacher_id);

		// 수정 선택한 테스트의 아이디를 가져옴
		model.addAttribute("homework_id", homework_id);	// 클래스 이름 가져오게 수정할 것

		// 과제 목록
		List<HamHomeworkVO> homework_list = null;
		homework_list = service.homework_list(class_id, teacher_id);
		
		model.addAttribute("homework_list", homework_list);
		return "ham/homework_modify";
		
	}
	

	// 과제 수정 요청 보내기
	@RequestMapping("homework_update.ha")
	public String homework_update(Model model, HamHomeworkVO vo, int class_id, int homework_id, String class_name, String homework_name, String homework_date, HttpSession session) {
		teacher_id = common.getTeacherID(session);
		
		
		// 사이드 메뉴에 붙일 클래스 목록
		List<ClassListVO> list = null;
		list = hongservice.class_list(teacher_id);
		model.addAttribute("list", list);	

		// 선택한 클래스의 이름이 뜨게 하기 위해서
		model.addAttribute("class_name", class_name);	// 클래스 이름 가져오게 수정할 것	
			
		service.homework_update(vo);
	
		return "redirect:homework_list.ha?class_id="+class_id+"&dis=2";
	}
	

	// 테스트 상세 화면 불러오기 ////////////////////////////////////////////////////////////////////////////////////
	@RequestMapping(value="homework_detail.ha",  produces="text/plain;charset=UTF-8")
	public String homework_detail(Model model, int homework_id, String homework_name, String class_name, int class_id, String dis, HttpSession session) {
		teacher_id = common.getTeacherID(session);
		
		System.out.println(homework_id);
		// 사이드 메뉴에 붙일 클래스 목록
		List<ClassListVO> list = null;
		list = hongservice.class_list(teacher_id);
		model.addAttribute("list", list);	
		model.addAttribute("homework_id", homework_id);	
		model.addAttribute("class_id", class_id);	
		model.addAttribute("dis", dis);


		
		model.addAttribute("homework_name", homework_name);	
		model.addAttribute("class_name", class_name);	
		model.addAttribute("teacher_id", teacher_id);	
		
		List<HomeworkDetailVO> homework_detail_list = null; 		
		
		homework_detail_list = service.homework_detail(homework_id);
		model.addAttribute("homework_detail_list", homework_detail_list);	
		System.out.println(homework_detail_list.size());
		
		// 테스트 목록 가져오기
		List<HamHomeworkVO> homework_list = null;
		homework_list = service.homework_list(class_id, teacher_id);
		
		model.addAttribute("homework_list", homework_list);
		
		
		
		return "ham/homework_detail";
	}
	// test_id 받아서 테스트명, 클래스명, 클래스 아이디 가져오기 , 한글 깨지는 현상 처리해줌
		@RequestMapping(value="homework_id.ha" ,  produces="text/plain;charset=UTF-8")
		public String test_id(Model model, int homework_id) {
			
			HamHomeworkVO vo = service.homework_id(homework_id);
			String homework_name = vo.getHomework_name();
			String class_name = vo.getClass_name();
			int class_id = vo.getClass_id();
			
			try {
				homework_name = URLEncoder.encode(homework_name, "UTF-8");
			} catch (UnsupportedEncodingException e) {
				e.printStackTrace();
			}

			try {
				class_name = URLEncoder.encode(class_name, "UTF-8");
			} catch (UnsupportedEncodingException e) {
				e.printStackTrace();
			}
			
			return "redirect:homework_detail.ha?homework_id="+homework_id+"&homework_name="+homework_name+"&class_name="+class_name+"&class_id="+class_id;
		}
		
		//테스트 상세화면 수정 화면 요청하기 (=점수입력)
		@RequestMapping(value="homework_detail_modify.ha")
		public String homework_detail_modify(Model model, int homework_id, String student_id, String dis) {
			
			System.out.println(homework_id);
			HamHomeworkVO vo = service.homework_id(homework_id);
			String homework_name = vo.getHomework_name();
			System.out.println("homework_name: " + homework_name);
			String class_name = vo.getClass_name();
			int class_id = vo.getClass_id();
			
			List<ClassListVO> list = null;
			list = hongservice.class_list(teacher_id);
			model.addAttribute("list", list);
			
			
			model.addAttribute("homework_id", homework_id);
			model.addAttribute("homework_name", homework_name);
			model.addAttribute("class_id", class_id);
			model.addAttribute("class_name", class_name);
			model.addAttribute("student_id", student_id);
			model.addAttribute("dis", dis);
			
			List<HomeworkDetailVO> homework_detail_list = null;
			
			homework_detail_list = service.homework_detail(homework_id);
			model.addAttribute("homework_detail_list", homework_detail_list);
			System.out.println(homework_detail_list.size());
	
			//과제목록 가져오기
			
			List<HamHomeworkVO> homework_list = null;
			homework_list = service.homework_list(class_id, teacher_id);
			
			model.addAttribute("homework_list", homework_list);
			
			
			
			
			return "ham/homework_detail_modify";
		}
		
		// 테스트 상세화면 수정하기 (=점수입력)
		@RequestMapping(value="homework_detail_update.ha" )
		public String homework_detail_update(HomeworkDetailVO dvo, Model model, int homework_id, String student_id, int homework_score, HttpSession session) {
			teacher_id = common.getTeacherID(session);
			
			
			System.out.println("homework_id" + homework_id);
			System.out.println("student_id" + student_id);
			System.out.println("homework_score" + homework_score);
			
			HamHomeworkVO vo = service.homework_id(homework_id);
			String homework_name = vo.getHomework_name();
			
			String class_name = vo.getClass_name();
			int class_id = vo.getClass_id();
			
			model.addAttribute("homework_id", homework_id);
			model.addAttribute("homework_name", homework_name);
			model.addAttribute("class_id", class_id);
			model.addAttribute("class_name", class_name);
			
			
			
			dvo.setHomework_id(homework_id);
			dvo.setStudent_id(student_id);
			dvo.setHomework_score(homework_score);

			// 점수 입력하기 전에 존재하는지 찾기
			int check = service.homework_count(dvo);
			System.out.println("check : "+ check);
			// 입력한 점수처리하기
			if(check>0) {
				service.homework_detail_update(dvo);			
			}else {
				service.homework_detail_insert(dvo);
			}
			
			
			
			List<HomeworkDetailVO> homework_detail_list = null; 		
			
			homework_detail_list = service.homework_detail(homework_id);
			model.addAttribute("homework_detail_list", homework_detail_list);	
			System.out.println(homework_detail_list.size());
			
			// 테스트 목록 가져오기
			List<HamHomeworkVO> homework_list = null;
			homework_list = service.homework_list(class_id, teacher_id);
			
			model.addAttribute("homework_list", homework_list);
			
			
			
			return "redirect:homework_detail.ha";
		}
		
		//학생출석 관리
				@RequestMapping("check_list.ha")
				public String check_list(HamCheckVO cvo, Model model, int class_id, String class_name, String dis, HttpSession session) {
					teacher_id = common.getTeacherID(session);
					LocalDate now = LocalDate.now();
					if(cvo.getCheckin_date()== null){
						cvo.setCheckin_date(""+now);
					}
					String checkin_date = cvo.getCheckin_date();
					System.out.println(cvo.getCheckin_date());
					// 사이드 메뉴에 붙일 클래스 목록
					List<ClassListVO> list = null;
					
					list = hongservice.class_list(teacher_id);
					model.addAttribute("list", list);
					model.addAttribute("dis", dis);

					// 클래스 이름 뜨게 하기
					model.addAttribute("class_id", class_id);	// 클래스 이름 가져오게 수정할 것
					model.addAttribute("teacher_id", teacher_id);
					model.addAttribute("checkin_date", checkin_date);
					
					// 클래스아이디로 클래스 이름 가져오기
					if(service.class_name(class_id) != null) {
						class_name=service.class_name(class_id);				
					}
					
					model.addAttribute("class_name", class_name);	// 클래스 이름 가져오게 수정할 것
					// 출석 목록
					List<HamCheckVO> check_list = null;
					check_list = service.check_list(cvo);
					
					model.addAttribute("check_list", check_list);
					
					//선택한 반 이름 뜨게 하기
					
					return "ham/check_list";	
				}
	
}
