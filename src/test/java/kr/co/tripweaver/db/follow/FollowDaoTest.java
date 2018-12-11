package kr.co.tripweaver.db.follow;

import static org.junit.Assert.*;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import kr.co.tripweaver.mymenu.mypage.follow_following.dao.IFollowDao;
import kr.co.tripweaver.mymenu.mypage.follow_following.model.FollowVO;
import kr.co.tripweaver.test.ServiceDaoTestConfig;

public class FollowDaoTest extends ServiceDaoTestConfig {

	@Autowired
	private IFollowDao followDao;
	
	@Test
	public void selectFollowingCountTest() {
		/***Given***/
		String mem_id = "normal1";
		/***When***/
		int cnt = followDao.selectFollowingCount(mem_id);
		/***Then***/
		assertEquals(8, cnt);
	}

	@Test
	public void selectFollowerCount() {
		/***Given***/
		String mem_id = "normal1";
		/***When***/
		int cnt = followDao.selectFollowerCount(mem_id);
		/***Then***/
		assertEquals(4, cnt);
	}
	
	@Test
	public void insertFollowingTest() {
		/***Given***/
		FollowVO followVO = new FollowVO("test68", "test69");
		System.out.println("Insert followVO : " + followVO);
		/***When***/
		int cnt = followDao.insertFollowing(followVO);
		
		/***Then***/
		assertEquals(1, cnt);
	}
	
	@Test
	public void deleteFollowingTest() {
		/***Given***/
		FollowVO followVO = new FollowVO("guide2", "normal1");
		System.out.println("delete followVO : " + followVO);
		/***When***/
		int cnt = followDao.deleteFollowing(followVO);
		
		/***Then***/
		assertEquals(1, cnt);
	}
}
