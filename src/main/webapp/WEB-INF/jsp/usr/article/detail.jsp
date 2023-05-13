<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="pageTitle" value="Detail" />
<%@ include file="../common/head.jsp" %>

<!-- 좋아요/싫어요 스크립트 -->
<script>
		function getReactionPoint(){
			
			$.get('../reactionPoint/getReactionPoint', {
				relId : ${article.id},
				relTypeCode : 'article'
			}, function(data) {
				if(data.data1.sumReactionPoint > 0) {
					$('#likepoint').removeClass( 'btn-outline' );
					$('#likepoint').prop('href','../reactionPoint/doDeleteReactionPoint?relTypeCode=article&relId=${article.id }&point=1');
				}
				else if(data.data1.sumReactionPoint < 0) {
					$('#hatepoint').removeClass( 'btn-outline' );
					$('#hatepoint').prop('href','../reactionPoint/doDeleteReactionPoint?relTypeCode=article&relId=${article.id }&point=-1');
				}
				
			}, 'json');
			
		}
		
		$(function() {
			getReactionPoint();
		})
		
		
	</script>

<!-- 디테일 페이지 -->
	<section class="mt-8 text-xl">
		<div class="container mx-auto px-3 ">
			<div class="table-box-type-1">
				<table border="1" class="mx-auto table w-full">
					<colgroup>
						<col width="100"/>
						<col width="700"/>
					</colgroup>
					<tr>
						<th>번호</th>
						<td>${article.id }</td>
					</tr>
					<tr>
						<th>작성날짜</th>
						<td>${article.regDate.substring(2,16) }</td>
					</tr>
					<tr>
						<th>수정날짜</th>
						<td>${article.updateDate.substring(2,16) }</td>
					</tr>
					<tr>
						<th>작성자</th>
						<td>${article.writerName }</td>
					</tr>
					<tr>
						<th>제목</th>
						<td>${article.title }</td>
					</tr>
					<tr>
						<th>내용</th>
						<td class="">
							<div class="detailbody break-all whitespace-normal overflow-y-auto">${article.getForPrintBody() }</div>
						</td>
					</tr>
					<tr>
						<th>조회수</th>
						<td>
						<span>${article.hit }</span>
						</td>
					</tr>
					<tr>
						<th>추천수</th>
						<td>
						<div class="flex flex-col items-center">
							<c:if test="${rq.getLoginedMemberId() != 0 }">
								<div class="flex mb-3">
									<label class="mr-2">
										  <a href="../reactionPoint/doChangeReactionPoint?relTypeCode=article&relId=${article.id }&point=1" class="btn btn-outline" id="likepoint"><svg class="fill-current" xmlns="http://www.w3.org/2000/svg" width="48" height="48" viewBox="0 0 512 512"><!--! Font Awesome Pro 6.4.0 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license (Commercial License) Copyright 2023 Fonticons, Inc. --><path d="M323.8 34.8c-38.2-10.9-78.1 11.2-89 49.4l-5.7 20c-3.7 13-10.4 25-19.5 35l-51.3 56.4c-8.9 9.8-8.2 25 1.6 33.9s25 8.2 33.9-1.6l51.3-56.4c14.1-15.5 24.4-34 30.1-54.1l5.7-20c3.6-12.7 16.9-20.1 29.7-16.5s20.1 16.9 16.5 29.7l-5.7 20c-5.7 19.9-14.7 38.7-26.6 55.5c-5.2 7.3-5.8 16.9-1.7 24.9s12.3 13 21.3 13L448 224c8.8 0 16 7.2 16 16c0 6.8-4.3 12.7-10.4 15c-7.4 2.8-13 9-14.9 16.7s.1 15.8 5.3 21.7c2.5 2.8 4 6.5 4 10.6c0 7.8-5.6 14.3-13 15.7c-8.2 1.6-15.1 7.3-18 15.1s-1.6 16.7 3.6 23.3c2.1 2.7 3.4 6.1 3.4 9.9c0 6.7-4.2 12.6-10.2 14.9c-11.5 4.5-17.7 16.9-14.4 28.8c.4 1.3 .6 2.8 .6 4.3c0 8.8-7.2 16-16 16H286.5c-12.6 0-25-3.7-35.5-10.7l-61.7-41.1c-11-7.4-25.9-4.4-33.3 6.7s-4.4 25.9 6.7 33.3l61.7 41.1c18.4 12.3 40 18.8 62.1 18.8H384c34.7 0 62.9-27.6 64-62c14.6-11.7 24-29.7 24-50c0-4.5-.5-8.8-1.3-13c15.4-11.7 25.3-30.2 25.3-51c0-6.5-1-12.8-2.8-18.7C504.8 273.7 512 257.7 512 240c0-35.3-28.6-64-64-64l-92.3 0c4.7-10.4 8.7-21.2 11.8-32.2l5.7-20c10.9-38.2-11.2-78.1-49.4-89zM32 192c-17.7 0-32 14.3-32 32V448c0 17.7 14.3 32 32 32H96c17.7 0 32-14.3 32-32V224c0-17.7-14.3-32-32-32H32z"/></svg></a>
									</label>
									<span class="flex items-center">
										${article.likeReactionPoint }개
									</span>
								</div>
								
								<div class="flex mb-3">
									<label class="mr-2">
										<a href="../reactionPoint/doChangeReactionPoint?relTypeCode=article&relId=${article.id }&point=-1" class="btn btn-outline" id="hatepoint"><svg class="fill-current" xmlns="http://www.w3.org/2000/svg" width="48" height="48" viewBox="0 0 512 512"><!--! Font Awesome Pro 6.4.0 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license (Commercial License) Copyright 2023 Fonticons, Inc. --><path d="M323.8 477.2c-38.2 10.9-78.1-11.2-89-49.4l-5.7-20c-3.7-13-10.4-25-19.5-35l-51.3-56.4c-8.9-9.8-8.2-25 1.6-33.9s25-8.2 33.9 1.6l51.3 56.4c14.1 15.5 24.4 34 30.1 54.1l5.7 20c3.6 12.7 16.9 20.1 29.7 16.5s20.1-16.9 16.5-29.7l-5.7-20c-5.7-19.9-14.7-38.7-26.6-55.5c-5.2-7.3-5.8-16.9-1.7-24.9s12.3-13 21.3-13L448 288c8.8 0 16-7.2 16-16c0-6.8-4.3-12.7-10.4-15c-7.4-2.8-13-9-14.9-16.7s.1-15.8 5.3-21.7c2.5-2.8 4-6.5 4-10.6c0-7.8-5.6-14.3-13-15.7c-8.2-1.6-15.1-7.3-18-15.2s-1.6-16.7 3.6-23.3c2.1-2.7 3.4-6.1 3.4-9.9c0-6.7-4.2-12.6-10.2-14.9c-11.5-4.5-17.7-16.9-14.4-28.8c.4-1.3 .6-2.8 .6-4.3c0-8.8-7.2-16-16-16H286.5c-12.6 0-25 3.7-35.5 10.7l-61.7 41.1c-11 7.4-25.9 4.4-33.3-6.7s-4.4-25.9 6.7-33.3l61.7-41.1c18.4-12.3 40-18.8 62.1-18.8H384c34.7 0 62.9 27.6 64 62c14.6 11.7 24 29.7 24 50c0 4.5-.5 8.8-1.3 13c15.4 11.7 25.3 30.2 25.3 51c0 6.5-1 12.8-2.8 18.7C504.8 238.3 512 254.3 512 272c0 35.3-28.6 64-64 64l-92.3 0c4.7 10.4 8.7 21.2 11.8 32.2l5.7 20c10.9 38.2-11.2 78.1-49.4 89zM32 384c-17.7 0-32-14.3-32-32V128c0-17.7 14.3-32 32-32H96c17.7 0 32 14.3 32 32V352c0 17.7-14.3 32-32 32H32z"/></svg></a>
									</label>
									<span class="flex items-center">
										${article.hateReactionPoint * (-1) }개
									</span>
								</div>
							</c:if>
						
							<span class="">합계 : ${article.sumReactionPoint }</span>
						</div>
						</td>
					</tr>
				</table>
			</div>
			
			<!-- 디테일 밑에 수정/삭제 버튼 -->
			<div class="btns flex justify-end">
				<a class="btn-text-link btn btn-success" href="list?boardId=${article.boardId }">목록</a>
					<c:if test="${article.actorCanChangeData}">
						<a class="btn-text-link btn btn-success" href="modify?id=${article.id }">수정</a>
						<a class="btn-text-link btn btn-success" href="doDelete?id=${article.id }" onclick="if(confirm('정말 삭제하시겠습니까?')==false) return false;">삭제</a>
					</c:if>
			</div>
		</div>
	</section>
	
	
	<!-- 댓글 미입력 방지 -->
	<script>
		function replyWrite_submitForm(form) {
			
			if (form.replybody.value.trim().length < 2) {
				alert('댓글을 2글자 이상 입력하세요');
				form.replybody.focus();
				return;
			}
			
			form.submit();
			
		}
		
		originalForm = null;
		originalId = null;
		
		function replyModify_getForm(replyId,i) {
			
			if(originalForm != null) {
				replyModify_cancle(originalId);
			}
			
			$.get('../reply/getReplyContent', {
				id : replyId
			}, function(data) {
				
				
				let replyContent = $('#' + i);
				
				originalId = i;
				originalForm = replyContent.html();
				
				
				let addHtml = `
					<form action="../reply/doModifyReply" onsubmit="replyWrite_submitForm(this); return false;">
						<input type="hidden" name="id" value="\${data.data1.id}"/>
							<input type="hidden" name="replymemberId" value="\${data.data1.replymemberId }"/>
						<div class="py-1 text-base pl-2 pt-5 flex-grow">
							<div class="mb-2"><span>\${data.data1.writerName}</span></div>
							<textarea class="textarea textarea-bordered w-full" name="replybody" placeholder="댓글을 입력해주세요.">\${data.data1.replybody}</textarea>
							<div class="flex justify-end">
								<a onclick="replyModify_cancle(\${i});" class="btn btn-outline btn-sm">취소</a>
								<button class="btn btn-outline btn-sm">수정</button>
							</div>
						</div>
				</form>
				`;
			
				replyContent.empty().html("");
				replyContent.append(addHtml);
			}, 'json');
			
		}
		
		
		function replyModify_cancle(i) {
			let replyContent = $('#' + i);
			replyContent.html(originalForm);
			
			originalForm = null;
			originalId = null;
		}
	</script>
	
	<!-- 댓글 리스트 -->
	<section class="my-8 text-xl">
		<div class="container mx-auto px-3">
		<h2>댓글</h2>
			<c:forEach var="reply" items="${replies }" varStatus="status">
				<div class="flex border-top-line bg-white bg-opacity-80 mb-1 px-8 container">
					<div class="w-16 object-fill flex items-center mr-4">
						<c:if test="${reply.replymemberId == 1}">
				        	<img src="https://i.namu.wiki/i/WcCUbrdSA_j2mxAcQwvT3ujxkm5AUHpbGg3YBYHP_u5MXa5vM1cSjfl3NtDXlFLW4BjydHMwI35xn4YJvkYbDA.webp" alt="" />
				        </c:if>
				        <c:if test="${reply.replymemberId == 2}">
				        	<img src="https://mblogthumb-phinf.pstatic.net/MjAxOTEwMjdfMzIg/MDAxNTcyMTQzMDk1MzIy.vmE4PCbENLckM1qDsOc0gXKV2R2uyVAIPIsLT-YayKEg.YTzw2hKln4nijfDEp3Y5Y22h5kLsBWkexI9UU6d5XMIg.PNG.yunam69/%EC%8A%A4%ED%8F%B0%EC%A7%80%EB%B0%A5.png?type=w800" alt="" />
				        </c:if>
				        <c:if test="${reply.replymemberId == 3}">
				        	<img class="w-full" src="https://i.namu.wiki/i/Q6BIqhZWqyhBAFmeZoOWIFO2Ttw1X0xOimLTY0WyohXIadIRIoxaAWc6yoggyEKohkI3aDCoKXsBlp6rvL-MFg.webp" alt="" />
				        </c:if>
					</div>
					
					<!-- 그냥 댓글 보여줄때 -->
					<div id="${status.count }" class="py-2 text-base pl-2 pt-5 flex-grow">
						<div class="flex justify-between items-end">
							<div class="font-semibold flex items-center"><span>${reply.writerName }</span></div>
							
							<!-- 댓글 수정/삭제 버튼 -->
							<c:if test="${rq.getLoginedMemberId() == reply.replymemberId }">
								<div class="dropdown">
								    <button class="btn btn-square btn-xs btn-ghost">
								      <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" class="inline-block w-5 h-5 stroke-current"><path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M5 12h.01M12 12h.01M19 12h.01M6 12a1 1 0 11-2 0 1 1 0 012 0zm7 0a1 1 0 11-2 0 1 1 0 012 0zm7 0a1 1 0 11-2 0 1 1 0 012 0z"></path></svg>
								    </button>
								    <ul tabindex="0" class="menu menu-compact dropdown-content mt-3 p-2 shadow bg-base-100 rounded-box w-20">
								        <li><a onclick="replyModify_getForm(${reply.id },${status.count });">수정</a></li>
								        <li><a href="../reply/doDeleteReply?id=${reply.id }&replymemberId=${reply.replymemberId}" onclick="if(confirm('정말 삭제하시겠습니까?')==false) return false;">삭제</a></li>
								    </ul>
								</div>
							</c:if>
						</div>
						<div class="detailbody my-1 text-sm break-all whitespace-normal"><span>${reply.getForPrintReplybody() }</span></div>
						<div class="text-xs text-gray-400 mb-2"><span>${reply.updateDate }</span></div>
					</div>
				</div>
			</c:forEach>
			
			
			<!-- 댓글 작성 폼 -->
			<c:if test="${rq.getLoginedMemberId() != 0 }">
				<form action="../reply/doWriteReply" onsubmit="replyWrite_submitForm(this); return false;">
					<input type="hidden" name="relTypeCode" value="article"/>
					<input type="hidden" name="relId" value="${article.id }"/>
					<div class="my-4 border border-gray-400 rounded-lg text-base p-4 bg-white bg-opacity-80">
						<div class="mb-2"><span>${rq.getLoginedMemberNickname() }</span></div>
						<textarea class="textarea textarea-bordered w-full" name="replybody" placeholder="댓글을 입력해주세요."></textarea>
						<div class="flex justify-end"><button class="btn btn-outline btn-sm">댓글 작성</button></div>
					</div>
				</form>
			</c:if>
			
			<!-- 로그인 안했을때의 댓글 작성 창 -->
			<c:if test="${rq.getLoginedMemberId() == 0 }">
				<div class="mt-4 border border-gray-400 rounded-lg text-lg p-4 bg-white bg-opacity-80">
					<textarea class="textarea textarea-bordered w-full" name="replybody" placeholder="로그인 후 댓글을 입력해주세요."></textarea>
					<div class="flex justify-end"><a class="btn btn-outline btn-sm" href="../member/login">로그인 하러가기</a></div>
				</div>
			</c:if>
		</div>
	</section>
	
	
<%@ include file="../common/foot.jsp" %>