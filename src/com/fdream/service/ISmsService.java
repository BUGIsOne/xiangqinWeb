package com.fdream.service;

import java.util.List;

import com.fdream.entity.Sms;

public interface ISmsService {
	
	public boolean save(Sms sms);
	
	public List<Sms> findList(String id);
}
