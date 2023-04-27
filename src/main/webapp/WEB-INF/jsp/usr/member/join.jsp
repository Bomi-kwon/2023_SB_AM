<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="pageTitle" value="Join" />
<%@ include file="../common/head.jsp" %>

	<script type="text/javascript">
		function check(form) {
			
			if (form.loginID.value.trim().length == 0) {
				alert('아이디를 입력하세요');
				form.loginID.focus();
				return;
			}
			else if (form.loginPW.value.trim().length == 0) {
				alert('비밀번호를 입력하세요');
				form.loginPW.focus();
				return;
			}
			else if (form.loginPWCheck.value.trim().length == 0) {
				alert('비밀번호 확인을 입력하세요');
				form.loginPWCheck.focus();
				return;
			}
			else if(form.name.value.trim().length == 0) {
				alert('이름을 입력하세요.');
				form.name.focus();
				return;
			}
			else if(form.nickname.value.trim().length == 0) {
				alert('닉네임을 입력하세요.');
				form.nickname.focus();
				return;
			}
			else if(form.cellphoneNum.value.trim().length == 0) {
				alert('전화번호를 입력하세요.');
				form.cellphoneNum.focus();
				return;
			}
			else if(form.email.value.trim().length == 0) {
				alert('이메일을 입력하세요.');
				form.email.focus();
				return;
			}
			else if(form.loginPW.value != form.loginPWCheck.value) {
				alert('비밀번호가 일치하지 않습니다.');
				form.loginPW.value = null;
				form.loginPWCheck.value = null;
				form.loginPW.focus();
				return;
			}
			else {
				form.submit();
			}
		}
	</script>
	
	
	<section class="mt-8 text-xl">
		<div class="container mx-auto px-3">
			<form action="doJoin" onsubmit="check(this); return false;">
				<div class="table-box-type-1 overflow-x-auto">
					<table border="1" class="mx-auto able w-full">
						<tr>
							<th align="right">아이디</th>
							<td><input class="input input-bordered input-warning w-full max-w-xs" type="text" name="loginID" placeholder="아이디를 입력해주세요" autocomplete="on"/>
						</tr>		
						<tr>
							<th align="right">비밀번호</th>
							<td><input class="input input-bordered input-warning w-full max-w-xs" type="password" name="loginPW" placeholder="비밀번호를 입력해주세요"/></td>
						</tr>
						<tr>
							<th align="right">비밀번호 확인</th>
							<td><input class="input input-bordered input-warning w-full max-w-xs" type="password" name="loginPWCheck" placeholder="비밀번호 확인을 입력해주세요"/></td>
						</tr>
						<tr>
							<th align="right">이름</th>
							<td><input class="input input-bordered input-warning w-full max-w-xs" type="text" name="name" placeholder="이름을 입력해주세요"/></td>
						</tr>
						<tr>
							<th align="right">닉네임</th>
							<td><input class="input input-bordered input-warning w-full max-w-xs" type="text" name="nickname" placeholder="닉네임을 입력해주세요"/></td>
						</tr>
						<tr>
							<th align="right">전화번호</th>
							<td><input class="input input-bordered input-warning w-full max-w-xs" type="text" name="cellphoneNum" placeholder="전화번호를 입력해주세요"/></td>
						</tr>
						<tr>
							<th align="right">이메일</th>
							<td><input class="input input-bordered input-warning w-full max-w-xs" type="text" name="email" placeholder="이메일을 입력해주세요"/></td>
						</tr>
						<tr>
							<td colspan="2"><button class="btn btn-outline btn-warning">가입</button></td>
						</tr>
					</table>
				</div>
			</form>
		</div>
	</section>


<%@ include file="../common/foot.jsp" %>