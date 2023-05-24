<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="pageTitle" value="ModifyPassword" />
<%@ include file="../common/head.jsp" %>



	<section class="mt-8 text-xl">
		<div class="container mx-auto px-3">
			<form action="doModifyPassword">
				<div class="table-box-type-1 overflow-x-auto">
						<table border="1" class="mx-auto able w-full">
							<tr>
								<th align="right">로그인 아이디</th>
								<td>${rq.loginedMember.loginID }</td>
							</tr>
							<tr>
								<th align="right">새 로그인 비밀번호</th>
								<td><input class="input input-bordered input-warning w-full" type="text" name="loginPW" placeholder="새 비밀번호를 입력해주세요"/></td>
							</tr>
							<tr>
								<th align="right">새 로그인 비밀번호 확인</th>
								<td><input class="input input-bordered input-warning w-full" type="text" name="loginPWCheck" placeholder="새 비밀번호 확인을 입력해주세요"/></td>
							</tr>
							<tr>
								<td colspan="2"><button class="btn btn-outline btn-warning" onclick="test();">수정</button></td>
							</tr>
						</table>
				</div>
			</form>
		</div>
	</section>


<%@ include file="../common/foot.jsp" %>