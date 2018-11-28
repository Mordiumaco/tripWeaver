package kr.co.tripweaver.manager.conn_stat.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.tripweaver.manager.conn_stat.dao.IConnStatDao;

@Service
public class ConnStatService {

	@Autowired
	IConnStatDao connStatDao;
	
}
