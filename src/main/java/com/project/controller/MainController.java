package com.project.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import com.project.vo.SocialUserVo;

@Controller
@RequestMapping(value = "/main")
public class MainController {
	
	 @RequestMapping(value="/index", method = RequestMethod.GET)
	   public String index() {
		 
		 System.out.println("메인 들어옴");
	      return "/main/index";
	   
	 }
	   
	   @RequestMapping(value = "test", method = RequestMethod.GET)
	   public String test() {
	      
	      return "test";
	   
	 }
	   @RequestMapping(value="/logout")
		public String logout(HttpSession session) {
			
		   System.out.println("로그아웃 ");
			SocialUserVo authUser= (SocialUserVo)session.getAttribute("authUser");
			session.removeAttribute("authUser");
			
			return "redirect:/main/index";
		}

	   @RequestMapping(value="/logoutUser")
	 		public String logoutUser(HttpSession session) {
	 			
	 		   System.out.println("로그아웃 ");
	 		  SocialUserVo authUser= (SocialUserVo)session.getAttribute("authUser");
	 			session.removeAttribute("authUser");
	 			
	 			return "redirect:/main/index";
	 		}
}
