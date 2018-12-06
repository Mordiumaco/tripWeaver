<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<a href="javascript:memberListAll(1)" class="ov_listall">전체목록</a>

<span class="btn_ov01"><span class="ov_txt">총회원수 </span> <span class="ov_num"> ${memberCnt}명 </span></span>

<div id="author4" class="btn_ov01 cursor"> <span class="ov_txt">블랙리스트 </span> <span class="ov_num">${authCnt}명</span></div>

<div class="btn_ov01">
	<span class="ov_txt">탈퇴 </span> <span class="ov_num">${delCnt}명</span>
</div>