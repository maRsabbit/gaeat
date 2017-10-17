package com.project.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.project.service.ReadformService;
import com.project.service.UserpageService;
import com.project.vo.DatVo;
import com.project.vo.ReadformVo;
import com.project.vo.ScrapVo;
import com.project.vo.SocialUserVo;
import com.project.vo.UserpageVo;

@Controller
@RequestMapping("/read")
public class ReadformController {
	
	@Autowired
	private ReadformService readformService;
	
	@Autowired
	private UserpageService userpageService;
	
	//readform할시 실행
	@RequestMapping(value="/readform")
	public String getlist(@ModelAttribute ReadformVo readformVo,
			@ModelAttribute ReadformVo readformVo2,
			@ModelAttribute ReadformVo readformVo3,Model model,Model model2,
			HttpSession session) {
		
	
		//요리 순서글
		List<ReadformVo> list=readformService.getlist(readformVo);
		
					
		//레시피 제목,소개글,조리난이도,조리시간
		readformVo2=readformService.getread(readformVo2);
	
		
		//재료이름,재료양
		List<ReadformVo> list3=readformService.getmaterial(readformVo3);
		
		
		//왼쪽에 나오는 프로필
		SocialUserVo authUser=(SocialUserVo) session.getAttribute("authUser");
		
		if(authUser!=null) {
		
		int chef_no=authUser.getChef_no();
		//유저 정보
		
		UserpageVo chef = readformService.getUser(chef_no);
		
		model.addAttribute("chef", chef);
		}
		
		//카테고리 리스트
		List<UserpageVo> recipebookList = readformService.getRecipebookList(readformVo2.getChef_no());
		
		/*List<UserpageVo> followedList = userpageService.getFollowedList(chef_no);*/
		/*model.addAttribute("followedList", followedList);*/
		
		model.addAttribute("recipebookList", recipebookList);
		System.out.println(recipebookList.toString());
		
		model.addAttribute("list",list);		
		model2.addAttribute("readformVo2",readformVo2);
		model2.addAttribute("list3",list3);
				
		return "/user/readform";
	}
	
	
	//js로 가는 구문들
    @ResponseBody
	@RequestMapping(value="/list",method=RequestMethod.POST)
	public List<DatVo> list(DatVo datVo, @RequestParam("recipe_no") int recipe_no,HttpSession session) {
		
   
    	
    	SocialUserVo authUser=(SocialUserVo) session.getAttribute("authUser");
    	//로그인 되어 있을때
    	if(authUser!=null) 
    	{
    	int chef_no=authUser.getChef_no();
    	    	
    	datVo.setRecipe_no(recipe_no);
    	System.out.println("aa");
		List<DatVo> list=readformService.getdatlist(datVo);
		
		for(int i=0;i<list.size();i++) {
			if(chef_no!=(list.get(i).getChef_no())) {
				list.get(i).setChef_no(0);
													}
			else {list.get(i).setChef_no(1);}
										}
		System.out.println(list.toString());
		return list;
		//비로그인 일때
    	}else {
    		datVo.setRecipe_no(recipe_no);
        	
    		List<DatVo> list=readformService.getdatlist(datVo);
    		
    		return list;
    		
    	}
    	
    	
	}

	
	
	
	@ResponseBody//list로 보낼때 주소로 보내야 되는 데 주소가 없으므로 body로 보낸다
	@RequestMapping(value="/add",method=RequestMethod.POST)
	public DatVo add(@ModelAttribute DatVo datVo) {
		
		
		readformService.insertVo(datVo);
		
		
		return datVo;
	}
	//js로 가는 구문들
	
	//readform시 실행
	
	
	//delete시 시행
	
	
	@ResponseBody
	@RequestMapping(value = "/delete",method=RequestMethod.POST)
	public DatVo delte(DatVo datVo,@RequestParam("comment_no") int comment_no,Model model) {
		
		datVo.setComment_no(comment_no);
		System.out.println(datVo.toString());
		
		readformService.delete(datVo);
		
		
		return datVo;
	}
	
	@ResponseBody
	@RequestMapping(value = "/scrap", method = RequestMethod.POST)
	public int scrap(@RequestBody ScrapVo vo) {
		
		System.out.println(vo.toString());
		
		return readformService.addScrap(vo);
		
	}
	
