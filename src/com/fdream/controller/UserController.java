package com.fdream.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fdream.entity.User;
import com.fdream.service.IUserService;
import com.fdream.util.RandomStringUtil;

import net.sf.json.JSONArray;


/**
 * 用户控制层
 * @author quanmin
 *
 */
@Controller
@RequestMapping("/user")
public class UserController {
	@Autowired
	private IUserService userService;
	
	/**
	 * 添加 修改
	 * @param user
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/save")
	public String save(User user, HttpServletRequest request) throws Exception{
		String id = request.getParameter("uid"); 
		String uname = request.getParameter("uname");
		String email = request.getParameter("email");
		String rid = request.getParameter("rid");
		if("".equals(id)){
			String uid = RandomStringUtil.getRandomCode(8, 1);
			user.setUid(uid);
			user.setUname(uname);
			user.setPassword("123456");
			user.setEmail(email);
			user.setRid(rid);
			userService.save(user);
		}else{
			user = userService.findById(id);
			user.setUname(uname);
			user.setEmail(email);
			user.setRid(rid);
			userService.update(user);
		}
		
		return "redirect:/userList.jsp";
	}
	
	/**
	 * 前台页面
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping("/qtLogin")
	public String qtLogin(HttpServletRequest request,HttpServletResponse response) throws Exception{
		String id = request.getParameter("uid");
		String type = request.getParameter("type"); //根据类型判断
		String uname = request.getParameter("uname");
		String img = request.getParameter("img");
		String fullname = request.getParameter("fullname");
		String password = request.getParameter("password");
		String sex = request.getParameter("sex");
		String age = request.getParameter("age");
		//String rid = request.getParameter("rid");
		String taste = request.getParameter("taste");
		String email = request.getParameter("email");
		String phone = request.getParameter("phone");
		String address = request.getParameter("address");
		//String lovenum = request.getParameter("lovenum");
		//img uname fullname password sex age rid taste email phone address 
		
		String msg ="";
		try {
			if("0".equals(type)){
				//登录
				User user=userService.qtlogin(uname, password);
				if( user != null){
					HttpSession session = request.getSession();
					session.setAttribute("qtuser", user);
					msg = "{\"result\":\"success\"}";
				}else{
					msg = "{\"result\":\"false\"}";
				}
			}else{
				if("".equals(id)){
					//注册
					User user =new User();
					//img uname fullname password sex age  email taste address phone  rid
					String uid = RandomStringUtil.getRandomCode(8, 1);
					user.setUid(uid);
					user.setImg(img);
					user.setUname(uname);
					user.setFullname(fullname);
					user.setPassword(password);
					user.setSex(sex);
					user.setAge(age);
					user.setRid("会员");
					user.setTaste(taste);
					user.setEmail(email);
					user.setPhone(phone);
					user.setAddress(address);
					user.setLovenum(0);
					boolean isSucces = userService.save(user);
					System.out.println("isSucces=================="+isSucces);
					if(isSucces){
						msg = "{\"result\":\"注册成功！\"}";
					}else{
						msg = "{\"result\":\"注册失败！\"}";
					}
				}else{
					//修改信息
					User user =userService.findById(id);
					user.setImg(img);
					user.setFullname(fullname);
					user.setPassword(password);
					user.setSex(sex);
					user.setAge(age);
					user.setTaste(taste);
					user.setEmail(email);
					user.setPhone(phone);
					user.setAddress(address);
					boolean isSucces = userService.update(user);
					if(isSucces){
						msg = "{\"result\":\"保存成功！\"}";
					}else{
						msg = "{\"result\":\"保存失败！\"}";
					}
				}
				
			}
			response.setContentType("application/json");
			PrintWriter out;
			out = response.getWriter();
			out.write(msg);
		} catch (IOException e) {
			e.printStackTrace();
		}
		return null;
	}
	
	/**
	 * 后台登录
	 * @param request
	 * @return
	 */
	@RequestMapping("/htlogin")
	//@ResponseBody
	public String htlogin(HttpServletRequest request,HttpServletResponse response){
		String msg;
		String username = request.getParameter("name");
		String password = request.getParameter("pwd");
		User user=userService.htlogin(username, password);
		if( user != null){
			HttpSession session = request.getSession();
			session.setAttribute("user", user);
			msg = "{\"result\":\"success\"}";
		}else{
			msg = "{\"result\":\"false\"}";
		}
		response.setContentType("application/json");
		PrintWriter out;
		try {
			out = response.getWriter();
			out.write(msg);
		} catch (IOException e) {
			e.printStackTrace();
		}
		return null;
	}
	
	/**
	 * 退出登录
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping("/htlogout")
	public String htlogout(HttpServletRequest request,HttpServletResponse response){
		Object object = request.getSession().getAttribute("user");
		if (object != null) {
		   try {
			   request.getSession().removeAttribute("user");
		   } catch (Exception e) {
			   object = null;
		   }
		}
		return "redirect:/login.jsp";
	}
	
	/**
	 * 退出登录
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping("/qtlogout")
	public String qtlogout(HttpServletRequest request,HttpServletResponse response){
		Object object = request.getSession().getAttribute("qtuser");
		if (object != null) {
		   try {
			   request.getSession().removeAttribute("qtuser");
		   } catch (Exception e) {
			   object = null;
		   }
		}
		return "redirect:/qt/index.jsp";
	}
	
	/**
	 * 查找所有
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/findList")
	public String findList(HttpServletRequest request,HttpServletResponse response) throws Exception{
		String type = request.getParameter("type");
		String sex = request.getParameter("sex");
		String xq = request.getParameter("xq");
		List<User> userList;
		if("qt".equals(type)){
			userList=userService.findListByTJ(sex, xq);
		}else{
			userList=userService.findList();
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
	
	/**
	 * 查找所有
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/findListTop")
	public String findListTop(HttpServletRequest request,HttpServletResponse response) throws Exception{
		List<User> userList_top=userService.findListTop();
		JSONArray jsonArray = JSONArray.fromObject(userList_top);
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
	
	/**
	 * 通过id查找分类信息
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/findById")
	public String findById(HttpServletRequest request) throws Exception{
		String id = request.getParameter("id");
		request.setAttribute("user_u", userService.findById(id));
		return "/user";
	}
	
	/**
	 * 通过id查找
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/findById_qt")
	public String findById_qt(HttpServletRequest request,HttpServletResponse response) throws Exception{
		String id = request.getParameter("id");
		User u =userService.findById(id);
		JSONArray jsonArray = JSONArray.fromObject(u);
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
	
	/**
	 * 通过id删除
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/deletById")
	public String deletById(HttpServletRequest request) throws Exception{
		boolean result;
		String id = request.getParameter("id");
		result=userService.delete(id);
		System.out.println("result:"+result);
		return "redirect:/userList.jsp";
	}
}

