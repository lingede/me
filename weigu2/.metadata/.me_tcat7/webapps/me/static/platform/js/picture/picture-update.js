$(function() {
	$(".Picturesubmit").click(function() {
		var params = '';
		params += "picture.info=" + $("#Pictureform textarea").val() + "&";
		$("#Pictureform input").each(function() {
			params += $(this).serialize() + "&";
		});
		$.ajax({
			data : params,
			async:false,
			dataType : 'json',
			type : 'post',
			url : baselocation + '/platform/picture/list/update',
			success : function(result) {
				if (result.success == true) {
					parent.layer.msg(result.message, {
						shade : 0.3,
						time : 1500
					}, function() {
						window.parent.location.reload(); // 刷新父页面
					});
				} else {
					layer.msg(result.message, {
						icon : 2,
						time : 3000
					});
				}
			}
		})
	})
})

/*图片描述-修改*/
function des_update(obj,id){
	layer.confirm('确认要修改吗？',{btn:['确定','取消']},function(){
		$.ajax({
			type:'GET',
			dataType:'json',
			url:baselocation+'/platform/picture/list/'+id+'/info',
			success:function(result){
				if(result.success==true){
					window.location.reload();
					layer.msg('更新成功!',{icon:1,time:1000});
				}else{
					layer.alert(result.message, {icon: 2});
				}
			}
		})
	});
}      