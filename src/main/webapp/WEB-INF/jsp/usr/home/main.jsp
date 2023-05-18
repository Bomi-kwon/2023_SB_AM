<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="pageTitle" value="Main" />
<%@ include file="../common/head.jsp" %>
	
	<c:if test="${rq.getLoginedMemberId() != 0 }">
	<div class="flex justify-end mr-40">
	<div class="stats stats-vertical shadow">
  
	  <div class="stat">
	    <div class="stat-figure text-secondary">
	      <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" class="inline-block w-8 h-8 stroke-current"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M13 10V3L4 14h7v7l9-11h-7z"></path></svg>
	    </div>
	    <div class="stat-title">총 게시물 수</div>
	    <div class="stat-value text-secondary"><div>${myArticlesCnt } 개</div></div>
	    <div class="stat-desc"><a href="">내가 쓴 게시물 보기</a></div>
	  </div>
	  
	  <div class="stat">
	    <div class="stat-figure text-primary">
	      <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" class="inline-block w-8 h-8 stroke-current"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M4.318 6.318a4.5 4.5 0 000 6.364L12 20.364l7.682-7.682a4.5 4.5 0 00-6.364-6.364L12 7.636l-1.318-1.318a4.5 4.5 0 00-6.364 0z"></path></svg>
	    </div>
	    <div class="stat-title">총 좋아요 수</div>
	    <div class="stat-value text-primary"><div>${myLikesCnt } 개</div></div>
	    <div class="stat-desc"><a href="">내가 받은 좋아요 보기</a></div>
	  </div>
	  
	  <div class="stat">
	    <div class="stat-figure text-secondary">
	        <div class="w-24 object-fill flex items-center">
	        	<c:if test="${rq.getLoginedMemberId() == 1}">
		        	<img src="https://i.namu.wiki/i/WcCUbrdSA_j2mxAcQwvT3ujxkm5AUHpbGg3YBYHP_u5MXa5vM1cSjfl3NtDXlFLW4BjydHMwI35xn4YJvkYbDA.webp" alt="" />
		        </c:if>
		        <c:if test="${rq.getLoginedMemberId() == 2}">
		        	<img src="https://mblogthumb-phinf.pstatic.net/MjAxOTEwMjdfMzIg/MDAxNTcyMTQzMDk1MzIy.vmE4PCbENLckM1qDsOc0gXKV2R2uyVAIPIsLT-YayKEg.YTzw2hKln4nijfDEp3Y5Y22h5kLsBWkexI9UU6d5XMIg.PNG.yunam69/%EC%8A%A4%ED%8F%B0%EC%A7%80%EB%B0%A5.png?type=w800" alt="" />
		        </c:if>
		        <c:if test="${rq.getLoginedMemberId() == 3}">
		        	<img src="https://i.namu.wiki/i/Q6BIqhZWqyhBAFmeZoOWIFO2Ttw1X0xOimLTY0WyohXIadIRIoxaAWc6yoggyEKohkI3aDCoKXsBlp6rvL-MFg.webp" alt="" />
		        </c:if>
	        </div>
	    </div>
	    <div class="stat-value">${member.name }</div>
	    <div class="stat-title">가입날짜&nbsp;&nbsp;${member.regDate.substring(0,10) }</div>
	    <div class="stat-title">${member.email }</div>
	  </div>
  
	</div>
	</div>
	</c:if>
	
	<section class="my-3 text-xl">
		<div class="container mx-auto px-3">
			<div class="modal-exam">모달예시</div>
		</div>
	</section>
	
	<section class="my-3 text-xl">
		<div class="container mx-auto px-3">
			<a href="/usr/home/APITest">APITest</a>
			<br />
			<a href="/usr/home/APITest2">APITest2</a>
		</div>
	</section>
	
	
	
	<div class="layer-bg"></div>
	<div class="layer">
		<h1>modal</h1>
		<div class="close-btn"><i class="fa-solid fa-circle-xmark"></i></div>
		<div>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Placeat eligendi ad odit excepturi cum explicabo nulla esse qui culpa aspernatur. Quia odit enim quod sit asperiores voluptas eos dolor est.</div>
	</div>
	
	
	
<%@ include file="../common/foot.jsp" %>