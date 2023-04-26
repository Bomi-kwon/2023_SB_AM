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
				<div class="table-box-type-1">
						<table border="1" class="mx-auto bg-yellow-50">
							<tr>
								<th align="right">로그인 아이디</th>
								<td><input class="w-96" type="text" name="loginID" placeholder="아이디를 입력해주세요" autocomplete="on"/></td>
							</tr>
							<tr>
								<th align="right">로그인 비밀번호</th>
								<td><input class="w-96" type="text" name="loginPW" placeholder="비밀번호를 입력해주세요"/></td>
							</tr>
							<tr>
								<td colspan="2"><button>로그인</button></td>
							</tr>
						</table>
				</div>
			</form>
		</div>
	</section>


<%@ include file="../common/foot.jsp" %>