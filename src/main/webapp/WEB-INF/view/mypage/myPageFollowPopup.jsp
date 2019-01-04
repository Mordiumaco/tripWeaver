<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<style>
.cursor {
	cursor: pointer;
}
</style>

<c:choose>
	<c:when test="${ess_writer_id eq loginInfo.mem_id}">
		<c:choose>
			<c:when test="${fn:length(followList) > 0}">
				<c:choose>
					<c:when test="${follow eq 'following'}">
						<c:forEach items="${followList}" var="follow">
							<li class="mes_f_list ${follow.mem_id} mypage_follow_li">
								<div class="mypage_follow_profile">
									<b class="my_profile my_profile2"><img
										src="/file/read?mem_profile=${follow.mem_profile}"></b>
								</div>
								<ul>
									<li>${follow.mem_nick}</li>
									<li>${follow.mem_id}</li>
									<li><a class="cursor"
										onclick="window.open('/message/selectMessage11?login_id=${loginInfo.mem_id}&mem_id=${follow.mem_id}','window_name','width=417,height=500,location=no,status=no,scrollbars=yes');">메세지</a>
										<input type="hidden" value="${follow.mem_id}"> <input
										type="button" class="following followBtn" value="팔로잉"></li>
								</ul>
							</li>
						</c:forEach>
					</c:when>
					<c:otherwise>
						<c:forEach items="${followList}" var="follower">
							<c:set var="fol_state" value="" />
							<c:forEach items="${followVOs}" var="fol">
								<c:if test="${fol.mem_id2 == follower.mem_id}">
									<c:set var="fol_state" value="${fol.fol_state}" />
								</c:if>
							</c:forEach>
							<li class="mes_f_list ${follower.mem_id} mypage_follow_li">
								<div class="mypage_follow_profile">
									<b class="my_profile my_profile2"><img
										src="/file/read?mem_profile=${follower.mem_profile}"></b>
								</div>
								<ul>
									<li>${follower.mem_nick}</li>
									<li>${follower.mem_id}</li>
									<li><a class="cursor"
										onclick="window.open('/message/selectMessage11?login_id=${loginInfo.mem_id}&mem_id=${follower.mem_id}','window_name','width=417,height=500,location=no,status=no,scrollbars=yes');">메세지</a>
										<input type="hidden" value="${follower.mem_id}"> <c:choose>
											<c:when test="${fol_state == 0}">
												<input type="button" class="follower followBtn" value="팔로우">
											</c:when>
											<c:otherwise>
												<input type="button" class="following followBtn" value="팔로잉">
											</c:otherwise>
										</c:choose></li>
								</ul>
							</li>
						</c:forEach>
					</c:otherwise>
				</c:choose>
			</c:when>
			<c:otherwise>
				<il>
				<p>조회된 리스트가 없습니다.</p>
				</il>
			</c:otherwise>
		</c:choose>
	</c:when>




	<c:otherwise>
		<c:choose>
			<c:when test="${fn:length(followList) > 0}">
				<c:choose>
					<c:when test="${follow eq 'following'}">
						<c:forEach items="${followList}" var="follow">
							<c:set var="fol_state" value="false" />
							<c:forEach items="${followVOs}" var="fol">
								<c:if test="${fol.mem_id eq follow.mem_id}">
									<c:set var="fol_state" value="true" />
								</c:if>
							</c:forEach>
							<li class="mes_f_list ${follow.mem_id} mypage_follow_li">
								<div class="mypage_follow_profile">
									<b class="my_profile my_profile2"><img
										src="/file/read?mem_profile=${follow.mem_profile}"></b>
								</div>
								<ul>
									<li>${follow.mem_nick}</li>
									<li>${follow.mem_id}</li>
									<li>
										<c:if test="${loginInfo.mem_id ne follow.mem_id}">
											<a class="cursor" onclick="window.open('/message/selectMessage11?login_id=${loginInfo.mem_id}&mem_id=${follow.mem_id}','window_name','width=417,height=500,location=no,status=no,scrollbars=yes');">메세지</a>
													<input type="hidden" value="${follow.mem_id}">
											<c:choose>
												<c:when test="${fol_state}">
													<input type="button" class="following followBtn" value="팔로잉">
												</c:when>
												<c:otherwise>
													<input type="button" class="follower followBtn" value="팔로우">
												</c:otherwise>
											</c:choose>
										</c:if>
									</li>
								</ul>
							</li>
						</c:forEach>
					</c:when>
					<c:otherwise>
						<c:forEach items="${followList}" var="follower">
							<c:set var="fol_state" value="false" />
							<c:forEach items="${followVOs}" var="fol">
								<c:if test="${fol.mem_id eq follower.mem_id}">
									<c:set var="fol_state" value="true" />
								</c:if>
							</c:forEach>
							<li class="mes_f_list ${follower.mem_id} mypage_follow_li">
								<div class="mypage_follow_profile">
									<b class="my_profile my_profile2"><img
										src="/file/read?mem_profile=${follower.mem_profile}"></b>
								</div>
								<ul>
									<li>${follower.mem_nick}</li>
									<li>${follower.mem_id}</li>
									<li>
										<c:if test="${loginInfo.mem_id ne follower.mem_id}">
											<a class="cursor" onclick="window.open('/message/selectMessage11?login_id=${loginInfo.mem_id}&mem_id=${follower.mem_id}','window_name','width=417,height=500,location=no,status=no,scrollbars=yes');">메세지</a>
													<input type="hidden" value="${follower.mem_id}"> 
											<c:choose>
												<c:when test="${fol_state}">
													<input type="button" class="following followBtn" value="팔로잉">
												</c:when>
												<c:otherwise>
													<input type="button" class="follower followBtn" value="팔로우">
												</c:otherwise>
											</c:choose>
										</c:if>
									</li>
								</ul>
							</li>
						</c:forEach>
					</c:otherwise>
				</c:choose>
			</c:when>
			<c:otherwise>
				<il>
				<p>조회된 리스트가 없습니다.</p>
				</il>
			</c:otherwise>
		</c:choose>
	</c:otherwise>
