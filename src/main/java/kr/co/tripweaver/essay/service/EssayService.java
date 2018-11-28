package kr.co.tripweaver.essay.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.tripweaver.essay.dao.IEssayDao;

@Service
public class EssayService implements IEssayService{
	
	@Autowired
	IEssayDao essayDao;
	
}
