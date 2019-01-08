<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../head.jsp" %> 

<link rel="stylesheet" href="/css/style.css">

<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> 

<script type="text/javascript">

/* tr 페이지 선택 이동*/

var getParam = function(key){
     var _parammap = {};
     document.location.search.replace(/\??(?:([^=]+)=([^&]*)&?)/g, function () {
         function decode(s) {
             return decodeURIComponent(s.split("+").join(" "));
         }
         _parammap[decode(arguments[1])] = decode(arguments[2]);
     });
     return _parammap[key];
};



$(document).ready(function(){
	$(".board_listF").on("click", ".postsClick", function(){
		if($(this).children().eq(1).text() == '삭제된 게시글입니다.'){
			alert("해당 글은 삭제된 게시글 입니다.");
			return;
		}
		
		var postsId = $(this).children()[4].innerHTML;
// 		$("#postsId").val(postsId);
		$("#art_id").val(postsId);
		$("#frm").submit();
	});
	
	//getAjaxList(1, 'po_subject', '');

});

function searchFt(page) {
	var search_key = $("#search_key").val();
	var search_value = $("#search_value").val();
	
	getAjaxList(page, search_key, search_value);
}

/* function getAjaxList(page, search_key, search_value) {
	var pageSize = 10;
	var pageId = getParam("pageId");

	$.ajax({
		url : "/board/ajaxList",
		type : "get",
		data : "pageId="+ pageId +"&page="+page+"&pageSize="+pageSize+"&search_key="+search_key+"&search_value="+search_value,
		success : function(dt){
			$(".board_listF").html(dt);
		}
	});
	
	$.ajax({
		url : "/board/ajaxPagenation",
		type : "get",
		data : "pageId="+ pageId +"&page="+page+"&pageSize="+pageSize+"&search_key="+search_key+"&search_value="+search_value,
		success : function(dt){
			$(".pg").html(dt);
		}
	});
}	 */


// 선택체크

function fboardlist_submit(f) {
    var chk_count = 0;

    for (var i=0; i<f.length; i++) {
        if (f.elements[i].name == "chk_wr_id[]" && f.elements[i].checked)
            chk_count++;
    }

    if (!chk_count) {
        alert(document.pressed + "할 게시물을 하나 이상 선택하세요.");
        return false;
    }

    if(document.pressed == "선택삭제") {
        if (!confirm("선택한 게시물을 정말 삭제하시겠습니까?\n\n한번 삭제한 자료는 복구할 수 없습니다\n\n답변글이 있는 게시글을 선택하신 경우\n답변글도 선택하셔야 게시글이 삭제됩니다."))
            return false;

        f.removeAttribute("target");
        f.action = "./board_list_update.php";
    }

    return true;
}



</script>



<%-- 뷰페이지에 게시글 아이디 넘기기 --%>
<form action="/article/articleDetail" method="get" id="frm" >
	<input type="hidden" id="art_id" name="art_id"/>
	
	
	
<!-- 	<input type="text" id="postsId" name="postsId"/> -->
</form>

<div class="main_con" id="main_con">

<div id="container">
	<c:forEach items="${menuList}" var="nt">
		<c:choose>
			<c:when test="${nt.board_id == param.pageId}">
				<h2 class="board_top">${nt.nt_name}</h2>
			</c:when>
		</c:choose>
	</c:forEach>
	<h2 class="board_top">${boardVo.board_title}</h2>
	<div class="board_top_sub">
		<ul class="bt_left">
			<li>Total&nbsp;&nbsp;<b>${totalArticleCnt}</b>&nbsp; 건 </li>
			<li>&nbsp;&nbsp;<b>${pageCnt}</b> &nbsp;페이지</li>
		</ul>
		<ul class="bt_right">
			<c:choose>
				<c:when test="${loginInfo.mem_author eq 0}">
					<li><button class="btn_bd col_01" type="submit" onclick="location.href='/article/articleView?board_id=${board_id}'"><i class="far fa-edit"></i>&nbsp; 글쓰기</button></li>
				</c:when>
				<c:when test="${loginInfo.mem_author eq 1 && board_id != 'bd00001'}">
					<li><button class="btn_bd col_01" type="submit" onclick="location.href='/article/articleView?board_id=${board_id}'"><i class="far fa-edit"></i>&nbsp; 글쓰기</button></li>
				</c:when>
				<c:when test="${loginInfo.mem_author eq 2 && board_id != 'bd00001'}">
					<li><button class="btn_bd col_01" type="submit" onclick="location.href='/article/articleView?board_id=${board_id}'"><i class="far fa-edit"></i>&nbsp; 글쓰기</button></li>
				</c:when>
			</c:choose>
		</ul>
	</div>
	
	<table class="board_list_wrap">
		<colgroup>
			<col width="10%">
			<col width="50%">
			<col width="20%">
			<col width="20%">
		</colgroup>
		
		<thead>
			<tr>
				<%-- <th><input type="checkbox" id="checkall" ></th> --%>
				<th>번호</th>
				<th>제목</th>
				<th>글쓴이</th>
				<th><a href="">날짜 <i class="fa fa-sort" aria-hidden="true"></i></a></th>
			</tr>
		</thead>
		
		<tbody class="board_listF">
