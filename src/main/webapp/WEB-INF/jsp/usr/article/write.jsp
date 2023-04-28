<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="pageTitle" value="Write" />
<%@ include file="../common/head.jsp" %>

	<section class="mt-8 text-xl">
		<div class="container mx-auto px-3">
			<select class="select select-success w-full max-w-xs">
				  <option disabled selected>게시판 선택</option>
				  <option>공지사항</option>
				  <option>자유게시판</option>
			</select>
			<form action="doWrite" onsubmit="logincheck(this); return false;">
			<div class="table-box-type-1 overflow-x-auto">
			<input type="hidden" name="boardId" value="${board.id }"/>
					<table border="1" class="mx-auto able w-full">
					<colgroup>
						<col width="100"/>
						<col width="700"/>
					</colgroup>
					<tr>
						<th>제목</th>
						<td><input class="input input-bordered input-success w-full" type="text" name="title" placeholder="제목을 입력해주세요."/></td>
					</tr>
					<tr>
						<th>내용</th>
						<td><textarea class="textarea textarea-success w-full" name="body" placeholder="내용을 입력해주세요." ></textarea></td>
					</tr>
					<tr>
						<td colspan="2"><button class="btn btn-outline btn-success">작성</button></td>
					</tr>
				</table>
			</div>
				</form>
			<div class="btns flex justify-start">
				<button class="btn-text-link btn btn-outline btn-success" type="button" onclick="history.back();">뒤로</button>
			</div>
		</div>
	</section>
			
	
<%@ include file="../common/foot.jsp" %>