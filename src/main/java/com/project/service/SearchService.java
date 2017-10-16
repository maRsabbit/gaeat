package com.project.service;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashSet;
import java.util.List;
import java.util.Set;
import java.util.regex.Pattern;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.repository.SearchDao;
import com.project.vo.RecipeVo;
import com.project.vo.TagVo;
import com.project.vo.keywordVo;

@Service
public class SearchService {
	@Autowired
	private SearchDao searchdao;

	///////////////////////////////////////////////////////////////////////////////////
	///////// 최종적으로 컨트롤러로 리턴될 list들(검색어無) ///////////
	///////////////////////////////////////////////////////////////////////////////////

	// 검색어가 없다는 가정에서
	// 비로그인 사용자가 검색어를 입력하지 않았을 경우
	public List<RecipeVo> getListNlNf(keywordVo kvo) {
		//int totRow = searchdao.getLength(kvo);
		return searchdao.getListNlNf(kvo);
	}

	// 로그인 사용자가 검색어를 입력하지 않았을 경우
	public List<RecipeVo> getListLNf(keywordVo kvo) {
		// dislike로 필터가 된 리스트
		List<Integer> f_list = miunsFiltering(kvo.getUser_no());
		System.out.println("-필터 완료" + f_list);
		kvo.setF_list(f_list);
		int totRow = searchdao.getLength(kvo);
		List<RecipeVo> list = searchdao.getListLNf(kvo);
		return list;
	}


	///////////////////////////////////////////////////////////////////////////////////
	///////// 최종적으로 컨트롤러로 리턴될 list들(검색어有) 새로 만든 것들 ///////////
	///////////////////////////////////////////////////////////////////////////////////

	public List<RecipeVo> getListOnlyMf(keywordVo kvo) {
		System.out.println("getListOnlyMf 도착");
		// 사전에 -검색어에서 재료번호를 찾아온다.
		// 만약 로그인 사용자면 사용자가 등록한 것들에서 들고온다. 그리고 검색어로 구한 레시피 번호들과 합친다.
		List<Integer> f_list;
		if (kvo.getCheck_login() == 1) {// 로그인 사용자 일시
			f_list = miunsFiltering(kvo.getUser_no(), kvo.getM_word());
		} else {
			f_list = miunsFiltering(kvo.getM_word());
		}
		kvo.setF_list(f_list);
		int flcheck = flcheck(kvo);
		kvo.setF_list_check(flcheck);
		int pwcheck = pwcheck(kvo);
		kvo.setP_word_check(pwcheck);
		int length = searchdao.getLength(kvo);
		return searchdao.getListbykeyOnlyMf(kvo);
	}

	public List<RecipeVo> getListF(keywordVo kvo, List<Integer> recipeList) {
		// 이미 로그인 유무랑 +필터로 일정 단계 진행된 레시피는 가지고 있음.
		// -검색어와 로그인 유무를 체크
		System.out.println("getListF 도착");
		kvo.setP_list(recipeList);
		List<Integer> list = miunsFiltering(kvo);
		kvo.setF_list(list);
		System.out.println("getListF에서 miunsFiltering(kvo)가 끝");
		System.out.println("kvo.getF_list() : "+kvo.getF_list());  
		int flcheck = flcheck(kvo);
		kvo.setF_list_check(flcheck);
		int pwcheck = pwcheck(kvo);
		kvo.setP_word_check(pwcheck);
		List<RecipeVo> list1 = searchdao.getListF(kvo);
		return list1;
	}
	
	//태그로만 검색한다.
	public List<RecipeVo> getListTag(keywordVo kvo) {
		//태그 검색을 시작한다.
		//로그인 정보를 가져온다.
		String tl = searchdao.getListByTag(kvo.getTag_no());
		Pattern pattern = Pattern.compile(",");
		List<Integer> tlist = pattern.splitAsStream(tl).map(Integer::valueOf).collect(Collectors.toList());
		kvo.setP_list(tlist);
		kvo.setF_list(miunsFilteringT(kvo));
		kvo.setF_list_check(flcheck(kvo));
		return searchdao.getListTag(kvo);
	}

