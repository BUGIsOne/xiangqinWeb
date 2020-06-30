package com.fdream.util;

import java.util.Collections;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.util.StringUtils;
/**
 * 分页类
 * @author quanmin
 *
 */
public class Page {
	private Integer currentPage;
	
	private Integer startNum;
	
	private Integer pageSize;
	
	private Integer pageCount;
	
	private Integer allCount;
	
	
	
	private List datas = Collections.EMPTY_LIST;
	public Page() {
		// TODO Auto-generated constructor stub
	}
	
	public Page(Integer currentPage, Integer startNum, Integer pageSize, Integer pageCount, List datas) {
		super();
		this.currentPage = currentPage;
		this.startNum = startNum;
		this.pageSize = pageSize;
		this.pageCount = pageCount;
		this.datas = datas;
	}

	public Page(HttpServletRequest request) {

		this.currentPage = 1;
		String cPage = request.getParameter("currentPage");
		this.currentPage = StringUtils.isEmpty(cPage)?1:Integer.parseInt(cPage);
		String pSize = request.getParameter("pageSize");
		this.pageSize = StringUtils.isEmpty(pSize)?10:Integer.parseInt(pSize);
		
		this.startNum = StringUtils.isEmpty(cPage)?0:(this.currentPage-1) * this.pageSize;
		//this.pageCount = Integer.parseInt(request.getParameter("pageCount"));
	}



	public Integer getCurrentPage() {
		return currentPage;
	}

	public void setCurrentPage(Integer currentPage) {
		this.currentPage = currentPage;
	}

	public Integer getStartNum() {
		return startNum;
	}

	public void setStartNum(Integer startNum) {
		this.startNum = startNum;
	}

	public Integer getPageSize() {
		return pageSize;
	}

	public void setPageSize(Integer pageSize) {
		this.pageSize = pageSize;
	}

	public Integer getPageCount() {
		return pageCount;
	}

	public void setPageCount(Integer pageCount) {
		this.pageCount = pageCount;
	}

	public List getDatas() {
		return datas;
	}

	public void setDatas(List datas) {
		this.datas = datas;
	}

	public Integer getAllCount() {
		return allCount;
	}

	public void setAllCount(Integer allCount) {
		this.allCount = allCount;
		if(this.allCount % this.pageSize > 0){this.pageCount = (this.allCount/this.pageSize)+1;}else{this.pageCount = this.allCount/this.pageSize;};
		
	}

	
}
