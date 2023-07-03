<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <!-- 파비콘 불러오기 -->
<link rel="shortcut icon" href="/resource/images/favicon.ico" />
<!-- 테일윈드 불러오기 -->
<!-- 노말라이즈, 라이브러리 -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/tailwindcss/2.2.7/tailwind.min.css" />
<!-- 데이지 UI -->
<link href="https://cdn.jsdelivr.net/npm/daisyui@2.31.0/dist/full.css" rel="stylesheet" type="text/css" />
<!-- 제이쿼리 불러오기 -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<!-- 폰트어썸 불러오기 -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css" />
    
    <title>Speech Application</title>
  </head>
  <body>
		
<style>
    @keyframes fadeIn {
      0% {
        opacity: 0;
      }
      100% {
        opacity: 1;
      }
    }

    .fade-in {
      animation: fadeIn 1s ease-in-out;
    }
  </style>
		
		<div id="text" class="fade-in"></div>

  <script>
    var textElement = document.getElementById("text");
    var text = "안녕하세요, 반갑습니다.";
    var delay = 100;

    function typeText(index) {
      if (index < text.length) {
        textElement.innerHTML += text.charAt(index);
        setTimeout(function() {
          typeText(index + 1);
        }, delay);
      }
    }

    setTimeout(function() {
      typeText(0);
    }, 1000);
  </script>
		
		
		
		
</body>
</html>