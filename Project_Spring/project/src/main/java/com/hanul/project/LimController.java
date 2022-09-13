package com.hanul.project;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import common.CommonService;
import hong.ClassListVO;
import hong.HongService;
import lim.CalendarServiceImpl;
import lim.CalendarVO;


@Controller
public class LimController {
	@Autowired private CalendarServiceImpl service;
	@Autowired private HongService hongservice;	
	@Autowired private CommonService common;
	private String teacher_id;
	
	// 일정 저장
	@RequestMapping("calendar_insert")
	public boolean calendar_insert(@RequestBody HashMap<String, String> eventData, HttpSession session, Model model ) {
		teacher_id = common.getTeacherID(session);
		eventData.put("teacher_id", teacher_id);
		
		
		// 사이드 메뉴에 붙일 클래스 목록
		List<ClassListVO> list = null;
		
		list = hongservice.class_list(teacher_id);
		model.addAttribute("list", list);
			
		int insert = service.calendar_insert(eventData);
		
		return insert == 1 ? true : false;
	}
	
	// 일정 삭제
	@ResponseBody @RequestMapping("calendar_delete")
	public boolean calendar_delete(@RequestBody HashMap<String, String> eventData, HttpSession session, Model model) {
		teacher_id = common.getTeacherID(session);
		eventData.put("teacher_id", teacher_id);
		
		
		// 사이드 메뉴에 붙일 클래스 목록
		List<ClassListVO> list = null;
		
		list = hongservice.class_list(teacher_id);
		model.addAttribute("list", list);
		
		int delete = service.calendar_delete(eventData);
		
		
		return delete == 0 ? false : true;
	}
	
	// 캘린더페이지 호출
	@RequestMapping("cal.jh")
	public String cal(Model model, HttpSession session ) {
		teacher_id = common.getTeacherID(session);
		List<CalendarVO> cal_list = null;
		
		// 사이드 메뉴에 붙일 클래스 목록
		List<ClassListVO> list = null;
		
		list = hongservice.class_list(teacher_id);
		model.addAttribute("list", list);
		
		// 일정 리스트
		cal_list = service.calendarList(teacher_id);
		model.addAttribute("cal_list", cal_list);
		
		//System.out.println(list.size());
				
		return "calendar/cal";
	}
	
	
	
	

}
