<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>	
	
	<!--  푸터부분 -->
			<footer class="py-4 bg-light mt-auto">
				<div class="container-fluid px-4">
					<div
						class="d-flex align-items-center justify-content-between small">
						<div class="text-muted">Copyright &copy; Class Up 2022</div>
						
					</div>
				</div>
			</footer>
			
		</div> <!--  여기까지 콘텐트 + 푸터 부분 -->
		
		
	<!-- 부트스트랩 js -->	
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
		crossorigin="anonymous"></script>
		
	<!-- 템플릿 js -->	
	<script src="js/scripts.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js"
		crossorigin="anonymous"></script>
	<script src="/js/demo/chart-area-demo.js"></script>
	<script src="/js/demo/chart-bar-demo.js"></script>
	
	<!-- 표 / 페이징 관련 js -->
	<script src="js/simple-datatables.js" crossorigin="anonymous"></script>
	<script src="js/datatables-simple-demo.js"></script>
	
	
	<script>
$(".hongtable").tableExport({formats: ["xlsx"],    });
$(".fc-scrollgrid").tableExport({formats: ["xlsx"],    });
</script>
<script type="text/javascript">

  var _gaq = _gaq || [];
  _gaq.push(['_setAccount', 'UA-36251023-1']);
  _gaq.push(['_setDomainName', 'jqueryscript.net']);
  _gaq.push(['_trackPageview']);

  (function() {
    var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
    ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
    var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
  })();

