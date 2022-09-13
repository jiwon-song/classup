<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

</div>
<!--  여기까지 콘텐트 + 푸터 부분 -->

<!-- 부트스트랩 js -->
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
	crossorigin="anonymous"></script>

<!-- 템플릿 js -->
<script src="js/scripts.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js"
	crossorigin="anonymous"></script>
<script src="js/demo/chart-area-demo.js"></script>
<script src="js/demo/chart-bar-demo.js"></script>

<!-- 표 / 페이징 관련 js -->
<script src="js/simple-datatables.js" crossorigin="anonymous"></script>
<script src="js/datatables-simple-demo.js"></script>



<script>
		
	 // 다크모드 버튼 (흰배경+검정배경)
	 let $darkModeBtn = document.querySelector('.darkmode');
	 let bgb = document.querySelector('.bgb');
	 let slide = document.querySelector('.slide');
	 let nvlight = document.querySelector('.sb-sidenav-light');
	 let bgsclass = document.querySelector('.bg-sclass');
	 let rgyPostIt = document.querySelector('.rgyPostIt');
	 let playBtn = document.querySelector('.playmode');
	 let moon = document.querySelector('.moon');

     let headimg = document.querySelector('.headimg');
	 let headp = document.querySelector('.headp');

	 let dark = 'on'; //불값을 저장하여 온오프기능 구현	
	 let play = false;
	 if(window.localStorage.getItem("darkmode") != null){
		 dark = window.localStorage.getItem("darkmode");
	 }  
	 
	 
	  if( dark == 'off' ){
	        
          bgb.setAttribute('class', 'bgb bgbblack');
          nvlight.setAttribute('class', 'sb-sidenav accordion sb-sidenav-dark');
          bgsclass.setAttribute('class', 'sb-topnav navbar navbar-expand navbar-dark bg-dark');
          rgyPostIt.setAttribute('class', 'rgyPostItdark');
          document.getElementById("bp").src="img/bg-board.jpg";
          document.getElementById("bp").setAttribute('style', 'opacity:0.3');
          moon.setAttribute('class', 'darkmoon');
          document.getElementById("moon").src="img/whitemoon.png";

          headimg.setAttribute('style', 'display:none');
          headp.setAttribute('style', 'display:inline-block');
          
        } else {
         
          bgb.setAttribute('class', 'bgb bgbwhite');
          slide.setAttribute('class', 'slide fc-w');
          nvlight.setAttribute('class', 'sb-sidenav accordion sb-sidenav-light');
          bgsclass.setAttribute('class', 'sb-topnav navbar navbar-expand navbar-dark bg-sclass');
          rgyPostIt.setAttribute('class', 'rgyPostIt');
          document.getElementById("bp").src="img/bg-board.jpg";
          document.getElementById("bp").setAttribute('style', 'opacity:0.8');
          moon.setAttribute('class', '');
          document.getElementById("moon").src="img/darkmoon.png";

	 	 
          headimg.setAttribute('style', 'display:inline-block');
          headp.setAttribute('style', 'display:none');
          
        }
       
		// 다크모드
	    $darkModeBtn.addEventListener('click', () => {
	    	if(dark == 'on'){
	    		dark='off';
	    	}else{
	    		dark = 'on';
	    	}
	    	
	      	window.localStorage.setItem("darkmode",dark);
			

	        if( dark == 'off' ){
	        
	          bgb.setAttribute('class', 'bgb bgbblack');
	          slide.setAttribute('class', 'slide fc-w');
	          nvlight.setAttribute('class', 'sb-sidenav accordion sb-sidenav-dark');
	          bgsclass.setAttribute('class', 'sb-topnav navbar navbar-expand navbar-dark bg-dark');
	          rgyPostIt.setAttribute('class', 'rgyPostItdark');
	          document.getElementById("bp").src="img/bg-board.jpg";
	          document.getElementById("bp").setAttribute('style', 'opacity:0.3');
	          moon.setAttribute('class', 'darkmoon');
	          document.getElementById("moon").src="img/whitemoon.png";

	          headimg.setAttribute('style', 'display:none');
	          headp.setAttribute('style', 'display:inline-block');
	          
	        } else {
	         
	          bgb.setAttribute('class', 'bgb bgbwhite');
	          nvlight.setAttribute('class', 'sb-sidenav accordion sb-sidenav-light');
	          bgsclass.setAttribute('class', 'sb-topnav navbar navbar-expand navbar-dark bg-sclass');
	          rgyPostIt.setAttribute('class', 'rgyPostIt');
	          document.getElementById("bp").src="img/bg-board.jpg";
	          document.getElementById("bp").setAttribute('style', 'opacity:0.8');
	          moon.setAttribute('class', '');
	          document.getElementById("moon").src="img/darkmoon.png";
	          
	          headimg.setAttribute('style', 'display:inline-block');
	          headp.setAttribute('style', 'display:none');
	        }
	      });
	
		
	    playBtn.addEventListener('click', () => {
	    	
	    	play = !play;
	    	
	    	if(play){
	    		document.getElementById("video").setAttribute('style', 'opacity:1');
	            document.getElementById("bp").setAttribute('style', 'opacity:0');
	            rgyPostIt.setAttribute('style','opacity:0');
	    	}else{
	    		document.getElementById("video").setAttribute('style', 'opacity:0');
	            document.getElementById("bp").setAttribute('style', 'opacity:0.8');
	            rgyPostIt.setAttribute('style','opacity:1');
	    	}
	    
	    
	    
	    });
	
	</script>