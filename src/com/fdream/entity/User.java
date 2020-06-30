package com.fdream.entity;

/**
 * 用户实体
 * @author quanmin
 *
 */
public class User {

	//用户id
	private String uid;
	//头像
	private String img;
	//用户名
	private String uname;
	//姓名
	private String fullname;
	//密码
	private String password;
	//性别
	private String sex;
	//年龄
	private String age;
	//角色
	private String rid;
	//兴趣
	private String taste;
	//邮箱
	private String email;
	//电话号码
	private String phone;
	//地址
	private String address;
	//喜欢数
	private Integer lovenum;
	
	public User() {
	}

	public String getUid() {
		return uid;
	}

	public void setUid(String uid) {
		this.uid = uid;
	}

	public String getUname() {
		return uname;
	}

	public void setUname(String uname) {
		this.uname = uname;
	}

	public String getFullname() {
		return fullname;
	}

	public void setFullname(String fullname) {
		this.fullname = fullname;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getSex() {
		return sex;
	}

	public void setSex(String sex) {
		this.sex = sex;
	}

	public String getAge() {
		return age;
	}

	public void setAge(String age) {
		this.age = age;
	}

	public String getRid() {
		return rid;
	}

	public void setRid(String rid) {
		this.rid = rid;
	}

	public String getTaste() {
		return taste;
	}

	public void setTaste(String taste) {
		this.taste = taste;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getImg() {
		return img;
	}

	public void setImg(String img) {
		this.img = img;
	}

	public Integer getLovenum() {
		return lovenum;
	}

	public void setLovenum(Integer lovenum) {
		this.lovenum = lovenum;
	}
	
}
