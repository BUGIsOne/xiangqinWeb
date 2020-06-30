package com.fdream.service;

import java.util.List;

import com.fdream.entity.Advert;

/**
 * 广告服务层接口
 * @author quanmin
 *
 */
public interface IAdvertService {

	/**
	 * 添加分类
	 * @param user
	 * @return boolean
	 */
	public boolean save(Advert advert);
	
	/**
	 * 更新
	 * @param type
	 * @return
	 * @throws Exception
	 */
	public boolean update(Advert advert) throws Exception;
	
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
	public Advert findById(String id);
	
	/**
	 * 查找所有
	 * @return
	 */
	public List<Advert> findList();
}
