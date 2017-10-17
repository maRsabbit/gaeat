package com.project.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.project.service.UserService;
import com.project.vo.OrderAddVo;
import com.project.vo.RecipeInfo;
import com.project.vo.SocialUserVo;


@Controller
@RequestMapping(value = "user/")
public class UserController {
	
	@Autowired
	private UserService uService;
	
	/*@RequestMapping(value="plus", method=RequestMethod.GET)
	public String writeform() {
		return "user/plus";
	}*/
	/*@RequestMapping(value="catalog", method=RequestMethod.GET)
	public String catalog() {
		
		return "user/catalog";
	}*/
	

	@RequestMapping(value="registform", method=RequestMethod.GET)
	public String registform() {
		return "user/registform";
	}
	
	@RequestMapping(value = "enrollmentform", method = RequestMethod.GET)
	public String enrollform() {
		return "user/enrollmentform";
	}
	
	@RequestMapping(value = "enroll", method = RequestMethod.POST)
	@ResponseBody
	public String enroll(@RequestBody RecipeInfo rInfoVo) {
		
		System.out.println("들어옴");
		System.out.println(rInfoVo.toString());
		uService.Enroll(rInfoVo);
		
		return "user/userpage";
	}
	
	@RequestMapping(value = "addOrder", method = RequestMethod.POST)
	@ResponseBody
	public OrderAddVo addOrder(@RequestBody OrderAddVo orderDiv){
		System.out.println("addOrder들어옴");
		//vo로 받아온 div에서 이름을 빼온다 
		String formerDivName = orderDiv.getFormerDivName();
		//새로운 이름에 넣어줄 빈 int형 변수 설장
		int testNo = 0;
		//아까 받은 div이름에서 숫자를 분리시키고 1을 더해준다.
		 for( int i = 0; i < formerDivName.length(); i++ )
	        {
	                String text = formerDivName.substring(i,i+1);
	                if(Character.isDigit(formerDivName.charAt(i)) ) //isDigit를 이용 
	                {
	                	testNo = Integer.parseInt(text);
	                	testNo = testNo + 1;
	                	break;
	                }
	                
	         }
		
		System.out.println(testNo);
			
		   //div에 1을 더한 새로운 숫자를 문자열 형태로 합쳐 새 변수에 넣어준다.
			String newDivName = "div_"+testNo;
			System.out.println(newDivName);
			
			//vo형태로 담아서 보내준다.
			OrderAddVo orderVo = new OrderAddVo(newDivName);
			orderVo.setOrderNo(testNo);
			return orderVo;
			
	}
	
	
	/*가입 후 선택 영역*/
	@RequestMapping(value="select", method=RequestMethod.GET)
	public String select() {
		
		return "user/select";
	}

	@RequestMapping(value="/userprofile",method=RequestMethod.GET)
	public String userprofile(@ModelAttribute SocialUserVo vo,HttpSession session) {
		SocialUserVo authUser = (SocialUserVo)session.getAttribute("authUser");
		session.setAttribute("authUser", authUser);
		return"user/userprofile";
	}

	@RequestMapping(value="/modifyUser",method=RequestMethod.POST)
	public String modify(@ModelAttribute SocialUserVo vo,HttpSession session,@RequestParam("file") MultipartFile file) {
		System.out.println("modify 들어옴 "+ vo.toString());
	if (file.getSize()!=0) { //파일변경을 원하면 file 과 vo 까지 받아서 넘겨주고 아니면 vo 마ㅓㄴ넘겨줌 
		System.out.println("파일사이즈가 0이 아닐때 " );
		SocialUserVo authUser = uService.updateUser(vo,file);
		String hatefood= uService.getdislike(authUser.getChef_no());
		if (hatefood!=null) {
			//프로필에 들어갈때, authUser에 있는 chef no 로 dislike 가 있나없나 파악한다. 
			authUser.setHatefood(hatefood);
		}
		session.setAttribute("authUser", authUser);
		System.out.println("수정후 세션 안의 값 1:"+authUser);
		
	}else {
		SocialUserVo authUser = uService.updateUser1(vo);
		String hatefood= uService.getdislike(authUser.getChef_no());
		if (hatefood!=null) {
			//프로필에 들어갈때, authUser에 있는 chef no 로 dislike 가 있나없나 파악한다. 
			authUser.setHatefood(hatefood);
		}
		session.setAttribute("authUser", authUser);
		System.out.println("수정후 세션 안의 값 :2"+authUser);
	}
		
		return"redirect:userprofile";
	}
	/*사이드 토글 dislike의  ajax 통신을 위한 컨트롤러 */
	@ResponseBody
	@RequestMapping(value = "seldislist", method = RequestMethod.POST)
	public SocialUserVo seldislist(@RequestParam String chef_no,HttpSession session ) {
		SocialUserVo authUser = (SocialUserVo)session.getAttribute("authUser");
		String hatefood= uService.getdislike(authUser.getChef_no());
		authUser.setHatefood(hatefood);
		
		session.setAttribute("authUser", authUser);
		System.out.println("hatefood를 찾아온후 ajax에 보낼값  :"+authUser);
		return authUser;
	}
	
	
	
