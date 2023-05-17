<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="pageTitle" value="Join" />
<%@ include file="../common/head.jsp" %>

	<script>
	
		let validLoginID = '';
	
		function check(form) {
			
			if(form.loginID.value.trim().length == 0) {
				alert('로그인 아이디를 입력해주세요');
				form.loginID.focus();
				return;
			}
			
			if(form.loginID.value.trim() != validLoginID) {
				alert(form.loginID.value.trim() + '은(는) 이미 사용중인 아이디입니다');
				form.loginID.value = '';
				form.loginID.focus();
				return;
			}
			
			if(form.loginPW.value.trim().length == 0) {
				alert('로그인 비밀번호를 입력해주세요');
				form.loginPW.focus();
				return;
			}
			if(form.loginPWCheck.value.trim().length == 0) {
				alert('로그인 비밀번호 확인을 입력해주세요');
				form.loginPWCheck.focus();
				return;
			}
			
			if(form.loginPW.value.trim() != form.loginPWCheck.value.trim()) {
				alert('비밀번호가 일치하지 않습니다.');
				form.loginPW.value = '';
				form.loginPWCheck.value = '';
				form.loginPW.focus();
				return;
			}
			
			if(form.name.value.trim().length == 0) {
				alert('로그인 이름을 입력해주세요');
				form.name.focus();
				return;
			}
			if(form.nickname.value.trim().length == 0) {
				alert('로그인 닉네임을 입력해주세요');
				form.nickname.focus();
				return;
			}
			if(form.cellphoneNum.value.trim().length == 0) {
				alert('로그인 전화번호를 입력해주세요');
				form.cellphoneNum.focus();
				return;
			}
			if(form.email.value.trim().length == 0) {
				alert('로그인 이메일을 입력해주세요');
				form.email.focus();
				return;
			}
			form.submit();
		}
	
		function loginIDDupCheck() {
			
			$('#loginIDDupCheckMsg').empty();
			
			var loginID = $('#loginID').val().trim();
			
			if (loginID.length == 0) {
				$('#loginIDDupCheckMsg').removeClass('text-green-800');
				$('#loginIDDupCheckMsg').addClass('text-red-500');
				$('#loginIDDupCheckMsg').html('아이디는 필수 입력 정보입니다.');
				return;
			}
			
			$.get('checkLoginID', {
				loginID : loginID
			}, function(data) {
				console.log(data);
				if(data.fail) {
					$('#loginIDDupCheckMsg').removeClass('text-green-800');
					$('#loginIDDupCheckMsg').addClass('text-red-500');
					$('#loginIDDupCheckMsg').html(data.msg);
					validLoginID = '';
				}
				if(data.success) {
					$('#loginIDDupCheckMsg').removeClass('text-red-500');
					$('#loginIDDupCheckMsg').addClass('text-green-500');
					$('#loginIDDupCheckMsg').html(data.msg);
					validLoginID = data.data1;
				}
			}, 'json');
		}
	</script>
	
	
	<section class="mt-8 text-xl">
		<div class="container mx-auto px-3">
			<form action="doJoin" onsubmit="check(this); return false;">
				<div class="table-box-type-1 overflow-x-auto">
					<table border="1" class="mx-auto able w-full">
						<tr height="110">
							<th align="right">아이디</th>
							<td>
								<div>
									<input onfocusout="loginIDDupCheck()"class="input input-bordered input-warning w-full" 
									type="text" name="loginID" id="loginID" placeholder="아이디를 입력해주세요" autocomplete="on"/>
									<div id="loginIDDupCheckMsg" class="text-xs mt-1 text-red-500 h-5"></div>
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