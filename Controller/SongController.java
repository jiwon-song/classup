package com.hanul.project;

import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import common.CommonService;
import hong.ClassListVO;
import hong.HongService;
import song.ClassVO;
import song.SongCheckinVO;
import song.SongHomeworkVO;
import song.SongService;
import song.SongTestVO;
import song.StudentListVO;

@Controller
public class SongController<SearchCriteria> {
	@Autowired private SongService service;
	@Autowired private HongService hongservice;
	@Autowired private CommonService common;
	
	private String teacher_id;
	
	//학생목록에서 학생정보 수정할 페이지 요청
	@RequestMapping("student_modify.so")
	public String student_modify(String dis, Model model, String student_id, int class_id, String class_name, String student_name, HttpSession session) {
		teacher_id = common.getTeacherID(session);
		
		
		// 사이드 메뉴에 붙일 클래스 목록
		List<ClassListVO> list = null;
		list = hongservice.class_list(teacher_id);
		model.addAttribute("list", list);
		
		// 선택한 클래스의 이름이 뜨게 하기 위해서
		model.addAttribute("class_id", class_id);
		model.addAttribute("class_name", class_name);
		
		// 수정 선택한 학생의 아이디를 가져옴
		model.addAttribute("student_id", student_id);	// 클래스 이름 가져오게 수정할 것
		
		//학생리스트
		List<StudentListVO> stu_list = null;
		stu_list = service.student_list(class_id);
		model.addAttribute("stu_list", stu_list);
		model.addAttribute("class_name", class_name);
		model.addAttribute("class_id", class_id);
		model.addAttribute("dis", dis);
		
		return "song/student_modify";
	}
	
	//학생정보 수정 요청 보내기
	@RequestMapping("student_update.so")
	public String student_update(Model model, StudentListVO vo, int class_id, String class_name, String student_pw, int grade, String parent_phone, String student_phone , HttpSession session) {
		teacher_id = common.getTeacherID(session);
		
		
		// 사이드 메뉴에 붙일 클래스 목록
		List<ClassListVO> list = null;
		list = hongservice.class_list(teacher_id);
		model.addAttribute("list", list);
		
		// 선택한 클래스의 이름이 뜨게 하기 위해서
		model.addAttribute("class_id", class_id);
		model.addAttribute("class_name", class_name);
		
		service.student_update(vo);
		
		return "redirect:student_list.so?class_id"+class_id;
	}
	
	//학생관리 페이지(student_list)에서 학생 삭제하기
	@RequestMapping("student_delete.so")
	public String student_delete(Model model, String student_id, int class_id, String class_name, HttpServletRequest request, HttpSession session) {
		teacher_id = common.getTeacherID(session);
		
		
		// 사이드 메뉴에 붙일 클래스 목록
		List<ClassListVO> list = null;
		list = hongservice.class_list(teacher_id);
		model.addAttribute("list", list);
		
		// 선택한 클래스의 이름이 뜨게 하기 위해서
		model.addAttribute("class_id", class_id);
		model.addAttribute("class_name", class_name);
		model.addAttribute("dis", 1);
		service.student_delete(student_id);
		
		model.addAttribute("url", "student_list.so");
		//model.addAttribute("page", page);
		
		return "redirect:student_list.so";
	}
	
	//학생이름 클릭시 학생 상세정보화면 요청
	@RequestMapping("student_detail.so")
	public String stu_detail(Model model,  String dis, String class_name, String student_id, int class_id , HttpSession session) {
		teacher_id = common.getTeacherID(session);
		
		
		// 사이드 메뉴에 붙일 클래스 목록
		List<ClassListVO> list = null;
		list = hongservice.class_list(teacher_id);
		model.addAttribute("list", list);
		model.addAttribute("dis", dis);
				
		//학생리스트
		StudentListVO stu_de = service.stu_detail(student_id);
		
		model.addAttribute("class_name", class_name);
		model.addAttribute("class_id", class_id);
		model.addAttribute("stu_de", stu_de);
		
		//출결상황
		List<SongCheckinVO> check_de = null;
		check_de = service.stu_check_detail(student_id);
		model.addAttribute("check_de", check_de);
		
		//과제리스트
		List<SongHomeworkVO> hw_de = null;
		hw_de = service.stu_hw_detail(student_id);
		model.addAttribute("hw_de", hw_de);
		
		//테스트리스트
		List<SongTestVO> test_de = null;
		test_de = service.stu_test_detail(student_id);
		model.addAttribute("test_de", test_de);
		
		return "song/student_detail";
	}
	
