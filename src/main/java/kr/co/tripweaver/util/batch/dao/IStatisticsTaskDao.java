package kr.co.tripweaver.util.batch.dao;

public interface IStatisticsTaskDao {

	//매일 지정시간 배치동작
	
	//접속자 통계, 브라우저/접속기기/유입경로/운영체제
	public void connectionStatistics();
	
	//접속시간별 통계
	public void connectionTimeStatistics();
}
