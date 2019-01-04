package kr.co.tripweaver.util.batch.dao;


import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class StatisticsTaskDao implements IStatisticsTaskDao {
	
	@Autowired
	private SqlSessionTemplate template;

	@Override
	public void connectionStatistics() {
		template.insert("batchSQL.batch_connStat");
	}

	@Override
	public void connectionTimeStatistics() {
		template.insert("batchSQL.batch_connTimeStat");
	}

}
