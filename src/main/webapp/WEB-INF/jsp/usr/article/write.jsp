<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="pageTitle" value="Write" />
<%@ include file="../common/head.jsp" %>

	<section class="mt-8 text-xl">
		<div class="container mx-auto px-3">
			<form action="doAdd" onsubmit="logincheck(this); return false;">
			<div class="table-box-type-1">
					<table border="1" class="mx-auto bg-yellow-50">
					<colgroup>
						<col width="100"/>
						<col width="700"/>
					</colgroup>
					<tr>
						<th>제목</th>
						<td><input class="w-96" type="text" name="title" placeholder="제목을 입력해주세요."/></td>
					</tr>
					<tr>
						<th>내용</th>
						<td><textarea class="w-96" name="body" placeholder="내용을 입력해주세요." ></textarea></td>
					</tr>
					<tr>
						<td colspan="2"><button>작성</button></td>
					</tr>
				</table>
			</div>
				</form>
		</div>
	</section>
			<div class="btns">
				<button class="btn-text-link" type="button" onclick="history.back();">뒤로</button>
			</div>
	
<%@ include file="../common/foot.jsp" %>