	///////////////////////////////////////////////////////////////////////////////////
	//////////////////////////// DB에서 특정 정보를 긁어오기 위한 용도/////////////////////////////////////////////////////////////////////////////////// /////////////////////////////
	///////////////////////////////////////////////////////////////////////////////////

	// 모든 레시피의 재료를 반환한다.
	public List<RecipeVo> getMaterial() {
		return searchdao.getMaterial();
	}


	// 특정 요리명의 레시피 번호를 들고 온다.
	public String confirmTitle(List<String> p_word) {
		return searchdao.confirmTitle(p_word);
	}

	// 특정 작성자가 만든 레시피 번호를 들고 온다.
	public String confirmNickname(List<String> p_word) {
		return searchdao.confirmNickname(p_word);
	}

	// 특정 재료를 가지는 레시피 번호를 들고 온다.
	public String confirmMaterial(List<String> p_word) {
		return searchdao.confirmMaterial(p_word);
	}

	///////////////////////////////////////////////////////////////////////////////////
	///////// 필터용 함수 ///////////
	///////////////////////////////////////////////////////////////////////////////////

	// -키워드 걸러내기 위한 필터 함수 dislike를 추출하기 위해서는 사용자 번호기 필여하고 -키워드를 입력 받을 필요가 있다.
	public List<Integer> miunsFiltering(int userNo, List<String> minusWord) {
		List<RecipeVo> mlist = searchdao.getMaterial(); // 레시피와 레시피의 재료를 가짐
		// -재료 솎아 내기
		RecipeVo dislike = searchdao.getdislikelist(userNo); // 사용자의 번호에 맞춰서 싫어하는 재료 정보를 다 들고 온다. -> 세션에서 받아오도록 변경 필요
		System.out.println("dislike : " + dislike.toString());
		Set<String> imsisibal;
		String[] dm;
		if (dislike.getMaterial().length() != 0) {// 사용자가 dislike 항목에 식재료를 등록한 경우
			dm = dislike.getMaterial().split(","); // 사용자가 등록한 비선호 식품 리스트
			imsisibal = new HashSet<String>(Arrays.asList(dm));
			System.out.println(dm.toString());
		} else {// 사용자가 dislike 항목에 식재료를 등록하지 않은 경우
			imsisibal = new HashSet<String>(); // dislke를 만들 수 없으므로 -키워드 체크만 실행
		}

		String minusWordNo = searchdao.getMaterialNo(minusWord);// -키워드 재료들 번호 반환
		System.out.println("검색어로 입력된 재료 번호들 : " + minusWordNo);
		String[] m_wno = minusWordNo.split(",");

		for (int i = 0; i < m_wno.length; i++) {
			imsisibal.add(m_wno[i]);
		}

		dm = imsisibal.toArray(new String[imsisibal.size()]);
		Arrays.sort(dm);
		System.out.println(Arrays.toString(dm));

		HashSet<Integer> f_list = new HashSet<Integer>(); // 중복값을 안 받기 위해서 사용함
		// 레시피들을 반복한다.
		for (int i = 0; i < mlist.size(); i++) {
			Loop2: for (int j = 0; j < dm.length; j++) {
				String[] material = mlist.get(i).getMaterial().split(","); // i번째 레시피의 재료를 추출해서 쪼갠다.
				for (int k = 0; k < material.length; k++) {
					if (material[k].equals(dm[j])) {
						f_list.add(mlist.get(i).getRecipe_no());
						break Loop2;
					}
				}
			}
		}
		System.out.println("비선호 목록 최종본 아마도 : " + f_list); // 걸러야 하는 레시피가 다 들어감
		// List<String> recipeList = new ArrayList<String>();
		List<Integer> recipeList = new ArrayList<Integer>();
		for (int i = 0; i < mlist.size(); i++) {
			int a = (int) mlist.get(i).getRecipe_no();
			recipeList.add(a);
		}

		Integer[] MinusList = f_list.toArray(new Integer[f_list.size()]);

		// 최종적으로 남은 리턴시킬 레시피 번호들
		for (int i = 0; i < mlist.size(); i++) {
			for (int j = 0; j < MinusList.length; j++) {
				if (mlist.get(i).getRecipe_no() == (int) MinusList[j]) {
					// System.out.println("mlist.get(i).getRecipe_no() :
					// "+mlist.get(i).getRecipe_no()+" (int)MinusList[j] :"+(int)MinusList[j]);
					int findnum = recipeList.indexOf(mlist.get(i).getRecipe_no());// 제거할 값의 인덱스를 추출
					recipeList.remove(findnum); // 사용자의 개인정보에서 필요한 리스트 번호들만 추출함
					System.out.println(recipeList);
				}
			}
		}

		return recipeList;
	}

