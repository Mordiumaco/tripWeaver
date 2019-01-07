<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../adminHead.jsp" %>

<script type="text/javascript">

$(function() {
	getAjaxList('','','',1);
	
	$('.container_wr').on('click','.btn_submit', function() {
		var sfl1 = $('#sfl1').val();
		var sfl2 = $('#sfl2').val();
		var sfl3 = $('#sfl3').val();
		getAjaxList( sfl1 , sfl2, sfl3, '1');
	});
	
	$('.container_wr').on('click','.btn_ov_01', function() {
		getAjaxList( '' , '', '', 1);
	});
	
	$('.container_wr').on('click','.btn_ov_02', function() {
		getAjaxList( '' , '', 'Y', 1);
	});
	
	$('.container_wr').on('click','.btn_ov_03', function() {
		getAjaxList( '' , '', 'N', 1);
	});
	
	$('.tb_wrap').on('click','.btn_02', function (){
		var frm = $(this).parents('.bg0').find('.updateReport');
		$(frm).submit();
		
	});
	
	
	// 포스트 카드 클릭시 해당 포스트카드 내용을 가져오는 아작스 작동
	
	$('.tb_wrap').on('click','.postBtn', function() {
		var pc_id = $(this).text();
		postClickAjax(pc_id);
	})
	
	
})


function getAjaxList(filter_id, rep_rea_id, report_proc_sta, page) {
	var pageSize = 10;

	$.ajax({
		url : "/report/declarationAjax",
		type : "get",
		data : "filter_id="+filter_id+"&rep_rea_id="+rep_rea_id+"&report_proc_sta="+report_proc_sta+"&page="+page+"&pageSize="+pageSize,
		success : function(dt){
			$(".tb_wrap").html(dt);
		}
	});
}

function postClickAjax(pc_id) {
	
	$.ajax({
		url :"/report/reportPostClickAjax",
		type: "get" ,
		data : "pc_id="+pc_id,
		success : function(dt) {
			$(".layer_con").html(dt);
		}
	})
}


function layer_open1(el){

  var temp = $('#' + el);
  var bg = temp.prev().hasClass('bg');    //dimmed 레이어를 감지하기 위한 boolean 변수

  if(bg){
     $('.layer1').fadeIn();  //'bg' 클래스가 존재하면 레이어가 나타나고 배경은 dimmed 된다. 
  }else{
    
  }

  // 화면의 중앙에 레이어를 띄운다.
  if (temp.outerHeight() < $(document).height() ) temp.css('margin-top', '-'+temp.outerHeight()/2+'px');
  else temp.css('top', '0px');
  if (temp.outerWidth() < $(document).width() ) temp.css('margin-left', '-'+temp.outerWidth()/2+'px');
  else temp.css('left', '0px');

  temp.find('a.cbtn, a.close').click(function(e){
     if(bg){
        $('.layer1').fadeOut(); //'bg' 클래스가 존재하면 레이어를 사라지게 한다. 
     }else{
        temp.fadeOut();
     }
     e.preventDefault();
  });

  $('.bg, .close').click(function(e){ //배경을 클릭하면 레이어를 사라지게 하는 이벤트 핸들러
     $('.layer1').fadeOut();
     e.preventDefault();
  });
}

$(document).ready(function(){
	$('.layer_con_sub').on('click','.layer_con_subLi', function() {
		
		var index = $('.layer_con_sub .layer_con_subLi').index(this);
		
		if($(".layer_con_sub .layer_con_subLi:eq("+ index + ")").find("input[name='calendarSelection']").is("checked") == false){
			$(".layer_con_sub .layer_con_subLi:eq("+ index + ")").find("input[name='calendarSelection']").prop("checked", true); /* by ID */
		}
		
	});
});

// 체크박스 전체 선택용 스크립트
$( document ).ready( function() {
    $( '.tb_wrap' ).on('click','#chkall', function() {
      $( '.ab' ).prop( 'checked', this.checked );
    } );
  } );
  
