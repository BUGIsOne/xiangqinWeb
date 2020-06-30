package com.fdream.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.fdream.entity.Advert;
import com.fdream.service.IAdvertService;
import com.fdream.util.DateFomat;
import com.fdream.util.RandomStringUtil;

import net.sf.json.JSONArray;

/**
 * 广告控制层
 * @author quanmin
 *
 */
@Controller
@RequestMapping("/advert")
public class AdvertController {
	@Autowired
	private IAdvertService advertService;
	
	/**
	 * 添加 修改
	 * @param advert
	 * @param request
	 * @return
	 */
	@RequestMapping("/save")
	public String save(Advert advert,HttpServletRequest request) throws Exception{
		String id = request.getParameter("aid");
		String aname = request.getParameter("aname");
		String aimg = request.getParameter("aimg");
		String aurl = request.getParameter("aurl");
		String acreatedate = DateFomat.getNowDate();
		if("".equals(id)){
			String aid = RandomStringUtil.getRandomCode(10, 2);
			advert.setAid(aid);
			advert.setAname(aname);
			advert.setAimg(aimg);
			advert.setAurl(aurl);
			advert.setAcreatedate(acreatedate);
			advertService.save(advert);
		}else{
			advert.setAname(aname);
			advert.setAimg(aimg);
			advert.setAurl(aurl); 
			advertService.update(advert);
		}
		return "redirect:/advertList.jsp";
	} 
	
	/**
	 * 查找所有
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/findList")
	public String findList(HttpServletRequest request,HttpServletResponse response) throws Exception{
		List<Advert> advertList=advertService.findList();
		JSONArray jsonArray = JSONArray.fromObject(advertList);
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
	 * 前台广告显示
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/qt_show_adv")
	public String qt_show_adv(HttpServletRequest request,HttpServletResponse response) throws Exception{
		List<Advert> advertList=advertService.findList();
		Advert advert = advertList.get(0);
		JSONArray jsonArray = JSONArray.fromObject(advert);
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
		request.setAttribute("advert", advertService.findById(id));
		return "/advert";
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
		result=advertService.delete(id);
		System.out.println("result:"+result);
		return "redirect:/advertList.jsp";
	}
}