	// -키워드 걸러내기 위한 필터 함수 dislike를 추출하기 위해서는 사용자 번호기 필여하고 -키워드를 입력 받을 필요가 있다.
	public List<Integer> miunsFiltering(List<String> minusWord) {
		List<RecipeVo> mlist = searchdao.getMaterial(); // 레시피와 레시피의 재료를 가짐

		Set<String> imsisibal = new HashSet<String>();
		String minusWordNo = searchdao.getMaterialNo(minusWord);
		System.out.println("검색어로 입력된 재료 번호들 : " + minusWordNo);
		String[] m_wno = minusWordNo.split(",");

		for (int i = 0; i < m_wno.length; i++) {
			imsisibal.add(m_wno[i]);
		}

		String[] dm = imsisibal.toArray(new String[imsisibal.size()]);
		Arrays.sort(dm);
		System.out.println(Arrays.toString(dm));

		HashSet<Integer> f_list = new HashSet<Integer>(); // 중복값을 안 받기 위해서 사용함
		// 레시피들을 반복한다.
		for (int i = 0; i < mlist.size(); i++) {
			Loop2: for (int j = 0; j < dm.length; j++) {
				String[] material = mlist.get(i).getMaterial().split(","); // i번째 레시피의 재료를 추출해서 쪼갠다.
				for (int k = 0; k < material.length; k++) {
					if (material[k].equals(dm[j])) {
						f_list.add(mlist.get(i).getRecipe_no());
						break Loop2;
					}
				}
			}
		}
		System.out.println("비선호 목록 최종본 아마도 : " + f_list); // 걸러야 하는 레시피가 다 들어감
		// List<String> recipeList = new ArrayList<String>();
		List<Integer> recipeList = new ArrayList<Integer>();
		for (int i = 0; i < mlist.size(); i++) {
			int a = (int) mlist.get(i).getRecipe_no();
			recipeList.add(a);
		}

		Integer[] MinusList = f_list.toArray(new Integer[f_list.size()]);

		// 최종적으로 남은 리턴시킬 레시피 번호들
		for (int i = 0; i < mlist.size(); i++) {
			for (int j = 0; j < MinusList.length; j++) {
				if (mlist.get(i).getRecipe_no() == (int) MinusList[j]) {
					// System.out.println("mlist.get(i).getRecipe_no() :
					// "+mlist.get(i).getRecipe_no()+" (int)MinusList[j] :"+(int)MinusList[j]);
					int findnum = recipeList.indexOf(mlist.get(i).getRecipe_no());// 제거할 값의 인덱스를 추출
					recipeList.remove(findnum); // 사용자의 개인정보에서 필요한 리스트 번호들만 추출함
					System.out.println(recipeList);
				}
			}
		}

		return recipeList;
	}

