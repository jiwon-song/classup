/**
 * 공통 함수
 */
	
function center( tag ){
	//background 크기 계산
	var width = Math.max( $(window).width(), $('body').prop('scrollWidth') );
	var height = Math.max( $(window).height(), $('body').prop('scrollHeight') );
	$('#popup-background')
		.css({ 'width': width, 'height': height });
	
	var left = ($(window).width() - tag.width())/2 
						+ $(window).scrollLeft();
	var top = ($(window).height() - tag.height())/2 
						+ $(window).scrollTop();
	tag.removeClass('center')
	   .css( { 'left':left, 'top': top, 'position':'absolute'} );
}

function emptyCheck(){
	var ok = true;
	$('.chk').each(function(){
		if( $(this).val()=='' ){
			var item = $(this).attr('placeholder') 
						? $(this).attr('placeholder') 
						: $(this).attr('title');
			alert(item + ' 입력하세요!');
			$(this).focus();
			ok = false;
			return ok;
		}
	});
	return ok;
}