package com.fdream.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.fdream.entity.Sms;
import com.fdream.mapper.SmsMapper;
import com.fdream.service.ISmsService;
@Service  
@Transactional  //此处不再进行创建SqlSession和提交事务，都已交由spring去管理了。
public class SmsServiceImpl implements ISmsService {
	@Resource
	private SmsMapper smsDao;
	@Override
	public boolean save(Sms sms) {
		return smsDao.save(sms);
	}

	@Override
	public List<Sms> findList(String id) {
		return smsDao.findList(id);
	}

}
