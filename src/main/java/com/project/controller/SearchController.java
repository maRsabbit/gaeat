package com.project.controller;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.project.service.SearchService;
import com.project.vo.RecipeVo;
import com.project.vo.SocialUserVo;
import com.project.vo.TagVo;
import com.project.vo.keywordVo;

@Controller
@RequestMapping("etc/")
public class SearchController {
	@Autowired
	private SearchService searchservice;
	// 각서비스 별 규칙 : getList + 로그린 유무(Nl/L) + 사용 필터 유무 (ㅡ/+ 순)(Nf/Mf/Pf/Af)으로 설정한다. 
	//						 // Nl : dislike를 적용되지 않는다			Nf : 키워드 없을 경우
	//						 // L :  dislike를 적용한다.			Pf : -검색어가 없을 경우
	//						 									Mf : -검색어가 포함되어져 있을 경우													
	
	@RequestMapping(value="list", method=RequestMethod.GET)
	public String list() {
		return "list/list";
	}

	// 중간 발표 후 수정
	@ResponseBody
	@RequestMapping(value = "search2", method = { RequestMethod.GET, RequestMethod.POST })
	public List<RecipeVo> searchresult2(@ModelAttribute keywordVo kvo, HttpSession session) {
		SocialUserVo suvo = (SocialUserVo) session.getAttribute("authUser"); // 세션을 받아온다.
		kvo.optioncheck2();
		int currNo = 1;
		if (kvo.getPage() == 0) { // currNo가 설정 안됬을 때
			kvo.setPage(currNo);
		} else {
			currNo = kvo.getPage();
		}
		System.out.println(kvo.getPage());
		if (kvo.getWord() == null || kvo.getWord() == "") { // 비로그인 사용자가 검색어가 없을 때 위의 컨트롤러 먹어치웠다!!!
			if (suvo == null) { // 비로그인 사용자일시
				System.out.println("비로그인/키워드 없음");
				// 비로그인 사용자 고려사항 : dislike 탭에서 정보를 추출할 수 없다.
				// -필터는 순수 검색값에 의존 마찬가지로 키워드 유무를 확인해야 한다.
				// 키워드도 없는 상황에서 비로그인 사용자
				// 조리 난이도, 시간, 방법, 종류
				kvo.optioncheck2();
				List<RecipeVo> list = searchservice.getListNlNf(kvo);
				System.out.println("비로그인/키워드 없음 리턴값 : 1 " + list.toString());
				return list;
			} else { // 로그인 사용자이기에 해당 정보는 넘겨준다.
				System.out.println("로그인/키워드 없음");
				int chef_no = suvo.getChef_no();
				kvo.setUser_no(chef_no); // dislike 정보를 가져오기 위한 사용자 번호
				List<RecipeVo> list = searchservice.getListLNf(kvo);
				System.out.println("로그인/키워드 없음 리턴값 : 1 " + list.toString());
				return list;
			}
		} else { // 키워드 버튼 혹은 검색창을 통해서 받아온다.
			splitWord(kvo.getWord());
			System.out.println("일단 키워드 있음");
			// 키워드 분리
			keywordVo splitVo = splitWord(kvo.getWord());
			System.out.println("splitVo : " + splitVo.toString());

			System.out.println("일단 키워드 있음");
			kvo.setM_word(splitVo.getM_word());
			kvo.setP_word(splitVo.getP_word());
			kvo.setF_word(splitVo.getF_word());
			kvo.setT_word(splitVo.getT_word());

			// 키워드가 있기 때문에 검색의 절차가 필요함.
			if (kvo.getP_word().size() == 0) {
				System.out.println("+가 없다.");
				// 키워드들만 존재할 때 기존과 동일하게 그냥 넘긴다.
				// 키워드를 추가로 어디에 속하는 단어들인지 분류한다.
				// 널이면 해당 키워드에는 요리명으로 검색이
				// 실시된 것이 아니기 때문에 전체레시피 번호를 번환한다.
				// 널이 아니면 해당 레시피번호들로 나머지필터 작업을 적용한다.
				// 로그인 유무 확인
				if (suvo != null) {
					int chef_no = suvo.getChef_no();
					kvo.setUser_no(chef_no);
					kvo.setCheck_login(1);
				} else {
					kvo.setCheck_login(0);
				}
				List<RecipeVo> list = searchservice.getListOnlyMf(kvo);
				return list;

			} else {
				System.out.println("+가 있다.");
				// +키워드가 일단은 존재한다.
				List<String> recipeList = splitplusword(kvo.getP_word());
				if (suvo != null) { // 로그인 유무 확인 후
					int chef_no = suvo.getChef_no();
					kvo.setUser_no(chef_no);
					kvo.setCheck_login(1);// 로그인 사용자 판단용 넘긴다.
				} else {
					kvo.setCheck_login(0);
				}
				List<Integer> f_list = new ArrayList<Integer>(recipeList.size());
				for (String current : recipeList) {
					f_list.add(Integer.parseInt(current));
				}
				List<RecipeVo> list = searchservice.getListF(kvo, f_list);
				return list;
			}
		}
	}
	
