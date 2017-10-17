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

import com.project.repository.UserDao;
import com.project.vo.RecipeInfo;
import com.project.vo.SocialUserVo;


@Service
public class UserService {
	
	@Autowired
	private UserDao uDao;


	public int Enroll(RecipeInfo rInfoVo) {
		
		System.out.println("service:" + rInfoVo.toString());
		
		return uDao.Enroll(rInfoVo);
	}
	public SocialUserVo SocialLogin(SocialUserVo vo){
		
		SocialUserVo authUser= uDao.selectUser(vo);
		//  vo안에 있는(id를 키로 ) 셀렉트 해옴  
		if (authUser==null) {//셀렉트 해온값이 널이면 (가입이 안되어 있으면 )
			int a =uDao.SocialLogin(vo);
			System.out.println("처리된 건수 :"+a);//가입하고 가입건수를 보여줌 
			int b =uDao.RecipeBookinsert(vo);
			System.out.println("처리된 건수 recipebook:"+b);//가입하고 가입건수를 보여줌 
			return uDao.selectUser(vo); //그리고 셀렉트 한번더해와서 리턴해줌 
		}else {
			return  uDao.selectUser(vo);
		}
	}
	
	
	public SocialUserVo joinUser(SocialUserVo joinvo,MultipartFile file) {
		String saveDir = "D:\\javaStudy\\file\\user\\"+joinvo.getId()+"\\"; //유저마다 폴더를 하나 생성할 예정 
		File crateD = new File(saveDir);
			if (!crateD.exists()) {
				crateD.mkdirs();
			}
		
			String exName = file.getOriginalFilename().substring(file.getOriginalFilename().lastIndexOf("."));//확장자
			String saveName = joinvo.getId()+"_"+"profile"+exName;//파일 저장이름 :아이디 +프로필
			String filePath = saveDir + saveName;//패스 
			String saveprofilename = "http://localhost:8088/gaeat01/upload/user/"+joinvo.getId()+"/"+saveName;
			
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
		joinvo.setProfile(saveprofilename);
		
		uDao.UserLogin(joinvo);
		uDao.RecipeBookinsert(joinvo);
			return uDao.selectUser1(joinvo);
	}
	
	
	public SocialUserVo loginUser(SocialUserVo loginvo) {
			return uDao.selectUser1(loginvo); // 디비에서 찾아옴 
	}
	
	public List<String> ingreients() {
		List<String> ingreList = new ArrayList<String>();
				ingreList = uDao.ingredients();
				return ingreList;

	}
	
	public String getdislike(int chef_no) {
		System.out.println("getdislikceservice");
		String  dislike = uDao.getdislike(chef_no); // chef_no로 dislike가 있나없나 파악하고, 
	
		if(dislike!= null) {//사용자가 dislike 항목에 식재료를 등록한 경우
			String[] dm = dislike.split(",");
			ArrayList<Object> dislist = new ArrayList<Object>();
			for(int i=0;i<dm.length;i++) {
				dislist.add(dm[i]);// ,로 나눠서 어레이에 넣어준다.
			} 
			System.out.print(dislist.toString());
			String selectname =uDao.metarialNameselet(dislist);
			return selectname; 
		}
		return dislike; // 디비에서 찾아옴 
	}
	public SocialUserVo hatefooddelete(SocialUserVo deletevo) {
		System.out.println("hatefood delete ");
		String hateno=uDao.hatefoodselect(deletevo.getHatefood());
		System.out.println("싫어하는 재료 번호 " +hateno);
		deletevo.setHatefood(hateno);
		 int a =uDao.hatefooddelte(deletevo);
		 deletevo= uDao.selectUser(deletevo);
		 return deletevo ;

	}
	
	public  SocialUserVo updateUser(SocialUserVo updatevo , MultipartFile file) {
		String saveDir = "D:\\javaStudy\\file\\user\\"+updatevo.getId()+"\\"; //유저마다 폴더를 하나 만듬 
		File crateD = new File(saveDir);					//디렉토리가 없으면 생성 
		if (!crateD.exists()) {
			crateD.mkdirs();
		}
		String exName = file.getOriginalFilename().substring(file.getOriginalFilename().lastIndexOf("."));//확장자
		String saveName = updatevo.getId()+"_"+"profile"+exName;//파일 저장이름 :아이디 +프로필
		String filePath = saveDir + saveName;//패스 
		String saveprofilename ="http://localhost:8088/gaeat01/upload/user/"+updatevo.getId()+"/"+saveName;
			
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
		updatevo.setProfile(saveprofilename); //프로필 사진 바꿔줌 
		
		if(updatevo.getHatefood()!=null) {
			String[] dm = updatevo.getHatefood().split(",");
			
			ArrayList<Object> dislist = new ArrayList<Object>();
			for(int i=0;i<dm.length;i++) {
				dislist.add(dm[i]);// ,로 나눠서 어레이에 넣어준다.
			} 
			System.out.println(dislist.toString());
			String noselect = uDao.metarialnoselet(dislist);
			System.out.println("찾아온 번호 " + noselect);
			
			updatevo.setHatefood(noselect);// 찾아온 번호를 넣어줌 
		}
		
		uDao.Userupdate(updatevo);
		
		return uDao.selectUser(updatevo);
	}
	//유저가 프로필 사진변경을 원치않았을때 업데이트 메소드 
	public  SocialUserVo updateUser1(SocialUserVo updatevo) {
		System.out.println("업데이트 1 " );
		if(updatevo.getHatefood()!=null) {
			String[] dm = updatevo.getHatefood().split(",");
			ArrayList<Object> dislist = new ArrayList<Object>();
			for(int i=0;i<dm.length;i++) {
				dislist.add(dm[i]);// ,로 나눠서 어레이에 넣어준다.
			} 
			System.out.println(dislist.toString());
			String noselect = uDao.metarialnoselet(dislist);
			System.out.println("찾아온 번호 " + noselect);
			
			updatevo.setHatefood(noselect);// 찾아온 번호를 넣어줌 
		}
		else {
			uDao.Userupdate(updatevo);
			return uDao.selectUser(updatevo);
		}
		uDao.Userupdate(updatevo);
		return uDao.selectUser(updatevo);
	}
	
	

}
