package com.fdream.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.fdream.entity.Love;


/**
 * 广告持久层接口
 * @author quanmin
 *
 */
public interface LoveMapper {

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
	public List<Love> findIsLove(@Param("uid_a")String uid_a,@Param("uid_b")String uid_b);
}
