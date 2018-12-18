<%@include file="../head.jsp" %> 

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<link rel="stylesheet" href="/css/style.css">

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
		var postsId = $(this).children()[0].innerHTML;
		$("#postsId").val(postsId);
		$("#frm").submit();
	});
	
	getAjaxList(1, 'po_subject', '');

});

function searchFt(page) {
	var search_key = $("#search_key").val();
	var search_value = $("#search_value").val();
	
	getAjaxList(page, search_key, search_value);
}

function getAjaxList(page, search_key, search_value) {
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
}	


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
<form action="/board/detailBoard" method="get" id="frm" >
	<input type="hidden" id="postsId" name="postsId"/>
</form>

<div class="main_con" id="main_con">

<div id="container">
	<c:forEach items="${menuList}" var="nt">
		<c:choose>
			<c:when test="${nt.nt_id == param.pageId}">
				<h2 class="board_top">${nt.nt_name}</h2>
			</c:when>
		</c:choose>
	</c:forEach>
	
	<div class="board_top_sub">
		<ul class="bt_left">
			<li>Total&nbsp;&nbsp;<b>${totalPostsCnt}</b>&nbsp; 건 </li>
			<li>&nbsp;&nbsp;<b>${pageCnt}</b> &nbsp;페이지</li>
		</ul>
		<ul class="bt_right">
			<li><button class="btn_bd col_01" type="submit" onclick="location.href='/main/boardWrite?board_id=${board_id}'"><i class="fa fa-pencil" aria-hidden="true"></i>&nbsp; 글쓰기</button></li>
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
			<c:forEach items="${postsList}" var="pv" varStatus="status"  >
				<c:choose >
					<c:when test="${pv.po_delete != 'Y'}">
						<tr class="postsClick">
							<td>${pv.po_id}</td>
							<td>${pv.lp_subject}</td>
							<td>${pv.userid}</td>
							<td><fmt:formatDate value="${pv.po_date}" pattern="yyyy-MM-dd"/></td>
						</tr>
					</c:when>
					<c:otherwise>
						<tr>
							<td>${pv.po_id}</td>
							<td><span class="list_decoration">삭제된 글 입니다.</span></td>
							<td>${pv.userid}</td>
							<td><fmt:formatDate value="${pv.po_date}" pattern="yyyy-MM-dd"/></td>
						</tr>
					</c:otherwise>
				</c:choose>
				
				
			</c:forEach>
			
		</tbody>
		
	</table>
	
	<div class="board_tail">
		<form action="javascript:searchFt(1);" method="get" >
			<ul class="bt_left">
				<li>
					<select name="search_key" id="search_key">
						<option value="po_subject">제목</option>
						<option value="po_contents">내용</option>
						<option value="userid">회원아이디</option>
					</select>
				</li>
				<li>
					<input type="text" id="search_value" name="search_value" value="" required="required"> 
				</li>
				<li>
					<button class="btn_bd col_04" type="submit"><i class="fa fa-search" aria-hidden="true"></i></button>
				</li>
			</ul>
		</form>
		<ul class="bt_right">
			<li><button class="btn_bd col_03" type="submit" onclick="location.href='/board/boardList?pageId=${nt_id}&page=1&pageSize=10&search_key=po_subject&search_value='">목록</button></li>
			<li><button class="btn_bd col_01" type="submit" onclick="location.href='/main/boardWrite?board_id=${board_id}'"><i class="fa fa-pencil" aria-hidden="true"></i>&nbsp; 글쓰기</button></li>
		</ul>
		
	</div>

	<nav class="pg_wrap">
		<span class="pg">
			<%-- 
			<c:set var="pageSize" value="10"/>
			
			
			<c:if test="${param.page != 1}">
				<a class="pg_page pg_start" href="/board/boardList?pageId=${nt_id}&page=1&pageSize=${pageSize}"></a>
				<a class="pg_page pg_prev" href="/board/boardList?pageId=${nt_id}&page=${param.page - 1}&pageSize=${pageSize}"></a>			
			</c:if>
			
			<c:forEach var="pageWrap"  varStatus="status" begin="1" end="${pageCnt}">

				<c:choose>
					<c:when test="${status.index == param.page}"><a class="pg_current" href="/board/boardList?pageId=${nt_id}&page=${status.index}&pageSize=${pageSize}">${status.index}</a></c:when>
					<c:otherwise><a class="pg_page" href="/board/boardList?pageId=${nt_id}&page=${status.index}&pageSize=${pageSize}">${status.index}</a></c:otherwise>
				</c:choose>

			</c:forEach>
			
			<c:if test="${pageCnt > param.page}">
				<a class="pg_page pg_next" href="/board/boardList?pageId=${nt_id}&page=${param.page + 1}&pageSize=${pageSize}"></a>
				<a class="pg_page pg_end" href="/board/boardList?pageId=${nt_id}&page=${pageCnt}&pageSize=${pageSize}"></a>
			</c:if>
			
			--%>
			
			
		</span>
	</nav>
	
	
	
	<% /* tr 클릭시 페이지 이동  */ %>
	<form action="/userDetail" method="get" id="frm" >
		<input type="hidden" id="userId" name="userId"/>
	</form>

</div>
</div>

<%@include file="../tail.jsp" %> 