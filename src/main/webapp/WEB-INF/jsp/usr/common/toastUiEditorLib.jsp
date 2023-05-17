<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    <!-- 토스트 UI 에디터 코어 -->
<script src="https://uicdn.toast.com/editor/latest/toastui-editor-all.min.js"></script>
<link rel="stylesheet" href="https://uicdn.toast.com/editor/latest/toastui-editor.min.css" />

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
		    previewStyle: 'tab',
		    placeholder: '내용을 입력해주세요.'
		  });
		  
		  dataStorage.put(editorEl, 'editor', editor);
		}
	
	Editor__init();
	
	function Viewer__init(){
		  const editorEl = document.querySelector('#viewer');
		  const editor = new Editor({
		    el: editorEl,
		    viewer:true
		  });
		  
		  dataStorage.put(editorEl, 'editor', editor);
		}
	
	Viewer__init();

	const btnGetHtmlEl = document.querySelector('#btn-getHtml');

	btnGetHtmlEl.addEventListener('click', () => {
	  const editorEl = document.querySelector('#editor');
	  const editor = dataStorage.get(editorEl, 'editor');
	  $('#form').append(`
				<input type="hidden" name="body" value="` + editor.getMarkdown() + `"/>
				`);
	})
	
	
</script>