	// 키워드 분리 함수
	public keywordVo splitWord(String inputword) {
		String[] word = inputword.split(",");
		for (int i = 0; i < word.length; i++) {
			word[i] = word[i].trim();
			System.out.println(word[i]);
		}
		String minus = "";
		String plus = "";
		String tag = "";
		String allword = "";
		for (int i = 0; i < word.length; i++) { // -키워드 재료 추출
			if (word[i].indexOf("-") == 0) {
				word[i] = word[i].substring(1, word[i].length());
				minus = minus + word[i] + " ";
				allword = allword + word[i] + " ";
				System.out.println(minus);
			} else if(word[i].indexOf("#") == 0) { // 태그 검색억 추출
				word[i] = word[i].substring(1, word[i].length());
				tag = tag + word[i] + " ";
				allword = allword + word[i] + " ";
				System.out.println(minus);
			}else {
				plus = plus + word[i] + " ";
				allword = allword + word[i] + " ";
				System.out.println(plus);
			} 
		}
		List<String> m_word = new ArrayList<String>(Arrays.asList(minus.split(" ")));
		List<String> p_word = new ArrayList<String>(Arrays.asList(plus.split(" ")));
		List<String> t_word = new ArrayList<String>(Arrays.asList(tag.split(" ")));
		List<String> a_word = new ArrayList<String>(Arrays.asList(allword.split(" ")));
		
		System.out.println(
				"m_word : "+m_word+" "+
				"p_word : "+p_word+" "+
				"t_word : "+t_word+" "+
				"a_word : "+a_word
				); 
		keywordVo kvo = new keywordVo(p_word, m_word, a_word, t_word);
		System.out.println("단어 쪼개기에서 "+kvo.toString());
		
		return kvo;
	}
	

