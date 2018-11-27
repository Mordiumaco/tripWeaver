package kr.co.tripweaver.manager.hashtag_stat.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.tripweaver.manager.hashtag_stat.dao.IHashStatDao;

@Service
public class HashStatService implements IHashStatService {
	
	@Autowired
	IHashStatDao hashStatDao;
	

}
