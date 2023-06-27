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
		
		
		<div>음성 인식 테스트</div>
		<div class="words"></div>
		
		
		<script>
		window.SpeechRecognition =
			  window.SpeechRecognition || window.webkitSpeechRecognition;

			// 인스턴스 생성
			const recognition = new SpeechRecognition();

			// true면 음절을 연속적으로 인식하나 false면 한 음절만 기록함
			recognition.interimResults = true;
			
			// 값이 없으면 HTML의 <html lang="en">을 참고합니다. ko-KR, en-US
			recognition.lang = "ko-KR";
			
			// true means continuous, and false means not continuous (single result each time.)
			// true면 음성 인식이 안 끝나고 계속 됩니다.
			recognition.continuous = true;
			
			// 숫자가 작을수록 발음대로 적고, 크면 문장의 적합도에 따라 알맞은 단어로 대체합니다.
			// maxAlternatives가 크면 이상한 단어도 문장에 적합하게 알아서 수정합니다.
			recognition.maxAlternatives = 10000;

			let p = document.createElement("p");
			p.classList.add("para");

			let words = document.querySelector(".words");
			words.appendChild(p);

			let speechToText = "";
			
			recognition.addEventListener("result", (e) => {
			  let interimTranscript = "";
			  
			  for (let i = e.resultIndex, len = e.results.length; i < len; i++) {
				  
			    let transcript = e.results[i][0].transcript;
			    console.log(transcript);
			    if (e.results[i].isFinal) {
			      speechToText += transcript;
			    } else {
			      interimTranscript += transcript;
			    }
			    
			  }
			  document.querySelector(".para").innerHTML = speechToText + interimTranscript;
			});

			// 음성인식이 끝나면 자동으로 재시작합니다.
			// recognition.addEventListener("end", recognition.start);

			// 음성 인식 시작
			recognition.start();
		
		
		</script>
		
</body>
</html>