// 선택한 체크박스만 작동 하기  
$(function() {
	$('.container_wr').on('click','.allbtn', function() {
	
		$("input:checkbox[name=chk]:checked").each(function(i,elements){
		    //해당 index(순서)값을 가져옵니다.
		    index = $(elements).index("input:checkbox[name=chk]"); 
		    var submitIndex = $('.post_id').eq(index).val();
		    var sub = submitIndex.substring(0, 2);
		    
 			if(sub == 'pc'){
 				postAllModifiedAjax(submitIndex, index);
		    }else{
		    	essayAllModifiedAjax(submitIndex, index);
		    }
		    
		});
	})
});

// 처리완료용 아작스
function postAllModifiedAjax(submitIndex, index) {
	
	$.ajax({
		url :"/report/updatePostReport",
		type: "post" ,
		data : "pc_id="+submitIndex,
		success : function(dt) {
			var text_id = $('mb_list_open').eq(index).text();
			$('mb_list_open').eq(index).html('text_id');
			$('.mb_list_mailr').eq(index).html('Y');
			$('.td_numsmall').eq(index).html('');
		}
	})
}

function essayAllModifiedAjax(submitIndex, index) {
	
	$.ajax({
		url :"/report/updateEssayReport",
		type: "post" ,
		data : "essay_id="+submitIndex,
		success : function(dt) {
			$('.td_numsmall').eq(index).html('');
		}
	})
}

</script>


<section>
	<div class="container_wr">
    
		<div class="local_ov01 local_ov">
		    <a class="ov_listall btn_ov_01">전체목록</a>
		    <span class="btn_ov01">
		    	<span class="ov_txt">신고 수 </span>
		    	<span class="ov_num"> ${selectRepostAll}명</span> 
		    </span>
		    
		    <a class="btn_ov01 btn_ov_02"> 
		    	<span class="ov_txt">완료 </span>
		    	<span class="ov_num">${selectRepostY}명</span>
		    </a>
		    
		    <a class="btn_ov01 btn_ov_03"> 
		    	<span class="ov_txt">미완료  </span>
		    	<span class="ov_num">${selectRepostN}명</span>
		    </a>
		</div>

		<form id="fsearch" name="fsearch" class="local_sch01 local_sch" method="get">
			<label for="sfl" class="sound_only">검색대상</label>
			<select name="filter_id" id="sfl1">
				<option value="">전체</option>
			    <option value="essay">에세이</option>
			    <option value="postcard">포스트</option>
			</select>
			<select name="rep_rea_id" id="sfl2">
				<option value="">전체</option>
			    <option value="0">음란물유포</option>
			    <option value="1">욕설</option>
			    <option value="2">도배</option>
			    <option value="3">폭력성 짙은 글</option>
			    <option value="4">기타</option>
			</select>
			<select name="report_proc_sta" id="sfl3">
				<option value="">전체</option>
			    <option value="N">처리 미완료</option>
			    <option value="Y">처리 완료</option>
			</select>
			<input type="button" class="btn_submit" value="검색">
		</form>

		<div class="local_desc01 local_desc">
		    <p>
				사용자가 신고한 게시글, 댓글 등을 관리합니다.
		    </p>
		</div>
		
		<div class="btn_fixed_top">
		    <input type="submit" name="act_button" value="선택수정" class="btn btn_02 allbtn">
		</div>
		
		<div class="tb_wrap">
			
		</div>
	
		<script>
			function fmemberlist_submit(f)
			{
			    if (!is_checked("chk[]")) {
			        alert(document.pressed+" 하실 항목을 하나 이상 선택하세요.");
			        return false;
			    }
			
			    if(document.pressed == "선택삭제") {
			        if(!confirm("선택한 자료를 정말 삭제하시겠습니까?")) {
			            return false;
			        }
			    }
			
			    return true;
			}
		</script>
	    <noscript>
	        <p>
	                        귀하께서 사용하시는 브라우저는 현재 <strong>자바스크립트를 사용하지 않음</strong>으로 설정되어 있습니다.<br>
	            <strong>자바스크립트를 사용하지 않음</strong>으로 설정하신 경우는 수정이나 삭제시 별도의 경고창이 나오지 않으므로 이점 주의하시기 바랍니다.
	        </p>
	    </noscript>
	</div>
</section>


<div class="layer1">
	    <div class="bg"></div>
	    <div id="layer_1" class="pop_layer postcard_pop_layer">
	       <div class="layer_con">
	       		
	       </div>
	    </div>   
	</div> 
 
<%@include file="../adminTail.jsp" %>