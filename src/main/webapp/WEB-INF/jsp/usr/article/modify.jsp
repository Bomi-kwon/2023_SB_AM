<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="pageTitle" value="Modify" />
<%@ include file="../common/head.jsp" %>

	<section class="mt-8 text-xl">
		<div class="container mx-auto px-3">
			<form action="doModify" id="form">
			<div class="table-box-type-1 overflow-x-auto">
			<input type="hidden" name="id" value="${article.id }"/>
					<table border="1" class="mx-auto able w-full">
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
						<td><input class="input input-bordered input-success w-full" type="text" name="title" value="${article.title }" placeholder="제목을 입력해주세요."/></td>
					</tr>
					<tr>
						<th>내용</th>
						<td><div id="editor" class="bg-white">${article.getForPrintBody() }</div></td>
					</tr>
					<tr>
						<td colspan="2"><button id="btn-getHtml" class="btn btn-outline btn-success">수정</button></td>
					</tr>
				</table>
			</div>
				</form>
		</div>
	</section>
			<div class="btns">
				<button class="btn-text-link btn btn-outline btn-success" type="button" onclick="history.back();">뒤로</button>
			</div>
			
	<script>
		const Editor = toastui.Editor;
		
		window.dataStorage = {
			    _storage: new WeakMap(),
			    put: function (element, key, obj) {
			        if (!this._storage.has(element)) {
			            this._storage.set(element, new Map());
			        }
			        this._storage.get(element).set(key, obj);
			    },
			    get: function (element, key) {
			        return this._storage.get(element).get(key);
			    },
			    has: function (element, key) {
			        return this._storage.has(element) && this._storage.get(element).has(key);
			    },
			    remove: function (element, key) {
			        var ret = this._storage.get(element).delete(key);
			        if (!this._storage.get(element).size === 0) {
			            this._storage.delete(element);
			        }
			        return ret;
			    }
			}
		
		
		function Editor__init(){
			  const editorEl = document.querySelector('#editor');
			  const editor = new Editor({
			    el: editorEl,
			    height: '500px',
			    initialEditType: 'markdown',
			    previewStyle: 'tab'
			  });
			  
			  dataStorage.put(editorEl, 'editor', editor);
			}
		
		Editor__init();

		const btnGetHtmlEl = document.querySelector('#btn-getHtml');

		btnGetHtmlEl.addEventListener('click', () => {
		  const editorEl = document.querySelector('#editor');
		  const editor = dataStorage.get(editorEl, 'editor');
		  $('#form').append(`
					<input type="hidden" name="body" value="` + editor.getMarkdown() + `"/>
					`);
		})
		
		
	</script>
	
<%@ include file="../common/foot.jsp" %>