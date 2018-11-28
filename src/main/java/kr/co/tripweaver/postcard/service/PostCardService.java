package kr.co.tripweaver.postcard.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.tripweaver.postcard.dao.IPostCardDao;

@Service
public class PostCardService implements IPostCardService{

	@Autowired
	IPostCardDao postCardDao;
	
}
