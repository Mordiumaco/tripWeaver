package kr.co.tripweaver.member.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.tripweaver.member.dao.IMemberDao;

@Service
public class MemberService implements IMemberService {

	@Autowired
	IMemberDao memberDao;
	
}