</c:choose>

<script>
	$('.followBtn').on({
		click : function() {
			console.log("클릭에는 들어옴1");
			var follow;
			console.log("클릭에는 들어옴2");
			var following_id = '${loginInfo.mem_id}';
			console.log("클릭에는 들어옴3");
			var followed_id = $(this).prev().val();
			console.log("클릭에는 들어옴4 : " + followed_id);
			var selectMembers = $('.' + followed_id);
			console.log("클릭에는 들어옴5");
			if ($(this).hasClass('following') == true) {
			console.log("클릭에는 들어옴5-1");
				$.each(selectMembers, function(idx, obj) { //obj = $(selectMembers[idx])
					var btn = $(obj).find('.followBtn');
					btn.val("팔로우");
					btn.addClass("follower");
					btn.removeClass("following");
				});
				follow = 'N';
				unfollow(following_id, followed_id);
			} else {
			console.log("클릭에는 들어옴5-2");
				$.each(selectMembers, function(idx, obj) { //obj = $(selectMembers[idx])
					var btn = $(obj).find('.followBtn');
					btn.val("팔로잉");
					btn.addClass("following");
					btn.removeClass("follower");
				});
				follow = 'Y';
				following(following_id, followed_id)
			}
		},
		mouseenter : function() {
			$(this).css({
				'background-color' : '#389e7d',
				"color" : "white"
			});
			if ($(this).hasClass('following') == true) {
				$(this).val("언팔로우");
			}
		},
		mouseleave : function() {
			$(this).css({
				'background-color' : 'transparent',
				"color" : "black"
			});
			if ($(this).hasClass('following') == true) {
				$(this).val("팔로잉");
			}
		}
	});

	function following(following_id, followed_id) {
		$.ajax({
			url : "/follow/following",
			type : "post",
			data : {
				"mem_id2" : following_id,
				"mem_id" : followed_id
			},
			success : function() {
				console.log("follow");
				follow_count(following_id);
			}
		});
	}

	function unfollow(following_id, followed_id) {
		$.ajax({
			url : "/follow/unfollow",
			type : "post",
			data : {
				"mem_id2" : following_id,
				"mem_id" : followed_id
			},
			success : function() {
				console.log("unfollow");
				follow_count(following_id);
			}
		});
	}
</script>