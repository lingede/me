$(document).ready(function () {
	$('.dropEffect').hover(
		function(){
			var temp=$(this).find('li').size()*40+"px";
			$(this).css('background','#eee').children('ul').stop().animate({height:temp},200);
		},function(){
			$(this).css('background','white').children('ul').stop().animate({height:"0px"},200);
		}
	);
	
	$('.dropEffect>ul li').hover(function(){
		$(this).css('background','#eee');
	},function(){
		$(this).css('background','white');
	});

	var _article = $("#article").height();
	var _newsList = $("#newsList ul").height();
	if (_article > _newsList) {
		$("#newsList ul").height(_article);	
	}
});
