package com.fdream.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.fdream.entity.User;
import com.fdream.mapper.UserMapper;
import com.fdream.service.IUserService;

/**
 * 用户服务层接口实现
 * @author quanmin
 *
 */
@Service  
@Transactional  //此处不再进行创建SqlSession和提交事务，都已交由spring去管理了。
public class UserServiceImpl implements IUserService{

	@Resource
	private UserMapper userDao;
	/**
	 * 添加用户
	 */
	@Override
	public boolean save(User user) {
		return userDao.save(user);
	}
	
	/**
	 * 用户登录
	 * @param name
	 * @param password
	 * @return
	 */
	public User htlogin(String username,String password){
		return userDao.htlogin(username, password);
	}
	
	/**
	 * 用户登录
	 * @param name
	 * @param password
	 * @return
	 */
	public User qtlogin(String username,String password){
		return userDao.qtlogin(username, password);
	}
	/**
	 * 查找所有
	 * @return
	 */
	public List<User> findList(){
		return userDao.findList();
	}
	
	/**
	 * 更新
	 * @param user
	 * @return
	 * @throws Exception
	 */
	public boolean update(User user) throws Exception{
		return userDao.update(user);
	}
	
	/**
	 * 删除用户
	 * @param id
	 * @return
	 */
	public boolean delete(String id){
		return userDao.delete(id);
	}
	
	/**
	 * 通过id查找
	 * @param id
	 * @return
	 */
	public User findById(String id){
		return userDao.findById(id);
	}
	
	/**
	 * 查找所有
	 * @return
	 */
	public List<User> findListByTJ(String sex,String qx){
		return userDao.findListByTJ(sex, qx);
	}
	
	/**
	 * 被喜欢排行
	 * @return
	 */
	public List<User> findListTop(){
		return userDao.findListTop();
	}
}
