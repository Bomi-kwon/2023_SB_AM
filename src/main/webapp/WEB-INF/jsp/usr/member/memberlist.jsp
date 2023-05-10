<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="pageTitle" value="회원리스트" />

<%@ include file="../common/head.jsp" %>

	<section class="mt-8 mx-auto text-xl">
		<div class="container mx-auto px-3">
			<div class=" mb-2 flex justify-between items-center">
				<div>회원 수 :  명</div>
				<form>
					<div class="flex justify-end">
						<select data-value="${keyWordType }" class="select select-bordered" name="keyWordType">
							<option value="title">제목만</option>
							<option value="body">내용만</option>
							<option value="all">제목+내용</option>
						</select>
						<input class="ml-1 w-80 input input-bordered" type="text" name="keyWord" id="keyWord" placeholder="검색어를 입력하세요." value="${keyWord }"/>
						<button class="ml-1 btn btn-outline">검색</button>
					</div>
				</form>
			</div>
			<div class="table-box-type-1 overflow-x-auto">
				<table border="1" class="mx-auto table w-full">
					<colgroup>
						<col width="100"/>
						<col width="500"/>
						<col width="300"/>
						<col width="200"/>
						<col width="100"/>
						<col width="100"/>
						<col width="200"/>
						<col width="200"/>
					</colgroup>
					<thead>
						<tr>
							<th>번호</th>
							<th>가입날짜</th>
							<th>아이디</th>
							<th>이름</th>
							<th>닉네임</th>
							<th>회원등급</th>
							<th>전화번호</th>
							<th>이메일</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="member" items="${members }">
							<tr class=hover>
								<td>${member.id }</td>
								<td>${member.regDate.substring(2,16) }</td>
								<td>${member.loginID }</td>
								<td>${member.name }</td>
								<td>${member.nickname }</td>
								<td>${member.authLevel }</td>
								<td>${member.cellphoneNum }</td>
								<td>${member.email }</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
	</section>
	
	
<%@ include file="../common/foot.jsp" %>