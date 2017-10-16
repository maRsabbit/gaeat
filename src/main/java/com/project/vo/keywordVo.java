package com.project.vo;

import java.util.List;

public class keywordVo {
	private String type;
	private String method;
	private String level;
	private String time;
	private String orderOption;
	private String word;
	private List<String> p_word; // +검색용 키워드 다 포함되기 때문에 졸라 짜증난다.
	private List<String> m_word; // -검색 키워드 일단은 추가적으로 검색엔진등을 활용하는게 아니라 재료만 매칭 대상이다.
	private List<String> P_word_fn; // 요리명
	private List<String> P_word_rt; // 레시피 제목
	private List<String> P_word_nn; // 닉네임
	private List<String> P_word_in; // 소개글
	private List<String> t_word; // 태그 저장해야 한다. 
	private List<Integer> f_list; // 필터된 레시피 번호들의 목록
	private List<Integer> p_list; // 필터된 레시피 번호들의 목록
	private List<String> f_word; // 전체 검색 단어들 언젠가는 쓰이겠지........
	private int f_list_check; // 값이 있으면 1 없으면 0
	private int p_word_check; // 값이 있으면 1 없으면 0
	private int m_word_check; // 값이 있으면 1 없으면 0
	private int user_no; // 세션에서 받아올 사용자 번호
	private int tag_no; 
	private int check_login;
	private int displayRowCount = 6; // 출력할 데이터 개수
	private int rowStart; // 시작행번호
	private int rowEnd; // 종료행 번호
	private int totPage; // 전체 페이지 수,
	private int totRow = 0; // 전체 데이터 수
	private int page; // 현재 페이지
	private int pageStart; // 시작페이지
	private int pageEnd; // 종료페이지

	public void pageCalculate(Integer total) {
		getPage();
		totRow = total;
		totPage = (int) (total / displayRowCount);

		if (total % displayRowCount > 0)
			totPage++;

		pageStart = (page - (page - 1) % 10);
		pageEnd = pageStart + 9;
		if (pageEnd > totPage)
			pageEnd = totPage;

		rowStart = ((page - 1) * displayRowCount) + 1;
		rowEnd = rowStart + displayRowCount - 1;
	}

	public keywordVo() {
	}

	public keywordVo(List<String> p_word, List<String> m_word, List<String> f_word) {
		super();
		this.p_word = p_word;
		this.m_word = m_word;
		this.f_word = f_word;
	}

	public keywordVo(List<String> p_word, List<String> m_word, List<String> f_word, List<String> t_word) {
		super();
		this.p_word = p_word;
		this.m_word = m_word;
		this.f_word = f_word;
		this.t_word = t_word;
	}

	public keywordVo(String type, String method, String level, String time, String word, List<String> p_word,
			List<String> m_word, List<String> t_word, List<Integer> f_list, List<String> f_word, int f_list_check,
			int p_word_check, int user_no) {
		super();
		this.type = type;
		this.method = method;
		this.level = level;
		this.time = time;
		this.word = word;
		this.p_word = p_word;
		this.m_word = m_word;
		this.t_word = t_word;
		this.f_list = f_list;
		this.f_word = f_word;
		this.f_list_check = f_list_check;
		this.p_word_check = p_word_check;
		this.user_no = user_no;
	}

