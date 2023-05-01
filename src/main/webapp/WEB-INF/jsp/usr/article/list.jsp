<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="pageTitle" value="${board.name } 게시판" />

<%@ include file="../common/head.jsp" %>

	<section class="mt-8 mx-auto text-xl">
		<div class="container mx-auto px-3">
			<div class=" mb-2 flex justify-between items-center">
				<div>글 갯수 : ${numberofarticles }</div>
				<c:if test="${rq.getLoginedMemberId() != 0 }">
					<c:if test="${board.id != 1 }">
						<a class="btn-text-link btn btn-outline btn-success" href="write?boardId=${board.id }">글 쓰기</a>
					</c:if>
					<c:if test="${board.id == 1 && rq.getLoginedMemberAuthlevel() == 7}">
						<a class="btn-text-link btn btn-outline btn-success" href="write?boardId=${board.id }">글 쓰기</a>
					</c:if>
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

			<div class="mt-2 flex justify-center">
				<div class="btn-group ">
				
					<c:set var="pageMenuLen" value="5"/>
					<c:set var="startPage" value="${page - pageMenuLen >= 1 ? page - pageMenuLen : 1 }"/>
					<c:set var="endPage" value="${page + pageMenuLen <= pagesCount ? page + pageMenuLen : pagesCount }"/>
				
					<c:if test="${page == 1 }">
						<a class="btn btn-xs btn-disabled">«</a>
						<a class="btn btn-xs btn-disabled">&lt;</a>
					</c:if>
					<c:if test="${page > 1 }">
						<a class="btn btn-xs" href="?boardId=${board.id }&page=1">«</a>
						<a class="btn btn-xs" href="?boardId=${board.id }&page=${page - 1}">&lt;</a>
					</c:if>
				
					<c:forEach begin="${startPage }" end="${endPage }" var="i">
						<a class="btn btn-xs ${page == i ? 'btn-active' : '' }" href="?boardId=${board.id }&page=${i}">${i }</a>
					</c:forEach>
					
					<c:if test="${page < pagesCount }">
						<a class="btn btn-xs" href="?boardId=${board.id }&page=${page + 1}">&gt;</a>
						<a class="btn btn-xs" href="?boardId=${board.id }&page=${pagesCount}">»</a>
					</c:if>
					<c:if test="${page == pagesCount }">
						<a class="btn btn-xs btn-disabled">&gt;</a>
						<a class="btn btn-xs btn-disabled">»</a>
					</c:if>
				</div>
			</div>
			
		</div>
	</section>
	
	
	
	
<%@ include file="../common/foot.jsp" %>