package kr.co.tripweaver.manager.conn_stat.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.tripweaver.manager.conn_stat.dao.IConnStatDao;
import kr.co.tripweaver.manager.conn_stat.model.ConnStatVO;

@Service
public class ConnStatService implements IConnStatService {

	@Autowired
	IConnStatDao connStatDao;
	
	@Override
	public int insertConnInfo(ConnStatVO connStatVO) {
		int intCnt = connStatDao.insertConnInfo(connStatVO);
		return intCnt;
	}

	@Override
	public List<ConnStatVO> selectConnInfo(Map<String, Object> params) {
		List<ConnStatVO> connStatVOs = connStatDao.selectConnInfo(params);
		return connStatVOs;
	}
}