	// -키워드 걸러내기 위한 필터 함수 dislike를 추출하기 위해서는 사용자 번호기 필여하고 -키워드를 입력 받을 필요가 있다.
	public List<Integer> miunsFiltering(int userNo) {
		List<RecipeVo> mlist = searchdao.getMaterial(); // 레시피와 레시피의 재료를 가짐
		// -재료 솎아 내기
		// RecipeVo dislike = null;
		// dislike = searchdao.getdislikelist(userNo); // 사용자의 번호에 맞춰서 싫어하는 재료 정보를 다 들고
		// 온다. -> 세션에서 받아오도록 변경 필요
		String dllist = null;
		dllist = searchdao.getdislikelist2(userNo);
		// System.out.println("dislike"+dislike.toString());
		if (dllist == null) {
			// 값이 널일 경우 디스라이크를 통한 필터가 작용될 수 없다. 그러니 -검색어가 없을 경우는 그냥 전체 레시피 리스트를 리턴한다.
			List<Integer> f_list = searchdao.getAllrecipeNo();
			System.out.println(f_list);
			return f_list;
		}
		System.out.println("dislike : " + dllist);
		String[] dm = dllist.split(","); // 사용자가 등록한 비선호 식품 리스트

		HashSet<Integer> f_list = new HashSet<Integer>(); // 중복값을 안 받기 위해서 사용함
		// 레시피들을 반복한다.
		for (int i = 0; i < mlist.size(); i++) {
			Loop2: for (int j = 0; j < dm.length; j++) {
				String[] material = mlist.get(i).getMaterial().split(","); // i번째 레시피의 재료를 추출해서 쪼갠다.
				for (int k = 0; k < material.length; k++) {
					if (material[k].equals(dm[j])) {
						f_list.add(mlist.get(i).getRecipe_no());
						break Loop2;
					}
				}
			}
		}
		System.out.println("비선호 목록 최종본 아마도 : " + f_list); // 걸러야 하는 레시피가 다 들어감
		// List<String> recipeList = new ArrayList<String>();
		List<Integer> recipeList = new ArrayList<Integer>();
		for (int i = 0; i < mlist.size(); i++) {
			int a = (int) mlist.get(i).getRecipe_no();
			recipeList.add(a);
		}

		Integer[] MinusList = f_list.toArray(new Integer[f_list.size()]);

		// 최종적으로 남은 리턴시킬 레시피 번호들
		for (int i = 0; i < mlist.size(); i++) {
			for (int j = 0; j < MinusList.length; j++) {
				if (mlist.get(i).getRecipe_no() == (int) MinusList[j]) {
					// System.out.println("mlist.get(i).getRecipe_no() :
					// "+mlist.get(i).getRecipe_no()+" (int)MinusList[j] :"+(int)MinusList[j]);
					int findnum = recipeList.indexOf(mlist.get(i).getRecipe_no());// 제거할 값의 인덱스를 추출
					recipeList.remove(findnum); // 사용자의 개인정보에서 필요한 리스트 번호들만 추출함
					System.out.println(recipeList);
				}
			}
		}

		return recipeList;
	}

