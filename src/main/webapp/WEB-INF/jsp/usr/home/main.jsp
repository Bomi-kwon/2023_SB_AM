<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="pageTitle" value="Main" />
<%@ include file="../common/head.jsp" %>
	
	<c:if test="${rq.getLoginedMemberId() != 0 }">
	<div class="flex justify-center">
	<div class="stats shadow">
  
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
	        <div class="w-16 rounded-full">
	        	<img src="https://i.namu.wiki/i/Q6BIqhZWqyhBAFmeZoOWIFO2Ttw1X0xOimLTY0WyohXIadIRIoxaAWc6yoggyEKohkI3aDCoKXsBlp6rvL-MFg.webp" alt="" />
	        </div>
	    </div>
	    <div class="stat-value">${member.name }</div>
	    <br />
	    <div class="stat-title">${member.email }</div>
	  </div>
  
	</div>
	</div>
	</c:if>
	
	<div>
		<img src="C:\bbomi\pexels-simon-berger-1323550.jpg" alt="" />
	</div>
	
	<section class="mt-8">
		<div class="container mx-auto">
			<div>
				Lorem ipsum dolor sit amet, consectetur adipisicing elit. Ducimus ut voluptates atque quod tempore quaerat non cumque magni nihil eveniet molestiae eius earum ratione! Voluptate error minus magni quibusdam similique.
				Lorem ipsum dolor sit amet, consectetur adipisicing elit. Ea corporis et eligendi sit delectus optio quos distinctio reiciendis at libero illum iure quisquam autem minima iste voluptatibus quidem assumenda consectetur!
				Lorem ipsum dolor sit amet, consectetur adipisicing elit. Ea optio nisi blanditiis eligendi dolores ducimus praesentium consequatur id illum commodi ullam quos autem dicta quis harum reiciendis veniam mollitia pariatur.
				Lorem ipsum dolor sit amet, consectetur adipisicing elit. Provident est vero ipsam libero non atque sed rem quo dolores beatae consequuntur in necessitatibus voluptatem cum magnam quam dolore quisquam odio.
				Lorem ipsum dolor sit amet, consectetur adipisicing elit. Fuga nostrum qui quae at dolore est rerum repudiandae cumque expedita id temporibus ab consequuntur veritatis vero in. Atque facere animi autem.
			</div>
			<div>
				안녕하세요
			</div>
		</div>
	</section>
<%@ include file="../common/foot.jsp" %>