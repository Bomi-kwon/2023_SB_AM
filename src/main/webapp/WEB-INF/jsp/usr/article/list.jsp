<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="pageTitle" value="${board.name } 게시판" />

<%@ include file="../common/head.jsp" %>

<script>
	function highlightKeyword(){
		var search = $('#keyWord').val();
		$("#contents:contains('"+ search +"')").each(function(){
			var regex = new RegExp(search, 'gi');
			$(this).html( $(this).text().replace(regex, "<span class='text-red'>"+ search +"</span>") );
		})
	}
	
	highlightKeyword();
</script>

	<section class="mt-8 mx-auto text-xl">
		<div class="container mx-auto px-3">
			<div class=" mb-2 flex justify-between items-center">
				<div>글 갯수 : ${numberofarticles } 개</div>
				<form>
					<input type="hidden" name="boardId" value="${board.id }"/>
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
					</colgroup>
					<thead>
						<tr>
							<th>번호</th>
							<th>제목</th>
							<th>날짜</th>
							<th>작성자</th>
							<th>조회수</th>
							<th>추천수</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="article" items="${articles }">
							<tr class=hover>
								<td>${article.id }</td>
								<td>
									<a class="hover:underline" href="detail?id=${article.id }" id="contents">
										${article.title} 
										<c:if test="${article.replyCnt != 0 }">
										(${article.replyCnt })
										</c:if>
									</a>
								</td>
								<td>${article.regDate.substring(2,16) }</td>
								<td>${article.writerName }</td>
								<td>${article.hit }</td>
								<td>${article.sumReactionPoint }</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
			
			<div class="mb-2 flex justify-end items-center">
				<c:if test="${rq.getLoginedMemberId() != 0 }">
					<c:if test="${board.id != 1 }">
						<a class="btn-text-link btn btn-success" href="write?boardId=${board.id }">글 쓰기</a>
					</c:if>
					<c:if test="${board.id == 1 }">
						<c:if test="${rq.getLoginedMember().getAuthLevel() == 7 }">
							<a class="btn-text-link btn btn-success" href="write?boardId=${board.id }">글 쓰기</a>
						</c:if>
					</c:if>
				</c:if>
			</div>
			<div class="mt-2 flex justify-center">
				<div class="btn-group ">
				
					<c:set var="pageMenuLen" value="5"/>
					<c:set var="startPage" value="${page - pageMenuLen >= 1 ? page - pageMenuLen : 1 }"/>
					<c:set var="endPage" value="${page + pageMenuLen <= pagesCount ? page + pageMenuLen : pagesCount }"/>
				
					<c:set var="pageBaseUri" value="?boardId=${board.id }&keyWordType=${keyWordType }&keyWord=${keyWord }"/>
				
					<c:if test="${page == 1 }">
						<a class="btn btn-xs btn-disabled">«</a>
						<a class="btn btn-xs btn-disabled">&lt;</a>
					</c:if>
					<c:if test="${page > 1 }">
						<a class="btn btn-xs" href="${pageBaseUri }&page=1">«</a>
						<a class="btn btn-xs" href="${pageBaseUri }&page=${page - 1}">&lt;</a>
					</c:if>
				
					<c:forEach begin="${startPage }" end="${endPage }" var="i">
						<a class="btn btn-xs ${page == i ? 'btn-active' : '' }" href="${pageBaseUri }&page=${i}">${i }</a>
					</c:forEach>
					
					<c:if test="${page < pagesCount }">
						<a class="btn btn-xs" href="${pageBaseUri }&page=${page + 1}">&gt;</a>
						<a class="btn btn-xs" href="${pageBaseUri }&page=${pagesCount}">»</a>
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