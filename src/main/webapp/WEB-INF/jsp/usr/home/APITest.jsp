<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="pageTitle" value="APITest" />
<%@ include file="../common/head.jsp" %>

<script>

	const API_KEY = '';
	
	async function getData() {
		const url = '' + API_KEY;
		
		const response = await fetch(url);
		const data = await response.json();
		
		console.log(data);
		
		$('.API-content').html();
	}
	
	getData();

</script>

<section class="my-3 text-2xl">
	<div class="container mx-auto px-3">
		<div>APITest 입니다</div>
		<div class="API-content"></div>
	</div>
</section>