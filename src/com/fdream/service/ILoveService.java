package com.fdream.service;

import java.util.List;

import com.fdream.entity.Advert;
import com.fdream.entity.Love;

/**
 * 广告服务层接口
 * @author quanmin
 *
 */
public interface ILoveService {

	/**
	 * 添加分类
	 * @param user
	 * @return boolean
	 */
	public boolean save(Love love);
	
	/**
	 * 删除分类
	 * @param id
	 * @return
	 */
	public boolean delete(String id);
	
	/**
	 * 通过id查找
	 * @param id
	 * @return
	 */
	public Love findById(String id);
	
	/**
	 * 查找所有
	 * @return
	 */
	public List<Love> findList();
	
	/**
	 * 我喜欢的
	 * @return
	 */
	public List<Love>  findListBy_Uid(String uid);
	
	/**
	 * 查看是否喜欢
	 * @return
	 */
	public List<Love> findIsLove(String uid_a,String uid_b);
}
