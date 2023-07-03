<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="pageTitle" value="Login" />
<%@ include file="../common/head.jsp" %>

	<script type="text/javascript">
		function logincheck(form) {
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
			else {
				form.submit();
			}
		}
	</script>

	<section class="mt-8 text-xl">
		<div class="container mx-auto px-3">
			<form action="doLogin" onsubmit="logincheck(this); return false;">
				<div class="table-box-type-1 overflow-x-auto">
						<table border="1" class="mx-auto able w-full">
							<tr>
								<th align="right">로그인 아이디</th>
								<td><input class="input input-bordered input-warning w-full" type="text" name="loginID" placeholder="아이디를 입력해주세요" autocomplete="on"/></td>
							</tr>
							<tr>
								<th align="right">로그인 비밀번호</th>
								<td><input class="input input-bordered input-warning w-full" type="text" name="loginPW" placeholder="비밀번호를 입력해주세요"/></td>
							</tr>
							<tr>
								<td colspan="2"><button class="btn btn-outline btn-warning">로그인</button></td>
							</tr>
						</table>
						<a href="http://localhost:8080/oauth2/authorization/kakao">
							<img src="/resource/images/kakao_login_small.png" width="200" height="auto" alt="" />
						</a>
				</div>
			</form>
			
			<div class="btns flex justify-between">
				<button class="btn-text-link btn btn-success" type="button" onclick="history.back();">뒤로</button>
				<div>
				<a href="findLoginID" class="btn-text-link btn btn-success">아이디/비밀번호 찾기</a>
				</div>
			</div>
			
		</div>
	</section>


<%@ include file="../common/foot.jsp" %>