package com.hanul.project;

import java.text.DateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import hong.ClassListVO;
import hong.HongService;


@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@RequestMapping("/error")
	public String error(HttpSession session, Model model
						, HttpServletRequest request) {
		session.setAttribute("category", "error");
		
		Throwable error
		= (Throwable)request.getAttribute("javax.servlet.error.exception");
		StringBuffer msg = new StringBuffer();
		while( error!=null ) {
			msg.append("<p>").append(error.getMessage()).append("</p>");
			error = error.getCause();
		}
		//오류내용을 화면에 출력할 수 있도록 Model에 담는다
		model.addAttribute("error", msg.toString());
		
		//발생한 오류에 따라 화면을 연결
		int code 
		= (Integer)request.getAttribute("javax.servlet.error.status_code");
		
		return "error/default/" + (code==404 ? 404 : "default");
	}
	
	
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(HttpSession session, Model model) {
		session.removeAttribute("category");
		
		return "home";
	}
	
}










/**
 * Handles requests for the application home page.
 */
/*@Controller
public class HomeController {
	@Autowired private HongService service;	// 이 부분은 일우꺼로 수정할 것
	
	// 회원가입페이지 연결 
	@RequestMapping("new.t")
	public String teacher() {
		return "new";
	}
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);*/
	

	
//}
