<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="pageTitle" value="Write" />
<%@ include file="../common/head.jsp" %>



	<section class="mt-8 text-xl">
		<div class="container mx-auto px-3">
			<form action="doWrite" id="form">
			<div class="table-box-type-1 overflow-x-auto">
					<table border="1" class="mx-auto able w-full">
					<colgroup>
						<col width="100"/>
						<col width="700"/>
					</colgroup>
					<tr>
						<th>게시판 선택</th>
						<td>
						<label>
							<input type="radio" name="boardId" value="1" />
							&nbsp;공지사항
						</label>
						&nbsp;&nbsp;&nbsp;&nbsp;
						<label>
							<input type="radio" name="boardId" value="2" checked />
							&nbsp;자유게시판
						</label>
						</td>
					</tr>
					<tr>
						<th>제목</th>
						<td><input class="input input-bordered input-success w-full" type="text" id="title" 
						name="title" placeholder="제목을 입력해주세요." required/></td>
					</tr>
					<tr>
						<th>내용</th>
						<td>
							<div id="editor" class="bg-white"></div>
						</td>
					</tr>
					<tr>
						<td colspan="2"><button id="btn-getHtml" class="btn btn-success" onsubmit="writeeditor();">작성</button></td>
					</tr>
				</table>
			</div>
				</form>
			<div class="btns flex justify-start">
				<button class="btn-text-link btn btn-success" type="button" onclick="history.back();">뒤로</button>
			</div>
		</div>
	</section>
	
<%@ include file="../common/toastUiEditorLib.jsp" %>	
<%@ include file="../common/foot.jsp" %>