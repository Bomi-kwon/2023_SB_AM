<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="pageTitle" value="ModifyMember" />
<%@ include file="../common/head.jsp" %>

	<section class="mt-8 text-xl">
		<div class="container mx-auto px-3">
			<form action="doModifyMember">
			<div class="table-box-type-1 overflow-x-auto">
					<table border="1" class="mx-auto able w-full">
					<colgroup>
						<col width="100"/>
						<col width="700"/>
					</colgroup>
					<tr>
						<th>번호</th>
						<td>${rq.getLoginedMember().getId() }</td>
					</tr>
					<tr>
						<th>가입날짜</th>
						<td>${rq.getLoginedMember().getRegDate().subSequence(0, 10) }</td>
					</tr>
					<tr>
						<th>로그인 아이디</th>
						<td>${rq.getLoginedMember().getLoginID() }</td>
					</tr>
					<tr>
						<th>로그인 비밀번호</th>
						<td>${rq.getLoginedMember().getLoginPW() }</td>
					</tr>
					<tr>
						<th>회원 등급</th>
						<td>${rq.getLoginedMember().getAuthLevel() }</td>
					</tr>
					<tr>
						<th>이름</th>
						<td>${rq.getLoginedMember().getName() }</td>
					</tr>
					<tr>
						<th>닉네임</th>
						<td><input class="input input-bordered input-success w-full" type="text" 
						name="nickname" value="${rq.getLoginedMember().getNickname() }" placeholder="새 닉네임을 입력해주세요."/></td>
					</tr>
					<tr>
						<th>휴대폰번호</th>
						<td><input class="input input-bordered input-success w-full" type="text" 
						name="cellphoneNum" value="${rq.getLoginedMember().getCellphoneNum() }" placeholder="새 전화번호를 입력해주세요."/></td>
					</tr>
					<tr>
						<th>이메일</th>
						<td><input class="input input-bordered input-success w-full" type="text" 
						name="email" value="${rq.getLoginedMember().getEmail() }" placeholder="새 이메일을 입력해주세요."/></td>
					</tr>
					<tr>
						<td colspan="2"><button class="btn btn-success">회원정보 수정</button></td>
					</tr>
				</table>
			</div>
				</form>
		</div>
	</section>
			<div class="btns">
				<button class="btn-text-link btn btn-success" type="button" onclick="history.back();">뒤로</button>
			</div>
	
<%@ include file="../common/foot.jsp" %>