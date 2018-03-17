function showSecondLevel(num){
	var i;
	var list = Array(2 * (num + 1));
	
	for(i=0 ; i < 3 * (num + 1) ;i++){
		var string ="#"+i;
		list[i] = $(string).remove();
	}
	
	list[0].insertAfter($("#firstLevel1"));
	list[num + 1].insertAfter($("#firstLevel2"));
	list[2 * (num + 1)].insertAfter($("#firstLevel3"));


	$("#firstLevel1").change(function(){
		var text=$(this).find("option:selected").val();
		$("#firstLevel1 + select").remove();
		list[text].insertAfter($(this));
	
		});

	$("#firstLevel2").change(function(){
		var text=$(this).find("option:selected").val();
		$("#firstLevel2 + select").remove();
		list[1 + num + parseInt(text)].insertAfter($(this));
		});

	$("#firstLevel3").change(function(){
		var text=$(this).find("option:selected").val();
		$("#firstLevel3 + select").remove();
		list[2 * (1 + num) + parseInt(text)].insertAfter($(this));
		});
		
	$("#add").click(function(){
		if(!$("#add1").is(":visible"))
			$("#add1").removeClass("hide");
		
		else if(!$("#add2").is(":visible"))
			$("#add2").removeClass("hide");
		else
			alert("最多添加三个分类！");
		
		return false;
	});

	$("#delete1").click(function(){
		$("#firstLevel2 + select").remove();
		list[num + 1].insertAfter($("#firstLevel2"));
		$("#firstLevel2").val("0");
		$("#add1").addClass("hide");
		return false;
	})

	$("#delete2").click(function(){
		$("#firstLevel3 + select").remove();
		list[2 * (num + 1)].insertAfter($("#firstLevel3"));
		$("#firstLevel3").val("0");
		$("#add2").addClass("hide");
		return false;
	})
}

function keyWordCheck()
{
	$("#keyWord").blur(function(){
		var message = $("#message");
		if(this.value==""){
			var errorMsg = "*关键字不能为空!";
			message.text(errorMsg);
			message.css("color","red");
			$("#submitButton").bind("click",alertMessage = function(){
				alert("关键字不能为空！");
				return false;
			});
		}
		else{
			okMsg = "*ok";

			message.text(okMsg);
			message.css("color","green");
			$("#submitButton").unbind("click",alertMessage);
		}
	});
}

function buttonEffect()
{
	var fontColor = $("#submitButton").css("color");
	$("#submitButton").hover(function(){
		$(this).css("background","#006EA5")
				.css("color","white");
	},function(){
		$(this).css("background","none")
				.css("color",fontColor);
	});
}
