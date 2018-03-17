function pagingEffect()
{
	var fontColor = $(".button").css("color");
	$(".button").hover(function(){
		$(this).css("background","#006EA5")
				.css("color","white");
	},function(){
		$(this).css("background","none")
				.css("color",fontColor);
	});
}