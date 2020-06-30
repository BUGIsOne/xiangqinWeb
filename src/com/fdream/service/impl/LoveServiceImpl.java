package com.fdream.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.fdream.entity.Love;
import com.fdream.mapper.LoveMapper;
import com.fdream.service.ILoveService;


/**
 * 广告服务层接口实现
 * @author quanmin
 *
 */
@Service  
@Transactional  //此处不再进行创建SqlSession和提交事务，都已交由spring去管理了。
public class LoveServiceImpl implements ILoveService {

	@Resource
	private LoveMapper loveDao;
	/**
	 * 添加
	 */
	@Override
	public boolean save(Love love) {
		return loveDao.save(love);
	}


	/**
	 * 删除
	 */
	@Override
	public boolean delete(String id) {
		return loveDao.delete(id);
	}

	/**
	 * 通过id查找
	 */
	@Override
	public Love findById(String id) {
		return loveDao.findById(id);
	}

	/**
	 * 查找所有
	 */
	@Override
	public List<Love> findList() {
		return loveDao.findList();
	}
	
	/**
	 * 我喜欢的
	 * @return
	 */
	public List<Love>  findListBy_Uid(String uid){
		return loveDao.findListBy_Uid(uid);
	}

	/**
	 * 查看是否喜欢
	 * @return
	 */
	public List<Love> findIsLove(String uid_a,String uid_b){
		return loveDao.findIsLove(uid_a,uid_b);
	}
}
