package com.fdream.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.fdream.entity.User;

/**
 * 用户持久层接口
 * @author quanmin
 *
 */
public interface UserMapper {

	/**
	 * 添加用户
	 * @param user
	 * @return boolean
	 */
	public boolean save(User user);
	
	/**
	 * 更新
	 * @param user
	 * @return
	 * @throws Exception
	 */
	public boolean update(User user) throws Exception;
	
	/**
	 * 用户登录
	 * @param name
	 * @param password
	 * @return
	 */
	public User htlogin(String username,String password);
	
	/**
	 * 用户登录
	 * @param name
	 * @param password
	 * @return
	 */
	public User qtlogin(String username,String password);
	
	/**
	 * 删除用户
	 * @param id
	 * @return
	 */
	public boolean delete(String id);
	
	/**
	 * 通过id查找
	 * @param id
	 * @return
	 */
	public User findById(String id);
	
	/**
	 * 查找所有
	 * @return
	 */
	public List<User> findList();
	
	/**
	 * 被喜欢排行
	 * @return
	 */
	public List<User> findListTop();
	
	/**
	 * 查找所有
	 * @return
	 */
	public List<User> findListByTJ(@Param("sex")String sex,@Param("qx")String qx);
}