	public List<String> splitplusword(List<String> pword) {
		String checkedWordInFoodname = ""; // 요리명에 속하는 단어인지 검색
		String checkedWordInNickname = ""; // 작성자명인지를 파악
		String checkedWordInMaterial = ""; // 재료에 속하는지를 파악

		checkedWordInFoodname = searchservice.confirmTitle(pword); // 요리명에 속하는 단어인지 검색
		checkedWordInNickname = searchservice.confirmNickname(pword); // 작성자명인지를 파악
		checkedWordInMaterial = searchservice.confirmMaterial(pword); // 재료에 속하는지를 파악

		System.out.println("checkedWordInFoodname : " + checkedWordInFoodname + "\n" + "checkedWordInNickname : "
				+ checkedWordInNickname + "\n" + "checkedWordInMaterial : " + checkedWordInMaterial + "\n");
		if ((checkedWordInFoodname == null) && (checkedWordInNickname == null) && (checkedWordInMaterial == null)) {
			List<String> list = new ArrayList<String>(Arrays.asList("0")); // 정책상 0번을 가지는 레시피는 존재하지 않게 설계할 것이다!!!
			// 긁어온 데이터가 전부 널인 경우
			return list;
		} else {
			List<String> intersectionList = new ArrayList<String>();
			if (checkedWordInFoodname == null) {// 요리명이
				System.out.println("checkedWordInFoodname 메세지 : 검색어가 요리명을 포함하지 않거나 찾으시는 결과가 없습니다.");
			} else {
				String[] splitresult = checkedWordInFoodname.split(",");
				System.out.println(splitresult);
				if (intersectionList.isEmpty()) {
					intersectionList = new ArrayList<String>(Arrays.asList(splitresult)); // 여기가 첫단추라 넌 여기서 그냥 추가한다.
					System.out.println("intersectionList");
					for (String t : intersectionList) {
						System.out.println(t);
					}
				}

			}
			if (checkedWordInNickname == null) {// 작성자가
				System.out.println("checkedWordInNickname 메세지 : 검색어가 요리명을 포함하지 않거나 찾으시는 결과가 없습니다.");
			} else {
				String[] splitresult = checkedWordInNickname.split(",");
				System.out.println(splitresult);
				if (intersectionList.isEmpty()) {
					intersectionList = new ArrayList<String>(Arrays.asList(splitresult));
					System.out.println("intersectionList");
					for (String t : intersectionList) {
						System.out.println(t);
					}
				} else {
					List<String> list = new ArrayList<String>(Arrays.asList(splitresult));
					intersectionList = intersection(intersectionList, list);
					System.out.println("intersectionList");
					for (String t : intersectionList) {
						System.out.println(t);
					}
				}
			}
			if (checkedWordInMaterial == null) {// 제목이
				System.out.println("checkedWordInMaterial 메세지 : 검색어가 요리명을 포함하지 않거나 찾으시는 결과가 없습니다.");
			} else {
				String[] splitresult = checkedWordInMaterial.split(",");
				System.out.println(splitresult);
				if (intersectionList.isEmpty()) {
					intersectionList = new ArrayList<String>(Arrays.asList(splitresult));
					System.out.println("intersectionList");
					for (String t : intersectionList) {
						System.out.println(t);
					}
				} else {
					List<String> list = new ArrayList<String>(Arrays.asList(splitresult));
					System.out.println("intersectionList");
					intersectionList = intersection(intersectionList, list);
					for (String t : intersectionList) {
						System.out.println(t);
					}
				}
			}
			System.out.println("+키워드 1차처리 완료 및 확인");
			for (int i = 0; i < intersectionList.size(); i++) {
				System.out.print(intersectionList.get(i).toString());
			}
			if (intersectionList.size() == 0) {
				intersectionList.add("0");
			}
			return intersectionList;
		}
	}

	// 교집합 함수
	public <T> List<T> intersection(List<T> list1, List<T> list2) {
		List<T> list = new ArrayList<T>();
		for (T t : list1) {
			if (list2.contains(t)) {
				list.add(t);
			}
		}
		return list;
	}
	@ResponseBody
	@RequestMapping(value = "tagsearch", method = { RequestMethod.GET, RequestMethod.POST })
	public List<RecipeVo> tagsearch(@ModelAttribute keywordVo kvo, HttpSession session) {
		System.out.println(kvo.toString());
		SocialUserVo suvo = (SocialUserVo) session.getAttribute("authUser"); // 세션을 받아온다.
		if (suvo != null) {
			kvo.setUser_no(suvo.getChef_no());
			kvo.setCheck_login(1);
		} else {
			kvo.setCheck_login(0);
		}
		List<RecipeVo> ts_list = searchservice.getListTag(kvo);
		return ts_list;
	}