	@ResponseBody
	@RequestMapping(value = "dellist", method = RequestMethod.POST)
	public SocialUserVo dellist(@RequestParam String hatefood,HttpSession session ) {
		SocialUserVo authUser = (SocialUserVo)session.getAttribute("authUser");
		authUser.setHatefood(hatefood);
		
		authUser = uService.hatefooddelete(authUser);
		
		String selecthatefood= uService.getdislike(authUser.getChef_no());//지우고 다시셀렉트해서 저장해줌 
		if (selecthatefood!=null) {
			authUser.setHatefood(selecthatefood);
		}
		session.setAttribute("authUser", authUser);
		System.out.println("수정후 세션 안의 값 :"+authUser);
		return authUser;
	}
	
	/*자체 회원가입  */
	@RequestMapping(value="/join",method=RequestMethod.POST)
	public String join(@ModelAttribute  SocialUserVo joinVo,HttpSession session, @RequestParam("file") MultipartFile file) {
		System.out.println("join :"+ joinVo.toString());
		System.out.println(file.toString());
		SocialUserVo authUser=uService.joinUser(joinVo,file);
		session.setAttribute("authUser",authUser);//세션에 넣어줌 
		System.out.println("세션 안의 값1"+authUser);
		

		return"user/userprofile";
	}

	/*유저프로필 자동완성   */

	@ResponseBody
		@RequestMapping(value = "autoIngre", method = RequestMethod.POST)
		public List<String> autoIngre() {
			List<String> ingreList = uService.ingreients();
			System.out.println("autoIngre : "+ingreList);
			return ingreList;
			
		}
	/*로그인 */
	@RequestMapping(value = "login", method = RequestMethod.POST)
	public String login(@ModelAttribute SocialUserVo joinvo, HttpSession session) {
		System.out.println("login 함 "+joinvo.toString());
		
		SocialUserVo authUser=uService.loginUser(joinvo);
		if (authUser!= null) {
			
			session.setAttribute("authUser",authUser);//세션에 넣어줌 
			
			String hatefood= uService.getdislike(authUser.getChef_no());
			if (hatefood==null) {
				System.out.println("hatefood == null");
				return "main/index";
			}else {
				//프로필에 들어갈때, authUser에 있는 chef no 로 dislike 가 있나없나 파악한다. 
				authUser.setHatefood(hatefood);
				System.out.println(authUser.toString());
				//되지 껍데기 ,소고기안심 ,오골계 ,호박 이 나옴 . 
				session.setAttribute("authUser", authUser);
				
			}
			
			
			System.out.println("세션 안의 값"+authUser);
		}
		return"main/index";
		
	}
	
	@ResponseBody
	@RequestMapping(value="facebook/add", method=RequestMethod.POST)
	public SocialUserVo facebook(@RequestBody SocialUserVo vo,HttpSession session) {
		System.out.println("facebook/add ");
		
		SocialUserVo authUser =uService.SocialLogin(vo);
		session.setAttribute("authUser",authUser);//세션에 넣어줌 
		System.out.println("facebook/add " +authUser);
		String hatefood= uService.getdislike(authUser.getChef_no());
		if (hatefood==null) {
			
			return authUser;
		}else {
			//프로필에 들어갈때, authUser에 있는 chef no 로 dislike 가 있나없나 파악한다. 
			authUser.setHatefood(hatefood);
			session.setAttribute("authUser", authUser);
			System.out.println("hatefood 가 있는경우  세션의 값 " +authUser.toString());

			return authUser;
		}
		

	}
	
	
	
	@ResponseBody
	@RequestMapping(value="kakao/add",method=RequestMethod.POST)
	public SocialUserVo kakao(@RequestBody SocialUserVo vo,HttpSession session) {
		SocialUserVo authUser =uService.SocialLogin(vo);
		session.setAttribute("authUser",authUser);//세션에 넣어줌 
		
		
		String hatefood= uService.getdislike(authUser.getChef_no());
		if (hatefood==null) {
			System.out.println("hatefood 가 없는경우  세션의 값 " +authUser.toString());
			return authUser;
		}else {
			//프로필에 들어갈때, authUser에 있는 chef no 로 dislike 가 있나없나 파악한다. 
			authUser.setHatefood(hatefood);
			session.setAttribute("authUser", authUser);
			System.out.println("hatefood 가 있는경우  세션의 값 " +authUser.toString());

			return authUser;
		}
		
		
	}

}