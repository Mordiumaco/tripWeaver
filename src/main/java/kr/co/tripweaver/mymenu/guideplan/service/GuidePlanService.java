package kr.co.tripweaver.mymenu.guideplan.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.tripweaver.mymenu.guideplan.dao.IGuidePlanDao;

@Service
public class GuidePlanService implements IGuidePlanService {

	@Autowired
	IGuidePlanDao guidePlanDao;
	
}
