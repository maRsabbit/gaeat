package com.project.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.project.service.EnrollService;
import com.project.vo.RecipeBookListVo;
import com.project.vo.RecipeContent;
import com.project.vo.RecipeInfo;
import com.project.vo.RecipeIngredients;
import com.project.vo.RecipeTag;



@Controller
@RequestMapping(value = "/enrollform/")
public class EnrollController {

	@Autowired
	private EnrollService enrollService;
	
	public int globalRecipeNo;
	public int globalOrderNo;
	
	@RequestMapping(value = "enrollmentform", method = RequestMethod.GET)
	public String enrollform(@RequestParam int chef_no, Model model) {
		
		List<RecipeBookListVo> rbList = enrollService.getRbookList(chef_no);
		
		System.out.println(rbList.toString());
		
		System.out.println("enrollmentform 들어옴 ");
		
		model.addAttribute("rbList", rbList);
		model.addAttribute("chef_no", chef_no);

		return "user/enrollmentform";
	}

	@ResponseBody
	@RequestMapping(value = "enrollInfo", method = RequestMethod.POST)
	public int enrollRecipeInfo(@RequestBody RecipeInfo rInfoVo) {
		
		System.out.println("들어옴");
		
		System.out.println("rInfoVo:" + rInfoVo.toString());
		
		enrollService.EnrollRecipeInfo(rInfoVo);
		
		globalRecipeNo = rInfoVo.getRecipe_no();

		return globalRecipeNo;
	}
	
	@ResponseBody
	@RequestMapping(value = "enrollOrder")
	public int enrollOrder(@RequestBody RecipeContent recipeContentVo){
		
		System.out.println("enrollOrder들어옴");
		System.out.println("RecipeContent:" + recipeContentVo.toString());
		
		System.out.println("사진 순서: " + globalOrderNo);
		
		enrollService.EnrollRecipeContent(recipeContentVo);
		
		System.out.println("데이터 넣고 레시피 num반환");
		
		return recipeContentVo.getRecipeNo();
	}
	
	@ResponseBody
	@RequestMapping(value = "enrollIngre")
	public int enrollIngre(@RequestBody RecipeIngredients ingreVo) {
		
		enrollService.EnrollIngre(ingreVo);
		
		System.out.println("저장 후 컨트롤러로 복귀");
		
		int recipeNo = ingreVo.getRecipeNo();
		
		return recipeNo;
	}
	
	@ResponseBody
	@RequestMapping(value = "enrollPhoto", method = RequestMethod.POST, produces = "text/plain;charset=UTF-8")
	public void enrollPhoto(@RequestParam("file") MultipartFile file,
							@RequestParam("recipeNo") int recipeNo) {
		
		System.out.println("mainPhoto들어옴");
		System.out.println(file.getSize());
	
		System.out.println(recipeNo);
		
		enrollService.MainPhotoSave(recipeNo, file);
		
	}
	
	@ResponseBody
	@RequestMapping(value = "enrollOrderPhoto", method = RequestMethod.POST, produces = "text/plain;charset=UTF-8")
	public void enrollOrderPhoto(@RequestParam("photo") MultipartFile photo,
								 @RequestParam("orderNo") int orderNo,
								 @RequestParam("recipeNo") int recipeNo) {
		
		System.out.println("orderPhoto들어옴");
		System.out.println(photo.getSize());
		
		System.out.println(recipeNo);
		System.out.println(orderNo + "들어왔다!!!!!");
		
		enrollService.OrderPhotoSave(orderNo,recipeNo,photo); 
		
		
	}
	
	@ResponseBody
	@RequestMapping(value = "saveTag", method = RequestMethod.POST)
	public void enrollTag(@RequestBody RecipeTag tagVo) {
		
		System.out.println(tagVo.toString());
		enrollService.EnrollTag(tagVo);
		
	}
	
	@ResponseBody
	@RequestMapping(value = "autoIngre", method = RequestMethod.POST)
	public List<String> autoIngre() {
		
		List<String> ingreList = enrollService.ingreients();
		
		System.out.println(ingreList);
		
		return ingreList;
		
	}
	
	
}
