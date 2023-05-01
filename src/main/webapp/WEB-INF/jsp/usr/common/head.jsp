<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${pageTitle }</title>
<!-- 테일윈드 불러오기 -->
<!-- 노말라이즈, 라이브러리 -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/tailwindcss/2.2.7/tailwind.min.css" />
<!-- 데이지 UI -->
<link href="https://cdn.jsdelivr.net/npm/daisyui@2.31.0/dist/full.css" rel="stylesheet" type="text/css" />
<!-- 제이쿼리 불러오기 -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<!-- 폰트어썸 불러오기 -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css" />
<link rel="stylesheet" href="/resource/common.css" />
<script src="/resource/common.js" defer="defer"></script>
</head>
<body>

	<div class="h-20 flex container mx-auto text-2xl">
		<a href="/" class="px-3 flex items-center"><span><i class="fa-sharp fa-solid fa-face-smile-wink"></i></span></a>
		<div class="flex-grow"></div>
		<ul class="flex">
			<li class="hover:underline"><a class="h-full px-3 flex items-center" href="/"><span>홈</span></a></li>
			<li class="hover:underline"><a class="h-full px-3 flex items-center" href="/usr/article/list?boardId=1"><span>공지사항</span></a></li>
			<li class="hover:underline"><a class="h-full px-3 flex items-center" href="/usr/article/list?boardId=2"><span>자유게시판</span></a></li>
			<c:if test="${rq.getLoginedMemberId() == 0 }">
				<li class="hover:underline"><a class="h-full px-3 flex items-center" href="/usr/member/login"><span>로그인</span></a></li>
				<li class="hover:underline"><a class="h-full px-3 flex items-center" href="/usr/member/join"><span>회원가입</span></a></li>
			</c:if>
			<c:if test="${rq.getLoginedMemberId() != 0 }">
				<li class="hover:underline"><a class="h-full px-3 flex items-center" href="/usr/member/doLogout"><span>로그아웃</span></a></li>
			</c:if>
		</ul>
	</div>
	
	<section class="my-3 text-2xl">
		<div class="container mx-auto px-3">
			<h1>${pageTitle }</h1>
		</div>
	</section>