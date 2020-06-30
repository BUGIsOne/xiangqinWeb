package com.fdream.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.fdream.entity.Love;
import com.fdream.entity.User;
import com.fdream.service.ILoveService;
import com.fdream.service.IUserService;
import com.fdream.util.RandomStringUtil;

import net.sf.json.JSONArray;

@Controller
@RequestMapping("/love")
public class LoveController {
	@Autowired
	private ILoveService loveService;
	@Autowired
	private IUserService userService;
	
	@RequestMapping("/findListBy_Uid")
	public String findListBy_Uid(HttpServletRequest request,HttpServletResponse response) throws Exception{
		String uid =request.getParameter("uid");
		List<Love> loverList=null;
		List<User> userList=new ArrayList<User>();  
		if(!"".equals(uid) && uid!=null){
			loverList=loveService.findListBy_Uid(uid);
			if(loverList.size()==0){
				System.out.println("您还没有喜欢的人");
			}else{
				for(int i=0;i<loverList.size();i++){
					System.out.println(loverList.get(i).getUid_b());
					userList.add(userService.findById(loverList.get(i).getUid_b()));
				}
			}
			
		}
		JSONArray jsonArray = JSONArray.fromObject(userList);
		response.setContentType("application/json");
		try {
			PrintWriter out = response.getWriter();
			String json = jsonArray.toString();
			out.write(json);
		} catch (IOException e) {
			e.printStackTrace();
		}
		return null;
	}
	
	@RequestMapping("/save")
	public String save(HttpServletRequest request,HttpServletResponse response) throws Exception{
		String uid_a =request.getParameter("uid_a");
		String uid_b =request.getParameter("uid_b");
		String msg="";
		Love love=new Love();
		List<Love> loveList = loveService.findIsLove(uid_a, uid_b);
		if(uid_a.equals(uid_b)){
			msg="{\"result\":\"你连自己也喜欢太自恋了哦！\"}";//
		}else{
			if(loveList.size()>0){
				msg="{\"result\":\"你已喜欢,请勿重复喜欢！\"}";//你已喜欢,请勿重复喜欢！
			}else{
				if(!"".equals(uid_a) && uid_a!=null){
					String lid = RandomStringUtil.getRandomCode(10, 1);
					love.setLid(lid);
					love.setUid_a(uid_a);
					love.setUid_b(uid_b);
					loveService.save(love);
					msg= "{\"result\":\"喜欢成功！\"}";//喜欢成功！
					User u=userService.findById(uid_b);
					u.setLovenum(u.getLovenum()+1);
					userService.update(u);
				}else{
					msg="{\"result\":\"请先登录！\"}";//请先登录
				}
			}
		}
		
		response.setContentType("application/json");
		PrintWriter out;
		out = response.getWriter();
		out.write(msg);
		return null;
	}
}  