	// -키워드 걸러내기 위한 필터 함수 dislike를 추출하기 위해서는 사용자 번호기 필여하고 -키워드를 입력 받을 필요가 있다.
	public List<Integer> miunsFiltering(keywordVo kvo) {
		String[] dmlist = {};
		kvo.optioncheck();
		if (kvo.getCheck_login() == 1) { // 로그인 사용자일경우 추가한다.
			String dm = searchdao.getdislikelist2(kvo.getUser_no());
			System.out.println("사용자가 입력한 dm:"+dm);
			if (dm != null) {
				dmlist = dm.split(",");
			}
		}
		int mwchwck = mwcheck(kvo);
		kvo.setM_word_check(mwchwck);
		System.out.println("dmlist "+dmlist);
		Set<String> imsisibal = new HashSet<String>(Arrays.asList(dmlist));
		if (kvo.getM_word_check()==1) { // -키워드가 존재할 경우
			String mwno = searchdao.getMaterialNo(kvo.getM_word());
			System.out.println(mwno);
			String[] mwnolist = mwno.split(",");

			if (dmlist.length == 0) { // 비로그인 사용자일경우
				// -키워드들의 번호를 들고온다.
				imsisibal = new HashSet<String>(Arrays.asList(mwnolist));
			} else {
				for (int i = 0; i < mwnolist.length; i++) {
					imsisibal.add(mwnolist[i]);
				}
			}
		}
		System.out.println(imsisibal); 
		if (imsisibal.size() == 0) {// -재료가 없으니 그냥 리턴한다.
			System.out.println("-재료가 없으니 돌아간다."); 
			return kvo.getP_list();
		}
		List<Integer> list = new ArrayList<Integer>(imsisibal.size());
		for(String i: imsisibal) {
			list.add(Integer.parseInt(i));
		}
		String dm = searchdao.getdislikerecipeNo(list);
		System.out.println("신필터에서 내가 확인한다. "+dm); 
		dmlist = dm.split(",");
		List<Integer> f_list;
		if (kvo.getP_list().get(0)==0) {
			f_list = searchdao.getAllrecipeNo();
		} else {
			f_list = kvo.getP_list();
		}
		System.out.println(kvo.getP_list()); 
		System.out.println(kvo.getP_list());
		for (int i = 0; i < dmlist.length; i++) {
			if (f_list.contains(Integer.parseInt(dmlist[i]))) {
				System.out.println("dmlist["+i+"]"+dmlist[i]);
				int index = f_list.indexOf(Integer.parseInt(dmlist[i]));
				System.out.println(index); 
				f_list.remove(index);
			}
		}
		System.out.println("필터완료");
		for (int i : f_list) {
			System.out.print("-필터 "+i + " ");
		}
		if(f_list.size()==0) {
			f_list.add(0);
		}
		return f_list;
	}
	
	public List<Integer> miunsFilteringT(keywordVo kvo) {
		if (kvo.getCheck_login() == 1) { // 로그인 사용자일경우 추가한다.
			String dm = searchdao.getdislikelist2(kvo.getUser_no());
			List<Integer> f_list = kvo.getP_list();
			if (dm.length() != 0) {
				Pattern pattern = Pattern.compile(",");
				List<Integer> dmlist = pattern.splitAsStream(dm).
						map(Integer::valueOf).
						collect(Collectors.toList());
				//차집합
				for(int i=0; i<dmlist.size(); i++) {
					if(f_list.contains(dmlist.get(i))) {
						int index = f_list.indexOf(dmlist.get(i));
						f_list.remove(index);
					}
				}
				return f_list;
			} else { //로그인 사용자가 설정한  것이 없기에 그냥 반환한다. 
				return kvo.getP_list();
			}
		} else { //비로그인 사용자의 경우 딱히 확인을 못하니 그냥 돌려 준다.
			return kvo.getP_list();
		}
	}


	public int flcheck(keywordVo kvo) {
		System.out.println("f_list 길이 : " + kvo.getF_list().size());
		if (kvo.getF_list().size() == 0) {
			kvo.setF_list_check(0);
		} else {
			kvo.setF_list_check(1);
		}
		return kvo.getF_list_check();
	}

	public int pwcheck(keywordVo kvo) {
		if (kvo.getP_word().get(0).equals("")) {
			kvo.setP_word_check(0);
		} else {
			kvo.setP_word_check(1);
		}
		return kvo.getP_word_check();
	}
	
	public int mwcheck(keywordVo kvo) {
		if (kvo.getM_word().get(0).equals("")) {
			kvo.setM_word_check(0);
		} else {
			kvo.setM_word_check(1);
		}
		return kvo.getM_word_check();
	}


	public List<TagVo> getTopTag() {
		List<TagVo> t_list = searchdao.getTopTag();
		System.out.println(t_list.toString()); 
		return t_list;
	}



}
