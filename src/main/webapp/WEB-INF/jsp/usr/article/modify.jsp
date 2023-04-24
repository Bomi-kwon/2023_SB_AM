<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="pageTitle" value="Modify" />

<%@ include file="../common/head.jsp" %>
	<section class="mt-8 text-xl">
		<div class="container mx-auto px-3">
			<div class="table-box-type-1">
			</div>
			
			<div class="btns">
				<button class="btn-text-link" type="button" onclick="history.back();">뒤로</button>
				
				
				<a class="btn-text-link" href="modify?id=${article.id }">수정</a>
				<a class="btn-text-link" href="doDelete?id=${article.id }">삭제</a>
			</div>
			
		</div>
	</section>
	
<%@ include file="../common/foot.jsp" %>