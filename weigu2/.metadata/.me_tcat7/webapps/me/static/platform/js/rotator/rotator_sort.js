function update_sort(obj,sort,id){
	var $td = $(obj).parent().prev();
	if($td.children("input").hasClass('input')){
		$td.html("");
		$td.html(sort);
		return;
	}
	else{
		$td.html("");
		$("<input type='text' class='input'/><input type='button' value='提交'>").appendTo($td);
		$input = $td.children("input.input");
		$btn = $input.next();
		$btn.attr("onclick","comite_sortby(this,"  + id + ")");
		$input.val(sort);
	}
}

function picture_del(obj,id){
	var rotatorID = '0';
	var pictureID = id;
	var sortby = '';
	var params = '';
	params += "picture.rotatorId=" + rotatorID + "&picture.id=" + pictureID + "&picture.sortby=" + sortby + "&";
	$.ajax({
		type:'POST',
		data:params,
		dataType:'json',
		url:baselocation+'/platform/picture/list/updateSortbyAndRotator',
		success:function(result){
			if(result.success==true){
				$("this").parent().remove();
				layer.msg('已修改!',{icon:1,time:1000});
				window.location.reload();
			}else{
				layer.alert(result.message, {icon: 2});
			}
		}
	})
}

function comite_sortby(obj,id){
	layer.confirm("确定要提交吗？",{btn:['确定','取消']},function(){
		var params = '';
		var sort = $(obj).prev().val();
		params += "picture.id=" + id + "&" + "picture.sortby=" + sort + "&";
		$.ajax({
			type:'POST',
			data:params,
			dataType:'json',
			url:baselocation+'/platform/rotator/list/sortUpdate',
			success:function(result){
				if(result.success==true){
					layer.msg('已修改!',{icon:1,time:1000});
					window.location.reload();
				}else{
					layer.alert(result.message, {icon: 2});
				}
			}
		})
	})
}

function db_update_sort(){
	alert("db_update_sort");
}

	function picture_delete(obj,id){
		layer.confirm('确定要删除吗？', {btn:['确定','取消']},function(){
			$.ajax({
				type:'GET',
				data:{id:id},
				dataType:'json',
				url:baselocation+'/platform/picture/list/delete',
				success:function(result){
					if(result.success==true){
						layer.msg('已删除!',{icon:1,time:1000});
						window.location.reload();
					}else{
						layer.alert(result.message, {icon: 2});
					}
				}
			})
		})
	}
	
$(document).ready(function(){
	$(".sort").dblclick(function(){
		var $td = $(this);
		var id = $(this).attr("id");
		var sortby = $td.html();
		$td.html("");
		$("<input type='text'>").appendTo($td)
								.val(sortby)
								.trigger("select")
								.trigger("focus")
								.blur(function(){
										var params = '';
										sortby = $td.children("input").val();
										params += "picture.id=" + id + "&" + "picture.sortby=" + sortby + "&";
										$.ajax({
											type:'POST',
											data:params,
											dataType:'json',
											url:baselocation+'/platform/rotator/list/sortUpdate',
											success:function(result){
												if(result.success==true){
													layer.msg('已修改!',{icon:1,time:1000});
													window.location.reload();
												}else{
													layer.alert(result.message, {icon: 2});
												}
											}
										})
								})
	})
})
	
	