	public keywordVo(String type, String method, String level, String time, String word, List<String> p_word,
			List<String> m_word, List<String> p_word_fn, List<String> p_word_rt, List<String> p_word_nn,
			List<String> p_word_in, List<String> t_word, List<Integer> f_list, List<Integer> p_list,
			List<String> f_word, int f_list_check, int p_word_check, int user_no, int check_login, int displayRowCount,
			int rowStart, int rowEnd, int totPage, int totRow, int page, int pageStart, int pageEnd) {
		super();
		this.type = type;
		this.method = method;
		this.level = level;
		this.time = time;
		this.word = word;
		this.p_word = p_word;
		this.m_word = m_word;
		P_word_fn = p_word_fn;
		P_word_rt = p_word_rt;
		P_word_nn = p_word_nn;
		P_word_in = p_word_in;
		this.t_word = t_word;
		this.f_list = f_list;
		this.p_list = p_list;
		this.f_word = f_word;
		this.f_list_check = f_list_check;
		this.p_word_check = p_word_check;
		this.user_no = user_no;
		this.check_login = check_login;
		this.displayRowCount = displayRowCount;
		this.rowStart = rowStart;
		this.rowEnd = rowEnd;
		this.totPage = totPage;
		this.totRow = totRow;
		this.page = page;
		this.pageStart = pageStart;
		this.pageEnd = pageEnd;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getMethod() {
		return method;
	}

	public void setMethod(String method) {
		this.method = method;
	}

	public String getLevel() {
		return level;
	}

	public void setLevel(String level) {
		this.level = level;
	}

	public String getTime() {
		return time;
	}

	public void setTime(String time) {
		this.time = time;
	}

	public String getWord() {
		return word;
	}

	public void setWord(String word) {
		this.word = word;
	}
	
	public String getOrderOption() {
		return orderOption;
	}

	public void setOrderOption(String orderOption) {
		this.orderOption = orderOption;
	}

	public List<String> getP_word() {
		return p_word;
	}

	public void setP_word(List<String> p_word) {
		this.p_word = p_word;
	}

	public List<String> getM_word() {
		return m_word;
	}

	public void setM_word(List<String> m_word) {
		this.m_word = m_word;
	}

	public List<String> getP_word_fn() {
		return P_word_fn;
	}

	public void setP_word_fn(List<String> p_word_fn) {
		P_word_fn = p_word_fn;
	}

	public List<String> getP_word_rt() {
		return P_word_rt;
	}

	public void setP_word_rt(List<String> p_word_rt) {
		P_word_rt = p_word_rt;
	}

	public List<String> getP_word_nn() {
		return P_word_nn;
	}

	public void setP_word_nn(List<String> p_word_nn) {
		P_word_nn = p_word_nn;
	}

	public List<String> getP_word_in() {
		return P_word_in;
	}

	public void setP_word_in(List<String> p_word_in) {
		P_word_in = p_word_in;
	}

	public List<String> getT_word() {
		return t_word;
	}

	public void setT_word(List<String> t_word) {
		this.t_word = t_word;
	}

	public List<Integer> getF_list() {
		return f_list;
	}

	public void setF_list(List<Integer> f_list) {
		this.f_list = f_list;
	}

	public List<Integer> getP_list() {
		return p_list;
	}

	public void setP_list(List<Integer> p_list) {
		this.p_list = p_list;
	}

	public List<String> getF_word() {
		return f_word;
	}

	public void setF_word(List<String> f_word) {
		this.f_word = f_word;
	}

	public int getF_list_check() {
		return f_list_check;
	}

	public void setF_list_check(int f_list_check) {
		this.f_list_check = f_list_check;
	}

	public int getP_word_check() {
		return p_word_check;
	}

	public void setP_word_check(int p_word_check) {
		this.p_word_check = p_word_check;
	}

	public int getM_word_check() {
		return m_word_check;
	}

	public void setM_word_check(int m_word_check) {
		this.m_word_check = m_word_check;
	}

	public int getUser_no() {
		return user_no;
	}

	public void setUser_no(int user_no) {
		this.user_no = user_no;
	}

	public int getCheck_login() {
		return check_login;
	}

	public void setCheck_login(int check_login) {
		this.check_login = check_login;
	}

	public int getDisplayRowCount() {
		return displayRowCount;
	}

	public void setDisplayRowCount(int displayRowCount) {
		this.displayRowCount = displayRowCount;
	}

	public int getRowStart() {
		return rowStart;
	}

	public void setRowStart(int rowStart) {
		this.rowStart = rowStart;
	}

	public int getRowEnd() {
		return rowEnd;
	}

	public void setRowEnd(int rowEnd) {
		this.rowEnd = rowEnd;
	}

	public int getTotPage() {
		return totPage;
	}

	public void setTotPage(int totPage) {
		this.totPage = totPage;
	}

	public int getTotRow() {
		return totRow;
	}

	public void setTotRow(int totRow) {
		this.totRow = totRow;
	}

	public int getPage() {
		return page;
	}

	public void setPage(int page) {
		this.page = page;
	}

	public int getPageStart() {
		return pageStart;
	}

	public void setPageStart(int pageStart) {
		this.pageStart = pageStart;
	}

	public int getPageEnd() {
		return pageEnd;
	}

	public void setPageEnd(int pageEnd) {
		this.pageEnd = pageEnd;
	}

	public void optioncheck() {
		System.out.println("keywordVo [f_list=" + f_list + ", p_list=" + p_list + " f_list_check=" + f_list_check
				+ ", p_word_check=" + p_word_check + ", user_no=" + user_no + ", check_login=" + check_login + "]");
	}

	public void optioncheck2() {
		System.out.println("keywordVo [type=" + type + ", method=" + method + ", level=" + level + ", time=" + time + ", "
				+ "word= "+word + "orderOption= "+orderOption+"]");
	}

	@Override
	public String toString() {
		return "keywordVo [type=" + type + ", method=" + method + ", level=" + level + ", time=" + time + ", word="
				+ word + ", p_word=" + p_word + ", m_word=" + m_word + ", P_word_fn=" + P_word_fn + ", P_word_rt="
				+ P_word_rt + ", P_word_nn=" + P_word_nn + ", P_word_in=" + P_word_in + ", t_word=" + t_word
				+ ", f_list=" + f_list + ", p_list=" + p_list + ", f_word=" + f_word + ", f_list_check=" + f_list_check
				+ ", p_word_check=" + p_word_check + ", user_no=" + user_no + ", check_login=" + check_login
				+ ", displayRowCount=" + displayRowCount + ", rowStart=" + rowStart + ", rowEnd=" + rowEnd
				+ ", totPage=" + totPage + ", totRow=" + totRow + ", page=" + page + ", pageStart=" + pageStart
				+ ", pageEnd=" + pageEnd + "]";
	}

	public int getTag_no() {
		return tag_no;
	}

	public void setTag_no(int tag_no) {
		this.tag_no = tag_no;
	}

	

}
