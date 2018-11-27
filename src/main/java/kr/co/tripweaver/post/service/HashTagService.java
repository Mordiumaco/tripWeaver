package kr.co.tripweaver.post.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.tripweaver.post.dao.IHashTagDao;

@Service
public class HashTagService implements IHashTagService {
	
	@Autowired
	IHashTagDao hashTagDao;
	
}
