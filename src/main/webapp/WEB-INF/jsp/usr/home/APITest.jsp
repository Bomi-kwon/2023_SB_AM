<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="pageTitle" value="APITest" />
<%@ include file="../common/head.jsp" %>

<script>

	const serviceKey = 'vTraa3XEWke2yjgWCW5BvReLV4uCxVyOrkQ63dm%2BZ95OXI789pVtYgD2EPlcsmFjOZP8VEQHwq%2Bn02pumTOsjg%3D%3D';
	const currentPage = 1;
	const perPage = 1;
	const CODE = 533112;
	
	async function getData() {
		const url = 'https://apis.data.go.kr/6430000/realtimeStandbyInfoService/getRealtimeStandbyInfo?surviceKey='+serviceKey+'&currentPage='+currentPage+'&perPage='+perPage+'&CODE='+CODE;
		
		console.log(url);
		
		const response = await fetch(url);
		
		console.log(response);
		
		const data = await response.json();
		
		console.log(data);
	}
	
	getData();

</script>

<section class="my-3 text-2xl">
	<div class="container mx-auto px-3">
		<div>APITest 입니다</div>
		<div class="API-content"></div>
	</div>
</section>