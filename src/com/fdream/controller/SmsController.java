package com.fdream.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.fdream.entity.Sms;
import com.fdream.entity.User;
import com.fdream.service.ISmsService;
import com.fdream.util.DateFomat;
import com.fdream.util.RandomStringUtil;

import net.sf.json.JSONArray;
@Controller
@RequestMapping("/sms")
public class SmsController {
	@Autowired
	private ISmsService smsService;
	
	@RequestMapping("/save")
	public String save(HttpServletRequest request,HttpServletResponse response) throws Exception{
		String sconte =request.getParameter("sconte");
		String uid_a =request.getParameter("uid_a");
		String uid_b =request.getParameter("uid_b");
		String msg ="";
		String sid = RandomStringUtil.getRandomCode(10, 3);
		Sms sms =new Sms();
		sms.setSid(sid);
		sms.setSconte(sconte);
		sms.setUid_a(uid_a);
		sms.setUid_b(uid_b);
		sms.setScreatedate(DateFomat.getNowDate());
		
		if(smsService.save(sms)==true){
			msg = "{\"result\":\"评论成功！\"}";
		}else{
			msg = "{\"result\":\"评论失败！\"}";
		}
		response.setContentType("application/json");
		PrintWriter out;
		out = response.getWriter();
		out.write(msg);
		return null;
	}
	
	/**
	 * 查找所有
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/findList")
	public String findList(HttpServletRequest request,HttpServletResponse response) throws Exception{
		String id=request.getParameter("id");
		List<Sms> smsList=smsService.findList(id);
		
		JSONArray jsonArray = JSONArray.fromObject(smsList);
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
}
