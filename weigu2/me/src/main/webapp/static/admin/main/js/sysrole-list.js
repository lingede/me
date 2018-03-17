
/*角色-删除*/
function role_del(obj,id){
	layer.confirm('确认要删除吗？',{btn: ['确定','取消'] //按钮
	}, function(){
		$.ajax({
			type:'delete',
			dataType:'json',
			url:baselocation+'/system/sysrole/list/'+id+'/delete',
			success:function(result){
				if(result.success==true){
					$(obj).parents("tr").remove();
					layer.msg('已删除!',{icon:1,time:1000});
				}else{
					layer.alert(result.message, {icon: 2});
				}
			}
		})
	});
}
/*角色-冻结*/
function role_stop(obj,id){
	layer.confirm('确认要冻结吗？',{btn: ['确定','取消'] //按钮
	}, function(){
		$.ajax({
			data:{'roleId':id,'status':0},
			dataType:'json',
			type:'post',
			url:baselocation+'/system/sysrole/list/audit',
			success:function(result){
				if(result.success==true){
					$(obj).parents("tr").find(".td-manage").prepend('<a class="like text-info" href="javascript:void(0)" onClick="role_start(this,'+id+')" title="启用"><i class="glyphicon glyphicon-play"></i></a>');
					$(obj).parents("tr").find(".td-status").html('<span class="label label-danger">冻结</span>');
					$(obj).remove();
					layer.msg('已冻结!',{icon: 5,time:1000});
				}else{
					layer.alert(result.message, {icon: 2});
				}
			}
		})
	});
}
        
/*角色-启用*/
function role_start(obj,id){
	layer.confirm('确认要启用吗？',{btn: ['确定','取消'] //按钮
	}, function(){
		$.ajax({
			data:{'roleId':id,'status':1},
			dataType:'json',
			type:'post',
			url:baselocation+'/system/sysrole/list/audit',
			success:function(result){
				if(result.success==true){
					$(obj).parents("tr").find(".td-manage").prepend('<a class="like text-info" href="javascript:void(0)" onClick="role_stop(this,'+id+')" title="冻结"><i class="glyphicon glyphicon-pause"></i></a>');
					$(obj).parents("tr").find(".td-status").html('<span class="label label-primary">正常</span>');
					$(obj).remove();
					layer.msg('已启用!',{icon: 6,time:1000});
				}else{
					layer.alert(result.message, {icon: 2});
				}
			}
		})
	});
}

/*角色-查看*/
function role_show(title,url,id,ope,w,h){
	if(id == null){
		layer_show(title,url,w,h);
	}else{
		layer_show(title,url+'/'+id+'/'+ope,w,h);
	}
}
    
/*弹出层*/
/*
	参数解释：
	title	标题
	url		请求的url
	id		需要操作的数据id
	w		弹出层宽度（缺省调默认值）
	h		弹出层高度（缺省调默认值）
*/
function layer_show(title,url,w,h){
	if (title == null || title == '') {
		title=false;
	};
	if (w == null || w == '') {
		w=800;
	};
	if (h == null || h == '') {
		h=($(window).height() - 50);
	};
	layer.open({
		type: 2,
		area: [w+'px', h +'px'],
		fix: false, //不固定
		maxmin: true,
		scrollbar: false,//屏蔽游览器滚动条
		shade:0.4,
		title: title,
		content: url
	});
}
/*关闭弹出框口*/
function layer_close(){
	var index = parent.layer.getFrameIndex(window.name);
	parent.layer.close(index);
}

//拖动面板
$(document).ready(function () {
    $(".sortable-list").sortable({
        connectWith: ".connectList"
    }).disableSelection();

});