	/*대표 사진을 다운로드 하는 방법
	 
	 package com.project.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.project.service.FileUploadService;

@Controller
@RequestMapping(value="/fileupload")
public class FileUploadController {
	
	@Autowired
	private FileUploadService fileUploadService;
	
	
	@RequestMapping(value="/form")
	public String form() {
		
		return "file/form";
	}
	
	@RequestMapping(value="/upload")
	public String upload(@RequestParam("recipe_no") int recipe_no
			             ,@RequestParam("file") MultipartFile file
			             ,Model model) {
		
		System.out.println("recipe_no:"+recipe_no);
		
		
		String saveName=fileUploadService.restore(file,recipe_no);
		
		model.addAttribute("saveName",saveName);
		
		
		return "file/result";
	}
	
	
	

}


//service
 package com.project.service;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

@Service
public class FileUploadService {

	public String restore(MultipartFile file,int recipe_no) {

		String saveDir = "D:\\A\\"+recipe_no+"\\";
		//폴더생성
		File crateD = new File(saveDir);
		if (!crateD.exists()) {
			crateD.mkdirs();
		}
		// 원래 파일 이름
		String orgName = file.getOriginalFilename();// 파일의 원래 이름
		System.out.println("orgName: " + orgName);

		// 확장자 이름
		String exName = file.getOriginalFilename().substring(file.getOriginalFilename().lastIndexOf("."));// 숫자에 따라 순번에
																											// 따라 잘라주는 수
		System.out.println("exName: " + exName);

		// 파일 사이즈

		long filesize = file.getSize();

		System.out.println("filesize: " + filesize);

		// 저장파일이름
		String saveName = recipe_no+orgName+filesize + exName;
		System.out.println("saveName: " + saveName);

		// 파일패스
		String filePath = saveDir + saveName;
		System.out.println(filePath);

		// 파일 카피(디렉토리에 복사)-여기에 파일 저장
		
		try {
			byte[] fileData = file.getBytes(); // 아직 메모리에 있음(fileoutputstream사용 필요)
			
			OutputStream out = new FileOutputStream(filePath);// filePath의 주소에 쓰라는 정보
			BufferedOutputStream bout = new BufferedOutputStream(out);
			
			bout.write(fileData);
			bout.flush();
			if(bout!=null) {
				bout.close();
			}
			
		} catch (IOException e) {
			
			e.printStackTrace();
		}
			

		return saveName;
	}
	
	

}
	
	  
	  */
	
	/* 조리순서에 나와있는 사진
	 * 
	 package com.project.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.project.service.FileUploadService;

@Controller
@RequestMapping(value="/fileupload")
public class FileUploadController {
	
	@Autowired
	private FileUploadService fileUploadService;
	
	
	@RequestMapping(value="/form")
	public String form() {
		
		return "file/form";
	}
	
	@RequestMapping(value="/upload")
	public String upload(@RequestParam("recipe_no") int recipe_no,
						 @RequestParam("email") String email,
						 @RequestParam("content_no") int content_no,
						 @RequestParam("order_no") int order_no 
			             ,@RequestParam("file") MultipartFile file
			             ,Model model) {
		
		System.out.println("recipe_no:"+recipe_no);
		
		
		String saveName=fileUploadService.restore(file,recipe_no,email,content_no,order_no);
		
		model.addAttribute("saveName",saveName);
		
		
		return "file/result";
	}
	
	
	

}

	 
	  
	  package com.project.service;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

@Service
public class FileUploadService {

	public String restore(MultipartFile file,int recipe_no,String email,int content_no,int order_no) {

		String saveDir = "D:\\A\\"+recipe_no+"\\";
		//폴더생성
		File crateD = new File(saveDir);
		if (!crateD.exists()) {
			crateD.mkdirs();
		}
		// 원래 파일 이름
		String orgName = file.getOriginalFilename();// 파일의 원래 이름
		System.out.println("orgName: " + orgName);

		// 확장자 이름
		String exName = file.getOriginalFilename().substring(file.getOriginalFilename().lastIndexOf("."));// 숫자에 따라 순번에
																											// 따라 잘라주는 수
		System.out.println("exName: " + exName);

		// 파일 사이즈

		

		// 저장파일이름
		String saveName = recipe_no+email+content_no+order_no + exName;
		System.out.println("saveName: " + saveName);

		// 파일패스
		String filePath = saveDir + saveName;
		System.out.println(filePath);

		// 파일 카피(디렉토리에 복사)-여기에 파일 저장
		
		try {
			byte[] fileData = file.getBytes(); // 아직 메모리에 있음(fileoutputstream사용 필요)
			
			OutputStream out = new FileOutputStream(filePath);// filePath의 주소에 쓰라는 정보
			BufferedOutputStream bout = new BufferedOutputStream(out);
			
			bout.write(fileData);
			bout.flush();
			if(bout!=null) {
				bout.close();
			}
			
		} catch (IOException e) {
			
			e.printStackTrace();
		}
			

		return saveName;
	}
	
	

}
	  
	  */


}
