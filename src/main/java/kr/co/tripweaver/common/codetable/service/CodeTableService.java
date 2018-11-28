package kr.co.tripweaver.common.codetable.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.tripweaver.common.codetable.dao.ICodeTableDao;

@Service
public class CodeTableService implements ICodeTableService {
	
	@Autowired
	ICodeTableDao codeTableDao;
	
}
