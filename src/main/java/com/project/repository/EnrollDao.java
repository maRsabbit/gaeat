package com.project.repository;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.vo.RecipeBookListVo;
import com.project.vo.RecipeContent;
import com.project.vo.RecipeInfo;
import com.project.vo.RecipeIngredients;
import com.project.vo.RecipeMainPhoto;
import com.project.vo.RecipePhotoVo;
import com.project.vo.RecipeTag;

@Repository
public class EnrollDao {
	
	@Autowired
	private SqlSession sqlSession;
	

	public void EnrollRecipeInfoDao(RecipeInfo rInfoVo) {
		
		System.out.println("dao:" + rInfoVo.toString());
		
		String recipebookName = rInfoVo.getRecipebookName();
		
		System.out.println(recipebookName);
		
		int recipebook_no = sqlSession.selectOne("enroll.SelectRecipeBookNo", recipebookName);
		
		System.out.println("recipebook_no = " + recipebook_no);
		
		rInfoVo.setRecipebook_no(recipebook_no);
		
		sqlSession.insert("enroll.EnrollRecipeInfo", rInfoVo);
		
		System.out.println("insert된 레시피의 no값:" + rInfoVo.getRecipe_no());
		
	}
	
	public void EnrollContent(RecipeContent contentVo) {
	
		System.out.println("dao content 넣기");
		
		sqlSession.insert("enroll.EnrollContent",contentVo);
		
	}
	
	public void EnrollIngre(RecipeIngredients ingreVo) {
		
		System.out.println("dao");
		
		System.out.println(ingreVo.toString());
		
		int no = sqlSession.selectOne("enroll.getMaterialNo", ingreVo);
		
		System.out.println("들어갈 인그리 번호" + no);
		
		ingreVo.setMaterialNo(no);
		
		sqlSession.insert("enroll.EnrollIngre", ingreVo);
		
		System.out.println("insertingre완료");
		
	}
	
	public List<RecipeBookListVo> getRbookList(int chef_no){
		
		System.out.println("다오"); 
		
		List<RecipeBookListVo> list = sqlSession.selectList("enroll.getRecipebookList" ,chef_no);
		
		System.out.println(list.toString());
		System.out.println("레시피북 뽑아옴");
		return list;
		
	}
	
	public void saveMainPhoto(String saveMainphotoName, int recipeNo){
		
		System.out.println("photo Dao 도착");
		
		RecipeMainPhoto vo = new RecipeMainPhoto();
		
		vo.setRecipeNo(recipeNo);
		vo.setSaveMainphotoName(saveMainphotoName);
		
		System.out.println("////////////////////////////////////////////////////////////////////");
		System.out.println(vo);
		sqlSession.update("enroll.updateMainPhoto", vo);
	} 
	
	public void saveOrderPhoto(RecipePhotoVo vo) {
		
		System.out.println("orderPhotoDao");
		sqlSession.update("updateOrderPhoto", vo);
		
	}
	
	public void EnrollTag(RecipeTag vo) {
		
		String date = sqlSession.selectOne("selectDate", vo.getRecipeNo());
		vo.setSysdate(date);
		
		sqlSession.selectOne("tagInsert", vo.getTag());
		int tagNo =	sqlSession.selectOne("selectTagNo",vo);
		vo.setTagNo(tagNo);
		
		sqlSession.insert("tagHisInsert", vo);
		
	}
	
	public List<String> ingredients() {
		
		List<String> ingreList = new ArrayList<String>();
		
		ingreList = sqlSession.selectList("ingredients");
		
		return ingreList;
	}

}
