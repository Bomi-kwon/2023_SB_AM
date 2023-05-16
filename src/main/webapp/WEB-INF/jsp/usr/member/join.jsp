<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="pageTitle" value="Join" />
<%@ include file="../common/head.jsp" %>

	<script>
		function loginIDDupCheck() {
			var loginID = $('#loginID').val();
			
			$.get('checkLoginID', {
				loginID : loginID
			}, function(data) {
				console.log(data);
				if(data.fail == true) {
					$('.loginIDDupCheckMsg').html(data.msg);
				}
				if(data.success == true) {
					$('.loginIDDupCheckMsg').html(data.msg);
				}
			}, 'json');
		}
	</script>
	

			
	
	<section class="mt-8 text-xl">
		<div class="container mx-auto px-3">
			<form action="doJoin" onsubmit="check(this); return false;">
				<div class="table-box-type-1 overflow-x-auto">
					<table border="1" class="mx-auto able w-full">
						<tr>
							<th align="right">아이디</th>
							<td>
								<div>
									<input onfocusout="loginIDDupCheck()"class="input input-bordered input-warning w-full" type="text" name="loginID" id="loginID" placeholder="아이디를 입력해주세요" autocomplete="on"/>
									<div class="loginIDDupCheckMsg sm:text-gray-50"></div>
								</div>
							</td>
						</tr>		
						<tr>
							<th align="right">비밀번호</th>
							<td><input class="input input-bordered input-warning w-full" type="password" name="loginPW" placeholder="비밀번호를 입력해주세요"/></td>
						</tr>
						<tr>
							<th align="right">비밀번호 확인</th>
							<td><input class="input input-bordered input-warning w-full" type="password" name="loginPWCheck" placeholder="비밀번호 확인을 입력해주세요"/></td>
						</tr>
						<tr>
							<th align="right">이름</th>
							<td><input class="input input-bordered input-warning w-full" type="text" name="name" placeholder="이름을 입력해주세요"/></td>
						</tr>
						<tr>
							<th align="right">닉네임</th>
							<td><input class="input input-bordered input-warning w-full" type="text" name="nickname" placeholder="닉네임을 입력해주세요"/></td>
						</tr>
						<tr>
							<th align="right">전화번호</th>
							<td><input class="input input-bordered input-warning w-full" type="text" name="cellphoneNum" placeholder="전화번호를 입력해주세요"/></td>
						</tr>
						<tr>
							<th align="right">이메일</th>
							<td><input class="input input-bordered input-warning w-full" type="text" name="email" placeholder="이메일을 입력해주세요"/></td>
						</tr>
						<!-- 
						<tr>
							<th align="right">사진</th>
							<td><input class="input input-bordered input-warning w-full" type="file" name="image"/></td>
						</tr>
						 -->
						<tr>
							<td colspan="2"><button class="btn btn-outline btn-warning">가입</button></td>
						</tr>
					</table>
				</div>
			</form>
		</div>
	</section>


<%@ include file="../common/foot.jsp" %>