<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="pageTitle" value="Write" />
<%@ include file="../common/head.jsp" %>


	<section class="mt-8 text-xl">
		<div class="container mx-auto px-3">
			<form action="doWrite" onsubmit="logincheck(this); return false;">
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
						<td><input class="input input-bordered input-success w-full" type="text" name="title" placeholder="제목을 입력해주세요." required/></td>
					</tr>
					<tr>
						<th>내용</th>
						<td>
							<div id="editor" class="bg-white"></div>
							<button id="btn-getHtml">불러오기</button>
						</td>
					</tr>
					<tr>
						<td colspan="2"><button class="btn btn-success">작성</button></td>
					</tr>
				</table>
			</div>
				</form>
			<div class="btns flex justify-start">
				<button class="btn-text-link btn btn-success" type="button" onclick="history.back();">뒤로</button>
			</div>
		</div>
	</section>
	
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


		const btnGetHtmlEl = document.querySelector('#btn-getHtml');

		btnGetHtmlEl.addEventListener('click', () => {
		  const editorEl = document.querySelector('#editor');
		  const editor = dataStorage.get(editorEl, 'editor');
		  
		  //얘를 body에 넣어줘야함!!
		  alert(editor.getMarkdown());
		})

		Editor__init();
	</script>
			
	
<%@ include file="../common/foot.jsp" %>