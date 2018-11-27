package kr.co.tripweaver.post.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.tripweaver.post.dao.IPostDao;

@Service
public class PostService implements IPostService {

	@Autowired
	IPostDao postDao;
	
}
