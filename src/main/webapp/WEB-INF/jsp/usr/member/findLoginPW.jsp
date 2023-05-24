<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="pageTitle" value="Find LoginPW" />
<%@ include file="../common/head.jsp" %>

	<script type="text/javascript">
		function logincheck(form) {
			if (form.name.value.trim().length == 0) {
				alert('이름을 입력하세요');
				form.name.focus();
				return;
			}
			if (form.loginID.value.trim().length == 0) {
				alert('아이디를 입력하세요');
				form.loginID.focus();
				return;
			}
			else if (form.email.value.trim().length == 0) {
				alert('이메일을 입력하세요');
				form.email.focus();
				return;
			}
			else {
				form.submit();
			}
		}
	</script>

	<section class="mt-8 text-xl">
		<div class="container mx-auto px-3">
			<form action="doFindLoginPW" onsubmit="logincheck(this); return false;">
				<div class="table-box-type-1 overflow-x-auto">
						<table border="1" class="mx-auto able w-full">
							<tr>
								<th align="right">이름</th>
								<td><input class="input input-bordered input-warning w-full" type="text" name="name" placeholder="이름을 입력해주세요" autocomplete="on"/></td>
							</tr>
							<tr>
								<th align="right">로그인 아이디</th>
								<td><input class="input input-bordered input-warning w-full" type="text" name="loginID" placeholder="아이디를 입력해주세요" autocomplete="on"/></td>
							</tr>
							<tr>
								<th align="right">이메일</th>
								<td><input class="input input-bordered input-warning w-full" type="text" name="email" placeholder="이메일을 입력해주세요"/></td>
							</tr>
							<tr>
								<td colspan="2"><button class="btn btn-outline btn-warning">비밀번호 찾기</button></td>
							</tr>
						</table>
				</div>
			</form>
			
			<div class="btns flex justify-between">
				<button class="btn-text-link btn btn-success" type="button" onclick="history.back();">뒤로</button>
				<div>
				<a href="login" class="btn-text-link btn btn-success">로그인</a>
				</div>
			</div>
			
		</div>
	</section>


<%@ include file="../common/foot.jsp" %>