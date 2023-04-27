<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="pageTitle" value="List" />

<%@ include file="../common/head.jsp" %>

	<section class="mt-8 mx-auto text-xl">
		<div class="container mx-auto px-3">
			<div class=" mb-2 flex justify-end">
				<c:if test="${rq.getLoginedMemberId() != 0 }">
					<a class="btn-text-link btn btn-outline btn-success" href="write">글 쓰기</a>
				</c:if>
			</div>
			<div class="table-box-type-1 overflow-x-auto">
				<table border="1" class="mx-auto table w-full">
					<colgroup>
						<col width="100"/>
						<col width="300"/>
						<col width="500"/>
						<col width="200"/>
					</colgroup>
					<thead>
						<tr>
							<th>번호</th>
							<th>날짜</th>
							<th>제목</th>
							<th>작성자</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="article" items="${articles }">
							<tr class=hover>
								<td>${article.id }</td>
								<td>${article.regDate.substring(2,16) }</td>
								<td><a class="hover:underline" href="detail?id=${article.id }">${article.title }</a></td>
								<td>${article.writerName }</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
			
		</div>
	</section>
	
	
	
	
<%@ include file="../common/foot.jsp" %>