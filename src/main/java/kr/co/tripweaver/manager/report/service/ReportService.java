package kr.co.tripweaver.manager.report.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.tripweaver.manager.report.dao.IReportDao;

@Service
public class ReportService implements IReportService {

	@Autowired
	IReportDao reportDao;
	
}
