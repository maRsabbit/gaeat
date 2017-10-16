package com.project.repository;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.vo.RecipeInfo;
import com.project.vo.SocialUserVo;


@Repository
public class UserDao {

	
	@Autowired
	private SqlSession sqlSession;
	

	
	public int Enroll(RecipeInfo rInfoVo) {
		
		System.out.println("dao:" + rInfoVo.toString());
		
		return sqlSession.insert("user.Enroll", rInfoVo);
		
	}
	//아이디로 다른값을 받아오는 select 
			public SocialUserVo selectUser(SocialUserVo vo){
					return sqlSession.selectOne("selectUser",vo);
						
					}
			public int SocialLogin(SocialUserVo vo){
				int a = sqlSession.insert("Sosialinsert",vo);
					return a;
				}
			public int RecipeBookinsert(){
				int a = sqlSession.insert("RecipeBookinsert");
					return a;
				}
			
			//이메일과 패스워드로 로그인을 하기위한 select 
				public SocialUserVo selectUser1(SocialUserVo joinvo){
					return sqlSession.selectOne("selectUser1",joinvo);
					}
				
				public int UserLogin(SocialUserVo joinvo){
						int a = sqlSession.insert("Userinsert",joinvo);
							return a;
						}
				
				public List<String> ingredients() {
					List<String> ingreList = new ArrayList<String>();
					System.out.println("AAAAAA");
					ingreList = sqlSession.selectList("login.ingredients");
					System.out.println("ingreList"+ingreList.toString());
					return ingreList;
				}
				
			
				public String getdislike (int chef_no){
					System.out.println("getdislike DAO"+chef_no);
					String a = sqlSession.selectOne("login.getdislikelist", chef_no);
					
						return a;
					}
				
				public int hatefooddelte (SocialUserVo vo){
					int a = sqlSession.delete("hatefooddelete", vo);
						
						return a;
					}
				public String hatefoodselect (String hatefood){
			
					String hateno = sqlSession.selectOne("hatefoodselect",hatefood);
						return hateno;
					}
				public String metarialNameselet (ArrayList<Object> dislist){
					System.out.println("metarialNameselet DAO"+dislist.toString());
				
					String nameselect= sqlSession.selectOne("login.getdislikename", dislist);
						return nameselect;
					}
				
				
				public String metarialnoselet (ArrayList<Object> dislistname){
					System.out.println("metarialno DAO"+dislistname.toString());
				
					String noselect= sqlSession.selectOne("login.getdislikeno", dislistname);
						return noselect;
					}
				
				public int Userupdate(SocialUserVo updatevo){
					System.out.println("update ");
			int a = sqlSession.update("Userupdate",updatevo);
					if(updatevo.getHatefood()!=null) {
						String[] dm = updatevo.getHatefood().split(",");
						ArrayList<Object> disnolist = new ArrayList<Object>();
						for(int i=0;i<dm.length;i++) {
						updatevo.setHatefood(dm[i]);
						System.out.println("반복문 돌리기 "+updatevo.toString());
						sqlSession.update("dislikeupdate",updatevo);
						//맵으로 만들어서 chef_no  와 리스트에 있는걸 반복문으로 돌림 	
						} 
					
					}
					else {return a ;}
						
						
							return a;
						}
				
				
	}