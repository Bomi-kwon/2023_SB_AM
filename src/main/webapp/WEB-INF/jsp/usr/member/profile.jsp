<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="pageTitle" value="Profile" />
<%@ include file="../common/head.jsp" %>

	<section class="mt-8 text-xl">
		<div class="container mx-auto px-3">
			<div class="table-box-type-1">
				<table border="1" class="mx-auto table w-full">
					<colgroup>
						<col width="100"/>
						<col width="700"/>
					</colgroup>
					<tr>
						<th>번호</th>
						<td>${member.id }</td>
					</tr>
					<tr>
						<th>가입날짜</th>
						<td>${member.regDate.substring(2,16) }</td>
					</tr>
					<tr>
						<th>로그인 아이디</th>
						<td>${member.loginID }</td>
					</tr>
					<tr>
						<th>로그인 비밀번호</th>
						<td>${member.loginPW }</td>
					</tr>
					<tr>
						<th>회원 등급</th>
						<td>${member.authLevel }</td>
					</tr>
					<tr>
						<th>이름</th>
						<td>${member.name }</td>
					</tr>
					<tr>
						<th>닉네임</th>
						<td>${member.nickname }</td>
					</tr>
					<tr>
						<th>휴대폰번호</th>
						<td>${member.cellphoneNum }</td>
					</tr>
					<tr>
						<th>이메일</th>
						<td>${member.email }</td>
					</tr>
				</table>
			</div>
			
			<div class="btns flex justify-end">
				<button class="btn-text-link btn btn-outline btn-success" type="button" onclick="history.back();">뒤로</button>
					<c:if test="${member.id == rq.getLoginedMemberId()}">
						<a class="btn-text-link btn btn-outline btn-success" href="modifyMember?id=${member.id }">회원정보 수정</a>
					</c:if>
			</div>
		</div>
	</section>
	
<%@ include file="../common/foot.jsp" %>