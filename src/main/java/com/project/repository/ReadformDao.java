package com.project.repository;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.vo.DatVo;
import com.project.vo.ReadformVo;
import com.project.vo.ScrapVo;
import com.project.vo.UserpageVo;

@Repository
public class ReadformDao {
	
	@Autowired
	private SqlSession sqlSession;
	
	
	//readform 당시 할것
	public List<ReadformVo> getlist(ReadformVo readformVo){
		
		
		 List<ReadformVo> list = sqlSession.selectList("readform.list",readformVo);
		
		return list;
	}
	
	public List<DatVo> getdatlist(DatVo datVo) {
		
		
		return sqlSession.selectList("readform.getByteNo",datVo);
	}
	
    public ReadformVo getread(ReadformVo readformVo2) {
		
		return sqlSession.selectOne("readform.readformVo2",readformVo2);
	}
	
    public List<ReadformVo> getmaterial(ReadformVo readformVo3) {
		
		
		return sqlSession.selectList("readform.list3",readformVo3);
	}
    
    //왼쪽 항목
    public UserpageVo getUser(int chef_no) {
		UserpageVo userpageVo = sqlSession.selectOne("readform.selectUserByNo", chef_no);
		return userpageVo;
	}
	
	public List<UserpageVo> getRecipebookList(int chef_no) {
		return sqlSession.selectList("readform.getRecipebookList", chef_no);
	}
    
	//readform 하면 나오는 값
	
	
	
	public int insertVo(DatVo datVo) {
		
		return sqlSession.insert("readform.insertNo",datVo);
	}
	
	public List<DatVo> selectByNo(DatVo datVo) {
		return sqlSession.selectList("readform.selectByno",datVo);
		
	}
	
	
	//delete
	public int delete(DatVo datVo) {
		
		return sqlSession.delete("readform.delete",datVo);
		
	}
	
	public int addScrap(ScrapVo vo) {
		
		return sqlSession.insert("readform.addScrap", vo);
	}

	

}
