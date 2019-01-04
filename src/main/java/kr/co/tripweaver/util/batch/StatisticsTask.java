package kr.co.tripweaver.util.batch;

import javax.annotation.Resource;

import org.springframework.scheduling.annotation.Scheduled;

import kr.co.tripweaver.util.batch.dao.IStatisticsTaskDao;

public class StatisticsTask {
	
	@Resource(name="statisticsTaskDao")
	private IStatisticsTaskDao statisticsTaskDao;
	
	@Scheduled(cron = "0 0 3 * * ?") //아무요일 매월 매일 03:00:00
	public void connectionStatistics() {
		statisticsTaskDao.connectionStatistics();
	}
	
	@Scheduled(cron = "0 * * * * *") //매시 정각이 될때마다 (1시간마다)
	public void connectionTimeStatistics() {
		statisticsTaskDao.connectionTimeStatistics();
	}
	
}