	@ResponseBody
	@RequestMapping(value = "drawtag", method = { RequestMethod.GET, RequestMethod.POST })
	public List<TagVo> drawtag() {
		System.out.println("태그 출력을 위해서 들어옴");
		List<TagVo> t_list = searchservice.getTopTag();
		System.out.println(t_list.toString());
		return t_list;
	}
	

/*	
	// 검색어 제외하고 카테고리들로만 한거에염
	@ResponseBody
	@RequestMapping(value = "search", method = { RequestMethod.GET, RequestMethod.POST })
	public List<RecipeVo> searchresult(@ModelAttribute keywordVo kvo,HttpSession session) {
		System.out.println("처리 시작001"); 
		SocialUserVo suvo = (SocialUserVo) session.getAttribute("authUser"); //세션을 받아온다. 

		
		
		if(kvo.getWord()==null||kvo.getWord()=="") { //비로그인 사용자가 검색어가 없을 때 위의 컨트롤러 먹어치웠다!!!
			if(suvo == null) { // 비로그인 사용자일시
				System.out.println("비로그인/키워드 없음"); 
				//비로그인 사용자 고려사항 : dislike 탭에서 정보를 추출할 수 없다. 
				//					-필터는 순수 검색값에 의존 마찬가지로 키워드 유무를 확인해야 한다.
				//키워드도 없는 상황에서 비로그인 사용자
				//조리 난이도, 시간, 방법, 종류
				RecipeVo rvo = new RecipeVo(kvo.getLevel(), kvo.getTime(), kvo.getMethod(), kvo.getType());
				List<RecipeVo> list = searchservice.getListNlNf(rvo);
				System.out.println("비로그인/키워드 없음 리턴값 : 1 " + list.toString());
				return list;
			} else { //로그인 사용자이기에 해당 정보는 넘겨준다.
				System.out.println("로그인/키워드 없음"); 
				int chef_no = suvo.getChef_no();
				kvo.setUser_no(chef_no); // dislike 정보를 가져오기 위한 사용자 번호
				List<RecipeVo> list = searchservice.getListLNf(kvo);
				System.out.println("로그인/키워드 없음 리턴값 : 1 " + list.toString());
				return list;
			}	
		} else { // 키워드 버튼 혹은 검색창을 통해서 받아온다.
			System.out.println("키워드 있음  "+kvo.toString());
			// RecipeVo rvo_m = new RecipeVo();
			List<RecipeVo> mlist = searchservice.getMaterial(); //비교를 위한 재료를 들고 온다.
			System.out.println(mlist.toString());
			
			//키워드 분리
			keywordVo splitVo = splitWord(kvo.getWord());
			System.out.println("splitVo : "+splitVo.toString());    
			
			kvo.setM_word(splitVo.getM_word());
			List<String> mw = kvo.getM_word();
			System.out.println(mw);
			kvo.setP_word(splitVo.getP_word());
			kvo.setF_word(splitVo.getF_word());
			kvo.setT_word(splitVo.getT_word());
			
			if(suvo == null) {
				//비로그인 사용자시 처리
				System.out.println("키워드가 있는 비로그인 사용자"); 
				if(mw.get(0).equals("")) { // 비로그인 사용자가 -키워드가 없을 때
					System.out.println("비로그인/-키워드 없음"); 
					//+키워드는 or용으로 설정된 키워드이므로 컨트롤러에서의 추가적인 분류는 없다.
					List<RecipeVo> list = searchservice.getListNlPf(kvo);
					System.out.println("비로그인/-키워드 없음"+list.toString()); 
					return list;
				} else {  // 비로그인 사용자가 -키워드가 있을 때
					System.out.println("비로그인/-키워드있음"); 
					List<RecipeVo> list = searchservice.getListNlMf(kvo);
					System.out.println("비로그인/-키워드 있음"+list.toString()); 
					return list;
				}
			} else { // 로그인 사용자
				System.out.println("키워드가 있는 로그인 사용자"); 
				int chef_no = suvo.getChef_no();
				kvo.setUser_no(chef_no); // dislike 정보를 가져오기 위한 사용자 번호
				
				if(mw.get(0).equals("")) { // 비로그인 사용자가 -키워드가 없을 때
					System.out.println("-키워드가 없는 로그인 사용자"); 
					//+키워드는 or용으로 설정된 키워드이므로 컨트롤러에서의 추가적인 분류는 없다.
					List<RecipeVo> list = searchservice.getListLPf(kvo);
					System.out.println("로그인/-키워드 없음"+list.toString()); 
					return list;
				} else {  // 비로그인 사용자가 -키워드가 있을 때
					System.out.println("-키워드가 있는 로그인 사용자"); 
					List<RecipeVo> list = searchservice.getListLMf(kvo);
					System.out.println("로그인/-키워드 있음"+list.toString()); 
					return list;
				}
			}
		}
	} 
	
*/
	
}
