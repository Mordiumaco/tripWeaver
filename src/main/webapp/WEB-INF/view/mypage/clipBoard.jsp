<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@include file="../head.jsp" %>

<script type="text/javascript">
	// 기본형식
	$(function(){
		$('.content li').hide();
		$('.content li#web1').show();
		$('.tab a').click(function(){
			$('.tab a').removeClass('select');
			//모든 a태그에 select 클래스 없애준다.
			$(this).addClass('select');
			//클릭한 a태그에 select 클래스 적용
			$('.content li').hide();//모든 내용을 안보이게 해줌
			$($(this).attr('href')).slideDown();
		});
	});

</script>


<div class="sub_container">
	<%@include file="myPageLeftMenu.jsp" %>
	
	<div class="mypage_right">
	
		<ul class="tab">
			<li><a href="#web1" class="select">Essay</a></li>
			<li><a href="#web2">PostCard</a></li>
		</ul>
		
		<ul class="content">
			<li id="web1">
				
					<h1 class="mypage_title">Essay 클립보드</h1>
					
				
					<form id="fsearch" name="fsearch" class="local_sch01 local_sch" method="get">
						<label for="sfl" class="sound_only">검색대상</label>
						<select name="sfl" id="sfl">
						    <option value="mb_nick">제목</option>
						    <option value="mb_nick">내용</option>
						    <option value="mb_nick">닉네임</option>
						</select>
						<label for="stx" class="sound_only">검색어<strong class="sound_only"> 필수</strong></label>
						<input type="text" name="stx" value="" id="stx" required="" class="required frm_input">
						<input type="submit" class="btn_submit" value="검색">
					</form>
					
					<br/>
					
					<div class="clipBoard_list">
						<ul>
							<li><img src="/img/p_04.jpg"></li>
							<li class="clipBoard_btn">
								<ul>
									<li><b>&#10084;</b></li>
									<li><i class="fa fa-commenting-o fa-commenting-o2" aria-hidden="true"></i></li>
									<li><i class="fa fa-share-alt fa-share-alt2" aria-hidden="true"></i></li>
									<li><img src="/img/icon/declaration.png"></li>
								</ul>
							</li>
							<li><b>&#10084; 좋아요 527개</b> <span>HIT <b>258</b></span> </li>
							<li>감성 힐링 경천여행</li>
							<li>2018. 01 .24</li>
							<li>
								내용을 먹여서 내용이 나오고 내용이 나와서 내용이 보이고 내용이 보여서 
							</li>
						</ul>
						
						<ul>
							<li><img src="/img/p_04.jpg"></li>
							<li class="clipBoard_btn">
								<ul>
									<li><b>&#10084;</b></li>
									<li><i class="fa fa-commenting-o fa-commenting-o2" aria-hidden="true"></i></li>
									<li><i class="fa fa-share-alt fa-share-alt2" aria-hidden="true"></i></li>
									<li><img src="/img/icon/declaration.png"></li>
								</ul>
							</li>
							<li><b>&#10084; 좋아요 527개</b> <span>HIT <b>258</b></span> </li>
							<li>감성 힐링 경천여행</li>
							<li>2018. 01 .24</li>
							<li>
								내용을 먹여서 내용이 나오고 내용이 나와서 내용이 보이고 내용이 보여서 
							</li>
						</ul>
						
						<ul>
							<li><img src="/img/p_04.jpg"></li>
							<li class="clipBoard_btn">
								<ul>
									<li><b>&#10084;</b></li>
									<li><i class="fa fa-commenting-o fa-commenting-o2" aria-hidden="true"></i></li>
									<li><i class="fa fa-share-alt fa-share-alt2" aria-hidden="true"></i></li>
									<li><img src="/img/icon/declaration.png"></li>
								</ul>
							</li>
							<li><b>&#10084; 좋아요 527개</b> <span>HIT <b>258</b></span> </li>
							<li>감성 힐링 경천여행</li>
							<li>2018. 01 .24</li>
							<li>
								내용을 먹여서 내용이 나오고 내용이 나와서 내용이 보이고 내용이 보여서 
							</li>
						</ul>
						
						<ul>
							<li><img src="/img/p_04.jpg"></li>
							<li class="clipBoard_btn">
								<ul>
									<li><b>&#10084;</b></li>
									<li><i class="fa fa-commenting-o fa-commenting-o2" aria-hidden="true"></i></li>
									<li><i class="fa fa-share-alt fa-share-alt2" aria-hidden="true"></i></li>
									<li><img src="/img/icon/declaration.png"></li>
								</ul>
							</li>
							<li><b>&#10084; 좋아요 527개</b> <span>HIT <b>258</b></span> </li>
							<li>감성 힐링 경천여행</li>
							<li>2018. 01 .24</li>
							<li>
								내용을 먹여서 내용이 나오고 내용이 나와서 내용이 보이고 내용이 보여서 
							</li>
						</ul>
						
						<ul>
							<li><img src="/img/p_04.jpg"></li>
							<li class="clipBoard_btn">
								<ul>
									<li><b>&#10084;</b></li>
									<li><i class="fa fa-commenting-o fa-commenting-o2" aria-hidden="true"></i></li>
									<li><i class="fa fa-share-alt fa-share-alt2" aria-hidden="true"></i></li>
									<li><img src="/img/icon/declaration.png"></li>
								</ul>
							</li>
							<li><b>&#10084; 좋아요 527개</b> <span>HIT <b>258</b></span> </li>
							<li>감성 힐링 경천여행</li>
							<li>2018. 01 .24</li>
							<li>
								내용을 먹여서 내용이 나오고 내용이 나와서 내용이 보이고 내용이 보여서 
							</li>
						</ul>
						
						<ul>
							<li><img src="/img/p_04.jpg"></li>
							<li class="clipBoard_btn">
								<ul>
									<li><b>&#10084;</b></li>
									<li><i class="fa fa-commenting-o fa-commenting-o2" aria-hidden="true"></i></li>
									<li><i class="fa fa-share-alt fa-share-alt2" aria-hidden="true"></i></li>
									<li><img src="/img/icon/declaration.png"></li>
								</ul>
							</li>
							<li><b>&#10084; 좋아요 527개</b> <span>HIT <b>258</b></span> </li>
							<li>감성 힐링 경천여행</li>
							<li>2018. 01 .24</li>
							<li>
								내용을 먹여서 내용이 나오고 내용이 나와서 내용이 보이고 내용이 보여서 
							</li>
						</ul>
					</div>
					
					<nav class="pg_wrap"><span class="pg">
						<span class="sound_only">열린</span>
							<strong class="pg_current">1</strong><span class="sound_only">페이지</span>
							<a href="" class="pg_page">2<span class="sound_only">페이지</span></a>
							<a href="" class="pg_page">3<span class="sound_only">페이지</span></a>
							<a href="" class="pg_page">4<span class="sound_only">페이지</span></a>
							<a href="" class="pg_page">5<span class="sound_only">페이지</span></a>
							<a href="" class="pg_page">6<span class="sound_only">페이지</span></a>
							<a href="" class="pg_page">7<span class="sound_only">페이지</span></a>
							<a href="" class="pg_page">8<span class="sound_only">페이지</span></a>
							<a href="" class="pg_page">9<span class="sound_only">페이지</span></a>
							<a href="" class="pg_page">10<span class="sound_only">페이지</span></a>
							<a href="" class="pg_page pg_next">다음</a>
							<a href="" class="pg_page pg_end">맨끝</a>
						</span>
					</nav>
					
			</li>
			<li id="web2">
				<h1 class="mypage_title">PostCard 클립보드</h1>
					
				
					<form id="fsearch" name="fsearch" class="local_sch01 local_sch" method="get">
						<label for="sfl" class="sound_only">검색대상</label>
						<select name="sfl" id="sfl">
						    <option value="mb_nick">제목</option>
						    <option value="mb_nick">내용</option>
						    <option value="mb_nick">닉네임</option>
						</select>
						<label for="stx" class="sound_only">검색어<strong class="sound_only"> 필수</strong></label>
						<input type="text" name="stx" value="" id="stx" required="" class="required frm_input">
						<input type="submit" class="btn_submit" value="검색">
					</form>
					
					<br/>
					
					<div class="clipBoard_list">
						<ul>
							<li><img src="/img/p_04.jpg"></li>
							<li class="clipBoard_btn clipBoard_btnP">
								<ul>
									<li><b>&#10084;</b> <span>좋아요 527개</span> </li>
									<li></li>
									<li></li>
									<li><img src="/img/icon/declaration.png"></li>
								</ul>
							</li>
							<li></li>
							<li>아이디</li>
							<li>2018. 01 .24</li>
							<li>
								내용을 먹여서 내용이 나오고 내용이 나와서 내용이 보이고 내용이 보여서 
							</li>
						</ul>
					
						
						
						
						
					</div>
					
					<nav class="pg_wrap"><span class="pg">
						<span class="sound_only">열린</span>
							<strong class="pg_current">1</strong><span class="sound_only">페이지</span>
							<a href="" class="pg_page">2<span class="sound_only">페이지</span></a>
							<a href="" class="pg_page">3<span class="sound_only">페이지</span></a>
							<a href="" class="pg_page">4<span class="sound_only">페이지</span></a>
							<a href="" class="pg_page">5<span class="sound_only">페이지</span></a>
							<a href="" class="pg_page">6<span class="sound_only">페이지</span></a>
							<a href="" class="pg_page">7<span class="sound_only">페이지</span></a>
							<a href="" class="pg_page">8<span class="sound_only">페이지</span></a>
							<a href="" class="pg_page">9<span class="sound_only">페이지</span></a>
							<a href="" class="pg_page">10<span class="sound_only">페이지</span></a>
							<a href="" class="pg_page pg_next">다음</a>
							<a href="" class="pg_page pg_end">맨끝</a>
						</span>
					</nav>
			</li>
			 
			
		</ul>
		
	</div>
</div>


<%@include file="../tail.jsp" %> 