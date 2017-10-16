package com.project.service;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.project.repository.EnrollDao;
import com.project.vo.RecipeBookListVo;
import com.project.vo.RecipeContent;
import com.project.vo.RecipeInfo;
import com.project.vo.RecipeIngredients;
import com.project.vo.RecipePhotoVo;
import com.project.vo.RecipeTag;

@Service
public class EnrollService {
	
	@Autowired
	private EnrollDao enrollDao;
	
	public void EnrollRecipeInfo(RecipeInfo rInfoVo) {
			
			System.out.println("service:" + rInfoVo.toString());
			
			enrollDao.EnrollRecipeInfoDao(rInfoVo);
		}
	
	public void EnrollRecipeContent(RecipeContent recipeContentVo) {
		
		System.out.println("service:" + recipeContentVo.toString());
		
		enrollDao.EnrollContent(recipeContentVo);
		
	}
	
	public void EnrollIngre(RecipeIngredients ingreVo) {
		
		System.out.println("enrollIngre들어옴 ");
		
		enrollDao.EnrollIngre(ingreVo);
	}
	
	public List<RecipeBookListVo> getRbookList(int chef_no){
		
		return enrollDao.getRbookList(chef_no);
		
	}
	
	public void MainPhotoSave(int recipeNo, MultipartFile file){
		
		System.out.println("mainphoto Service");
		
		String saveDir = "D:\\javaStudy\\file\\MainPhoto\\" + recipeNo + "\\";
		File createD = new File(saveDir);
		
		if (!createD.exists()) {
			createD.mkdirs();
	     }
		
		String exName = file.getOriginalFilename().substring(file.getOriginalFilename().lastIndexOf("."));
		String saveName =  "mainPhoto_" + recipeNo + exName;
		String filePath = saveDir + saveName;
		String saveMainphotoName = "http://localhost:8088/gaeat01/upload/MainPhoto/"+recipeNo+"/"+saveName;
	
		System.out.println(saveName);
		System.out.println(filePath);
		System.out.println(saveMainphotoName);
		
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
		 
		 enrollDao.saveMainPhoto(saveMainphotoName, recipeNo);
	
	}
	
	public void OrderPhotoSave(int orderNo, int recipeNo, MultipartFile photo) {
		
	System.out.println("orderphoto Service");
		
		String saveDir = "D:\\javaStudy\\file\\orderPhoto\\" + recipeNo + "\\" + orderNo + "\\";
		File createD = new File(saveDir);
		
		if (!createD.exists()) {
			createD.mkdirs();
	     }
		
		String exName = photo.getOriginalFilename().substring(photo.getOriginalFilename().lastIndexOf("."));
		String saveName =  "orderPhoto_" + recipeNo + "_" + orderNo + exName;
		String filePath = saveDir + saveName;
		String saveOrderphotoName = "http://localhost:8088/gaeat01/upload/orderPhoto/"+recipeNo+"/"+orderNo+"/"+saveName;
	
		System.out.println(saveName);
		System.out.println(filePath);
		System.out.println(saveOrderphotoName);
		
		 try {
		        byte[] fileData = photo.getBytes(); // 아직 메모리에 있음(fileoutputstream사용 필요)
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
		 
		 RecipePhotoVo vo = new RecipePhotoVo();
		 
		 vo.setOrderNo(orderNo);
		 vo.setPath(saveOrderphotoName);
		 vo.setRecipeNo(recipeNo);
		 
		 enrollDao.saveOrderPhoto(vo);
		
	}
	
	public void EnrollTag(RecipeTag vo) {
		enrollDao.EnrollTag(vo);
	}

	public List<String> ingreients(){
		
		List<String> ingreList = new ArrayList<String>();
		
		ingreList = enrollDao.ingredients();
		
		return ingreList;
		
	}
}
