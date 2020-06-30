package com.fdream.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.fdream.entity.Advert;
import com.fdream.mapper.AdvertMapper;
import com.fdream.service.IAdvertService;

/**
 * 广告服务层接口实现
 * @author quanmin
 *
 */
@Service  
@Transactional  //此处不再进行创建SqlSession和提交事务，都已交由spring去管理了。
public class AdvertServiceImpl implements IAdvertService {

	@Resource
	private AdvertMapper advertDao;
	/**
	 * 添加
	 */
	@Override
	public boolean save(Advert advert) {
		return advertDao.save(advert);
	}

	/**
	 * 更新
	 */
	@Override
	public boolean update(Advert advert) throws Exception {
		return advertDao.update(advert);
	}

	/**
	 * 删除
	 */
	@Override
	public boolean delete(String id) {
		return advertDao.delete(id);
	}

	/**
	 * 通过id查找
	 */
	@Override
	public Advert findById(String id) {
		return advertDao.findById(id);
	}

	/**
	 * 查找所有
	 */
	@Override
	public List<Advert> findList() {
		return advertDao.findList();
	}

}