</script>
	
	<script>
	


      $( function() {
    	  $( "#datepicker" ).datepicker({
    		showAnim:"slideDown",
    		showMonthAfterYear : true,	//년도 월 순서로
    		dateFormat : 'yy-mm-dd',	//선택된 날짜데이터 년월일 순서로
    		changeMonth : true,			// 월 변경 가능하게
    		monthNamesShort: ['1월', '2월', '3월', '4월', '5월', '6월', 
    					'7월', '8월', '9월', '10월', '11월', '12월'],		// 월을 한글로
    		dayNamesMin: [ '일', '월', '화', '수', '목', '금', '토' ], //요일을 한글로
    	  } );
    	 
      } );
      
	   // 다크모드 버튼 (흰배경+검정배경)
	      let $darkModeBtn = document.querySelector('.darkmode');
	      let nvlight = document.querySelector('.sb-sidenav-light');
	      let bgsclass = document.querySelector('.bg-sclass');
	      let body = document.querySelector('#layoutSidenav_content');
	      let card = document.querySelectorAll('.card');
	      let buttonb = document.getElementsByClassName('hong_btn_blue');	 
	      let buttonr = document.getElementsByClassName('hong_btn_red');	 
	      let foot = document.querySelector('footer');
	      let table = document.querySelectorAll('.hongtable');
	      let moon = document.querySelector('.moon');

	      let headimg = document.querySelector('.headimg');
	 	  let headp = document.querySelector('.headp');
	 	 
	      	 
	      // 검정배경 버튼
	      let dark = 'on'; //불값을 저장하여 온오프기능 구현	
	       
	      if(window.localStorage.getItem("darkmode") != null){
	      	dark = window.localStorage.getItem("darkmode");
	      }  
	       
	       
	      if( dark == 'off' ){
	      	foot.removeAttribute('class');
	      	body.setAttribute('class', 'darkmodebg');
	          nvlight.setAttribute('class', 'sb-sidenav accordion sb-sidenav-dark');
	          bgsclass.setAttribute('class', 'sb-topnav navbar navbar-expand navbar-dark bg-dark');
	          for (let i = 0; i<table.length; i++ ){
	          	table[i].setAttribute('style', 'color:#e0e0e0');
	          }
	              
	          for (let i = 0; i<buttonb.length; i++ ){
	          	buttonb[i].style.backgroundColor = "#222278";  
	          }
	          for (let i = 0; i<buttonr.length; i++ ){
	          	buttonr[i].style.backgroundColor = "#b53c60";  
	          } 
	          for(let i = 0; i<card.length; i++ ){
	              card[i].setAttribute('class', 'card mb-4 text-white bg-secondary');
            	  
              } 
	          moon.setAttribute('class', 'darkmoon');
	          document.getElementById("moon").src="img/whitemoon.png";

	          headimg.setAttribute('style', 'display:none');
	          headp.setAttribute('style', 'display:inline-block');
	          
	      } else {
	         	foot.setAttribute('class', 'py-4 bg-light mt-auto');
	          body.setAttribute('class', '');
	          nvlight.setAttribute('class', 'sb-sidenav accordion sb-sidenav-light');
	          bgsclass.setAttribute('class', 'sb-topnav navbar navbar-expand navbar-dark bg-sclass');
	          for(let i = 0; i<card.length; i++ ){
		          card[i].setAttribute('class', 'card mb-4');            	  
              } 
	              
	          for (let i = 0; i<buttonb.length; i++ ){
	          	buttonb[i].setAttribute('style', 'background:#bfb3fd');           	  
	          }
	          for (let i = 0; i<buttonr.length; i++ ){
	          	buttonr[i].setAttribute('style', 'background:#ff6493');        	  
	          } 
	          for (let i = 0; i<table.length; i++ ){
	          	table[i].setAttribute('style', 'color:#212529');
	          }
	          moon.setAttribute('class', '');
	          document.getElementById("moon").src="img/darkmoon.png";
	          
	          headimg.setAttribute('style', 'display:inline-block');
	          headp.setAttribute('style', 'display:none');
	          
	          
	      }
	            
	        
	      $darkModeBtn.addEventListener('click', () => {
	      	if(dark == 'on'){
	      		dark='off';
	          }else{
	          	dark = 'on';
	          }
	          	
	          window.localStorage.setItem("darkmode",dark);  // localStorage 사용해서 값 저장
	      	  console.log(moon)
	      			
	         if( dark == 'off' ){
	          	  foot.removeAttribute('class');
	              body.setAttribute('class', 'darkmodebg');
	              nvlight.setAttribute('class', 'sb-sidenav accordion sb-sidenav-dark');
	              bgsclass.setAttribute('class', 'sb-topnav navbar navbar-expand navbar-dark bg-dark');
	              for(let i = 0; i<card.length; i++ ){
		              card[i].setAttribute('class', 'card mb-4 text-white bg-secondary');
	            	  
	              }
	              
	              for (let i = 0; i<table.length; i++ ){
	        	    	table[i].setAttribute('style', 'color:#e0e0e0');
	      		  }
	              for (let i = 0; i<buttonb.length; i++ ){
	      			buttonb[i].style.backgroundColor = "#222278";  
	              }
	              for (let i = 0; i<buttonr.length; i++ ){
	      			buttonr[i].style.backgroundColor = "#b53c60";  
	              }
	              moon.setAttribute('class', 'darkmoon');
	              document.getElementById("moon").src="img/whitemoon.png";
	              headimg.setAttribute('style', 'display:none');
	              headp.setAttribute('style', 'display:inline-block');
		          
		          
	      	} else {
	          	  foot.setAttribute('class', 'py-4 bg-light mt-auto');
	              body.setAttribute('class', '');
	              nvlight.setAttribute('class', 'sb-sidenav accordion sb-sidenav-light');
	              bgsclass.setAttribute('class', 'sb-topnav navbar navbar-expand navbar-dark bg-sclass');
		          
	              for (let i = 0; i<buttonb.length; i++ ){
	              	buttonb[i].setAttribute('style', 'background:#bfb3fd');           	  
	      		  }
	              for (let i = 0; i<buttonr.length; i++ ){
	              	buttonr[i].setAttribute('style', 'background:#ff6493');        	  
	              } 
	              for (let i = 0; i<table.length; i++ ){
	              	table[i].setAttribute('style', 'color:#212529');
	              }
		          for(let i = 0; i<card.length; i++ ){
			          card[i].setAttribute('class', 'card mb-4');            	  
	              }
		          moon.setAttribute('class', '');
		          document.getElementById("moon").src="img/darkmoon.png";
		          
		          headimg.setAttribute('style', 'display:inline-block');
		          headp.setAttribute('style', 'display:none');
		          
		          
	      	}
	      });    
	
	   // 공백확인
	  function check(){
	      	
	      	if( $('[name=class_name]').val()=='' ){
	      		alert('클래스명을 입력해주세요');
	      		$('[name=class_name]').focus();
	      		return false;
	      		
	      	}else if( $('[name=test_name]').val()=='' ){
	      		alert('테스트명을 입력해주세요');
	      		$('[name=test_name]').focus();
	      		return false;
	      	}else if( $('[name=test_date]').val()=='' ){
	      		alert('날짜를 입력해주세요');
	      		$('[name=test_date]').focus();
	      		return false;
	      	}else if( $('[name=homework_name]').val()=='' ){
	      		alert('과제명을 입력해주세요');
	      		$('[name=homework_name]').focus();
	      		return false;
	      	}else{
		      	return true;
      		}	      	
	   }	      
	        
	</script>
	
	