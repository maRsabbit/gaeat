package com.project.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.repository.ReadformDao;
import com.project.vo.DatVo;
import com.project.vo.ReadformVo;
import com.project.vo.UserpageVo;

@Service
public class ReadformService {

	@Autowired
	private ReadformDao readformDao;
	
	//readform 할시
	public List<ReadformVo> getlist(ReadformVo readformVo){
		
		return readformDao.getlist(readformVo);
	}
	
	public List<DatVo> getdatlist(DatVo datVo) {
		
		return readformDao.getdatlist(datVo);
	}
	
	public ReadformVo getread(ReadformVo readformVo2) {
		
		return readformDao.getread(readformVo2);
	}
	
	public List<ReadformVo> getmaterial(ReadformVo readformVo3) {
		return readformDao.getmaterial(readformVo3);
	}
	
	//왼쪽 항목
	public UserpageVo getUser(int chef_no){
		return readformDao.getUser(chef_no);
	}
	
	public List<UserpageVo> getRecipebookList(int chef_no) {
		return readformDao.getRecipebookList(chef_no);
	}
	
	//readform할시 작동
	
	public DatVo insertVo(DatVo datVo) {
		
	    readformDao.insertVo(datVo);//no를 가져온 다음에
		readformDao.selectByNo(datVo);
		
		
		return datVo;
	}
	
	
	//delete 
	public int delete(DatVo datVo) {
		return readformDao.delete(datVo);
	}
	
	
	
}
