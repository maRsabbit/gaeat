package com.project.repository;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.vo.RecipeVo;
import com.project.vo.TagVo;
import com.project.vo.keywordVo;

@Repository
public class SearchDao {
	@Autowired
	private SqlSession sqlSession;

	////////////////////////////////////////////////////////////////////////////////////
	/////////						 최종 레시피 반환용 였던 것들     					 ///////////
	////////////////////////////////////////////////////////////////////////////////////

	// 비로그인 사용자가 검색어 없이 했을 때
	public List<RecipeVo> getListNlNf(keywordVo kvo) {
		System.out.println("getListNlNf DAO 도착");
		return sqlSession.selectList("search2.getListNlNf", kvo);
	}

	// 로그인 사용자가 검색어 없이 했을 때
	public List<RecipeVo> getListLNf(keywordVo kvo) {
		System.out.println("getListLNf DAO 도착");
		return sqlSession.selectList("search2.getListLNf", kvo);
	}
	
	// 로그인유무에 상관없이 -필터만 적용된 경우들
	public List<RecipeVo> getListbykeyOnlyMf(keywordVo kvo) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("search2.getListbykeyOnlyMf", kvo);
	}
	
	
	public List<RecipeVo> getListF(keywordVo kvo) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("search2.getListF", kvo);
	}
	
	//순수 태그 검색
	public List<RecipeVo> getListTag(keywordVo kvo) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("search2.getListTag", kvo);
	}
	

	///////////////////////////////////////////////////////////////////////////////////
	///////// 특정 정보 반환용 ///////////
	///////////////////////////////////////////////////////////////////////////////////

	// 전체 레시피 정보를 긁어온다.
	public List<RecipeVo> getMaterial() {
		// TODO Auto-generated method stub
		return sqlSession.selectList("search2.selectMList");
	}

	// -재료들을의 번호를 리턴해준다. 만약 해당 번호들이 없을 경우 추가를 하고 처리
	public String getMaterialNo(List<String> word) {
		System.out.println("사전 점검0");
		for (int i = 0; i < word.size(); i++) { // DB에 없는 재료를 추가
			String material = word.get(i);
			sqlSession.insert("search2.insertNewMaterial", material);
		}
		System.out.println("사전 점검1");
		return sqlSession.selectOne("search2.getMaterialNo", word);
	}

	// +재료들을의 번호를 리턴해준다. +검색어는 특별히 재료가 아니기 때문에 null을 무시
	public String getPlusWordMaterialNo(List<String> word) {
		return sqlSession.selectOne("search2.getMaterialNo", word);
	}
	
	// 태그들의 번호를 리턴해준다.
	public String getTagNo(List<String> word) {
		System.out.println("태그 처리 시작");
		for (int i = 0; i < word.size(); i++) { // DB에 없는 재료를 추가
			String tag = word.get(i);
			sqlSession.insert("search2.insertNewTag", tag);
		}
		System.out.println("사전 준비 1단계 끝");
		return sqlSession.selectOne("search2.getTagNo", word);
	}

	// 특정 번호의 레시피들을 반환
	public List<RecipeVo> getMaterial(List<Integer> recipeList) {
		return sqlSession.selectList("search2.selectMList2", recipeList);
	}

	// 개인 사용자의 싫어하는 재료 정보를 리턴한다.
	public RecipeVo getdislikelist(int user_no) {
		return sqlSession.selectOne("search2.getdislikelist", user_no);
	}
	
	public String getdislikelist2(int user_no) {
		return sqlSession.selectOne("search2.getdislikelist2", user_no);
	}

	//특정 요리명의 레시피를 확인한다.
	public String confirmTitle(List<String> p_word) {
		return sqlSession.selectOne("search2.confirmTitle", p_word);
	}
	//특정 요리명의 레시피를 확인한다.
	public String confirmNickname(List<String> p_word) {
		return sqlSession.selectOne("search2.confirmNickname", p_word);
	}
	//특정 요리명의 레시피를 확인한다.
	public String confirmMaterial(List<String> p_word) {
		return sqlSession.selectOne("search2.confirmMaterial", p_word);
	}

	public List<Integer> getAllrecipeNo() {
		String arl = sqlSession.selectOne("search2.getAllrecipeNo");
		String[] aral = arl.split(",");
		List<Integer> f_list = new ArrayList<Integer>();
		for(int i=0; i<aral.length; i++) {
			f_list.add(Integer.parseInt(aral[i]));
		}
		return  f_list;
	}

	public String getdislikerecipeNo(List<Integer> list) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("search2.getdislikerecipeNo",list);
	}
	
	public String getListByTag(int tag_no) {
		return sqlSession.selectOne("search2.getListByTag", tag_no);
	}
	
	//검색 결과로 출력할 레시피 숫자 리턴
	public int getLength(keywordVo kvo) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("search2.getLength", kvo);
	}

	//최근 인기 태그 6개를 들고 온다. 
	public List<TagVo> getTopTag() {
		List<TagVo> t_list = sqlSession.selectList("search2.getTopTag");
		System.out.println(t_list.toString()); 
		return t_list;
	}

	///////////////////////////////////////////////////////////////////////////////////
	///////// 기타 ///////////
	///////////////////////////////////////////////////////////////////////////////////






	

	



}
