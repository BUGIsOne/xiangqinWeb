package com.fdream.util;
/**
 * 带参数的分页类
 * @author quanmin
 *
 */
public class PageUtil {
	private int startRow; //开始
	private int pageSize; //页面大小
	private int currentPage; 
	private int totalPage;
	private int totalRows;
	private String queryCondition;

	public int getStartRow() {
		return this.startRow;
	}

	public void setStartRow(int startRow) {
		this.startRow = startRow;
	}

	public int getPageSize() {
		return this.pageSize;
	}

	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}

	public int getCurrentPage() {
		return this.currentPage;
	}

	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}

	public int getTotalPage() {
		return this.totalPage;
	}

	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}

	public int getTotalRows() {
		return this.totalRows;
	}

	public void setTotalRows(int totalRows) {
		this.totalRows = totalRows;
	}

	public String getQueryCondition() {
		return this.queryCondition;
	}

	public void setQueryCondition(String queryCondition) {
		this.queryCondition = queryCondition;
	}
	
	 /**
     * 根据当前页获取开始行
     * @param currentPage
     * @param pageSize
     * @return
     */
    
    public static int getStartRowBycurrentPage(int currentPage,int pageSize){
        
        int startRow=0;
        
        if (currentPage==1) {
            
            return startRow=0;
        }
        
        startRow=(currentPage-1)*pageSize;
        
        return startRow;
        
    }
}