	@RequestMapping("student_list.so")
	public String stu_list(Model model, int class_id, String dis, String class_name, HttpSession session) {
		teacher_id = common.getTeacherID(session);
		
		// 사이드 메뉴에 붙일 클래스 목록

		// 사이드 메뉴에 붙일 클래스 목록
		List<ClassListVO> list = null;
		list = hongservice.class_list(teacher_id);
		model.addAttribute("list", list);
		model.addAttribute("dis", dis);
		
		//학생리스트
		List<StudentListVO> stu_list = null;
		stu_list = service.student_list(class_id);
		model.addAttribute("stu_list", stu_list);
		model.addAttribute("class_name", class_name);
		model.addAttribute("class_id", class_id);
		
		return "song/student_list";
	}
	
	//클래스 목록 화면 요청
	@RequestMapping("class_list.so")
	public String list(Locale locale, Model model, HttpSession session) {
		teacher_id = common.getTeacherID(session);
		
		//teacher id 추가해야함
		// 사이드 메뉴에 붙일 클래스 목록
		List<ClassVO> list = null;
		list = service.class_list(teacher_id);
		model.addAttribute("list", list);
		
		String red = "1";
		model.addAttribute("red", red);
		
		return "song/class_list";
	}

	//클래스 목록 수정화면 요청
	@RequestMapping("class_modify.so")
	public String class_modify(Model model, int class_id, String class_name, HttpSession session) {
		teacher_id = common.getTeacherID(session);
		
		
		// 사이드 메뉴에 붙일 클래스 목록
		List<ClassVO> list = null;
		list = service.class_list(teacher_id);
		model.addAttribute("list", list);
		
		//수정 선택한 클래스의 아이디를 가져옴
		model.addAttribute("class_id", class_id);
		
		
		return "song/class_modify";
	}
	
	//클래스 목록 수정 요청 보내기
	@RequestMapping("class_update.so")
	public String class_update(Model model, ClassVO vo, int class_id, String class_name, HttpSession session) {
		teacher_id = common.getTeacherID(session);
		
		
		// 사이드 메뉴에 붙일 클래스 목록
		List<ClassListVO> list = null;
		list = hongservice.class_list(teacher_id);
		model.addAttribute("list", list);
		// 선택한 클래스의 이름이 뜨게 하기 위해서
		model.addAttribute("class_id", class_id);
		model.addAttribute("class_name", class_name);
		
		service.class_update(vo);
		
		return "redirect:class_list.so?class_id"+class_id;
	}
	
	//클래스 삭제
	@RequestMapping("class_delete.so")
	public String class_delete(Model model, int class_id, String class_name, HttpSession session) {
		teacher_id = common.getTeacherID(session);
		
		
		// 사이드 메뉴에 붙일 클래스 목록
		List<ClassListVO> list = null;
		list = hongservice.class_list(teacher_id);
		model.addAttribute("list", list);
		
		service.class_delete(class_id);
		
		model.addAttribute("url", "class_list.so");
		
		return "redirect:class_list.so";
	}
	
	//클래스 추가하기
	@RequestMapping("class_insert.so")
	public String class_insert(ClassVO vo, HttpSession session) {
		teacher_id = common.getTeacherID(session);
		
		vo.setTeacher_id(teacher_id);
		service.class_insert(vo);
		return "redirect:class_list.so";
	}
	
	
	
		
}
