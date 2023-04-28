<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="pageTitle" value="Detail" />
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
						<td>
							<div class="overflow-y-auto">${article.body }</div>
						</td>
					</tr>
				</table>
			</div>
			
			<div class="btns flex justify-end">
				<a class="btn-text-link btn btn-outline btn-success" href="list">목록</a>
					<c:if test="${article.actorCanChangeData}">
						<a class="btn-text-link btn btn-outline btn-success" href="modify?id=${article.id }">수정</a>
						<a class="btn-text-link btn btn-outline btn-success" href="doDelete?id=${article.id }" onclick="if(confirm('정말 삭제하시겠습니까?')==false) return false;">삭제</a>
					</c:if>
			</div>
		</div>
	</section>
	
<%@ include file="../common/foot.jsp" %>