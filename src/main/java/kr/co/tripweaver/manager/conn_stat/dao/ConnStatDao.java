package kr.co.tripweaver.manager.conn_stat.dao;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import kr.co.tripweaver.manager.conn_stat.model.ConnStatVO;

@Repository
public class ConnStatDao implements IConnStatDao {

	@Resource(name = "sqlSessionTemplate")
	SqlSessionTemplate template;
	
	@Override
	public int insertConnInfo(ConnStatVO connStatVO) {
		int intCnt = template.insert("connInfoSQL.insertConnInfo", connStatVO);
		return intCnt;
	}

	@Override
	public List<ConnStatVO> selectConnInfo(Map<String, Object> params) {
		List<ConnStatVO> connStatVOs = template.selectList("connInfoSQL.selectConnInfo", params);
		return connStatVOs;
	}

}