<%-- 			<c:when test="${fn:length(articleList) == 0}"> --%>
<!-- 				<ul class="bt_left"> -->
<!-- 					<li>해당 조건에 게시물은 없습니다.</li> -->
<!-- 				</ul> -->
<%-- 			</c:when> --%>
		
			<c:forEach items="${articleList}" var="pv" varStatus="status"  >
				<c:choose >
					<c:when test="${pv.art_del != 'Y'}">
						<tr class="postsClick" style="cursor:pointer;" alt="${pv.art_title}">
							<td>${pv.rnum}</td>
							<td>${pv.art_title}</td>
							<td>${pv.mem_id}</td>
							<td><fmt:formatDate value="${pv.art_date}" pattern="yyyy-MM-dd"/></td>
							<td style=" display: none;">${pv.art_id}</td>
						</tr>
					</c:when>
					<c:otherwise>
						<tr>
							<td>${pv.art_id}</td>
							<td><span class="list_decoration">삭제된 글 입니다.</span></td>
							<td>${pv.userid}</td>
							<td><fmt:formatDate value="${pv.art_date}" pattern="yyyy-MM-dd"/></td>
						</tr>
					</c:otherwise>
				</c:choose>
				
				
			</c:forEach>
			
		</tbody>
		
	</table>
	
	<div class="board_tail">
		<form action="/article/articlePageList" method="get" >
			<ul class="bt_left">
				<li>
					<select name="search" id="search">
						<option value="art_title">제목</option>
						<option value="art_cnt">내용</option>
						<option value="mem_id">글쓴이</option>
					</select>
				</li>
				<li>
					<input type="text" id="searchWord" name="searchWord" value="" required="required"> 
					<input type="hidden" name="board_id" value="${board_id}"/>
				</li>
				<li>
					<button class="btn_bd col_04" type="submit"><i class="fa fa-search" aria-hidden="true"></i></button>
				</li>
			</ul>
		</form>
		<ul class="bt_right">
			<li><button class="btn_bd col_03" type="submit" onclick="location.href='/main/board?board_id=${board_id}&page=1&pageSize=10&search_key=art_title&search_value='">목록</button></li>
			<c:if test="${loginInfo.mem_author == 0 }">
				<li><button class="btn_bd col_01" type="submit" onclick="location.href='/article/articleView?board_id=${board_id}'"><i class="far fa-edit"></i>&nbsp; 글쓰기</button></li>
			</c:if>
		</ul>
		
	</div>

	<nav class="pg_wrap">
		<span class="pg">
		
			<c:set var="pageSize" value="10"/>
			
			
				<a class="pg_start pg_page" href="/main/board?board_id=${board_id}&page=1&pageSize=${pageSize}"></a>
				<c:choose>
					<c:when test="${param.page == 1}">
						<a class="pg_page pg_prev"></a>
					</c:when>
					<c:otherwise>
						<a class="pg_page pg_prev" href="/main/board?board_id=${board_id}&page=${param.page - 1}&pageSize=${pageSize}"></a>			
					</c:otherwise>
				</c:choose>
			
			<c:forEach var="pageWrap"  varStatus="status" begin="1" end="${pageCnt}">

				<c:choose>
					<c:when test="${status.index == param.page}"><a class="pg_current" href="/main/board?board_id=${board_id}&page=${status.index}&pageSize=${pageSize}">${status.index}</a></c:when>
					<c:otherwise><a class="pg_page" href="/main/board?board_id=${board_id}&page=${status.index}&pageSize=${pageSize}">${status.index}</a></c:otherwise>
				</c:choose>

			</c:forEach>
				
				
				<c:choose>
					<c:when test="${param.page == pageCnt}">
						<a class="pg_page pg_next"></a>
					</c:when>
					<c:otherwise>
						<a class="pg_page pg_next" href="/main/board?board_id=${board_id}&page=${param.page + 1}&pageSize=${pageSize}"></a>			
					</c:otherwise>
				</c:choose>
				<a class="pg_page pg_end" href="/main/board?board_id=${board_id}&page=${pageCnt}&pageSize=${pageSize}"></a>
			
		
			
			
		</span>
	</nav>
	
	
	
	<% /* tr 클릭시 페이지 이동  */ %>
	<form action="/articleDetail" method="get" id="frm2" >
		<input type="hidden" id="art_id" name="art_id"/>
	</form>

</div>
</div>

<%@include file="../tail.jsp" %> 