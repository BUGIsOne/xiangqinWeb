package com.fdream.mapper;

import java.util.List;

import com.fdream.entity.Advert;


/**
 * 广告持久层接口
 * @author quanmin
 *
 */
public interface AdvertMapper {

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
