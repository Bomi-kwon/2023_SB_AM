<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="pageTitle" value="Modify" />

<%@ include file="../common/head.jsp" %>
	<section class="mt-8 text-xl">
		<div class="container mx-auto px-3">
			<div class="table-box-type-1">
				<form action="doLogin" onsubmit="logincheck(this); return false;">
					<table border="1" class="mx-auto bg-yellow-50">
					<colgroup>
						<col width="100"/>
						<col width="700"/>
					</colgroup>
					<tr>
						<th>번호</th>
						<td>${article.id }</td>
					</tr>
					<tr>
						<th>작성날짜</th>
						<td>${article.regDate.substring(2,16) }</td>
					</tr>
					<tr>
						<th>수정날짜</th>
						<td>${article.updateDate.substring(2,16) }</td>
					</tr>
					<tr>
						<th>작성자</th>
						<td>${article.writerName }</td>
					</tr>
					<tr>
						<th>제목</th>
						<td>${article.title }</td>
					</tr>
					<tr>
						<th>내용</th>
						<td>${article.body }</td>
					</tr>
				</table>
					<button>로그인</button>
				</form>
			</div>
		</div>
	</section>
			<div class="btns">
				<button class="btn-text-link" type="button" onclick="history.back();">뒤로</button>
				
				
				<a class="btn-text-link" href="modify?id=${article.id }">수정</a>
				<a class="btn-text-link" href="doDelete?id=${article.id }">삭제</a>
			</div>
	
<%@ include file="../common/foot.jsp" %>