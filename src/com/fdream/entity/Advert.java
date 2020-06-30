package com.fdream.entity;
/**
 * 广告实体
 * @author quanmin
 *
 */
public class Advert {
	private String aid; //广告id
	private String aname;//广告名
	private String aimg;//广告图片
	private String aurl;//广告地址
	private String iconname;//图片名
	private String acreatedate;//广告创建时间
	
	public Advert() {
	}
	
	public String getIconname() {
		return iconname;
	}

	public void setIconname(String iconname) {
		this.iconname = iconname;
	}

	public String getAid() {
		return aid;
	}
	public void setAid(String aid) {
		this.aid = aid;
	}
	public String getAname() {
		return aname;
	}
	public void setAname(String aname) {
		this.aname = aname;
	}
	public String getAimg() {
		return aimg;
	}
	public void setAimg(String aimg) {
		this.aimg = aimg;
	}
	public String getAurl() {
		return aurl;
	}
	public void setAurl(String aurl) {
		this.aurl = aurl;
	}
	public String getAcreatedate() {
		return acreatedate;
	}
	public void setAcreatedate(String acreatedate) {
		this.acreatedate = acreatedate;
	}
	
}
