package com.fdream.mapper;

import java.util.List;

import com.fdream.entity.Sms;

public interface SmsMapper {

	public boolean save(Sms sms);
	
	public List<Sms> findList(String id);
}
