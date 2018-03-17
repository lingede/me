// 日期插件
$(document).ready(function () {
	$('#data_5 .input-daterange').datepicker({
		keyboardNavigation: false,
		forceParse: false,
		autoclose: true,
		format: 'yyyy/mm/dd',  
	});
})

/*新闻-发布*/
function news_publish(obj,id){
	layer.confirm('确认要发布吗？',{btn: ['确定','取消']
	},function(){
		$.ajax({
			type:'get',
			dataType:'json',
			url:baselocation+'/platform/categoryhasarticle/list/'+id+'/updstate',
			success:function(result){
				if(result.success==true){
					layer.msg('已发布!',{icon: 1,time:1000}, function() {
						window.location.reload(); // 刷新父页面
					});
				}else{
					layer.alert(result.message, {icon: 2});
				}
			}
		})
	});
}
/*新闻-预览*/
function news_preview(obj,id){
	layer.confirm('确认要发布吗？',{btn: ['确定','取消']
	},function(){
		$.ajax({
			type:'get',
			dataType:'json',
			url:baselocation+'/platform/categoryhasarticle/list/'+id+'/updstate',
			success:function(result){
				if(result.success==true){
					layer.msg('已发布!',{icon: 1,time:1000}, function() {
						window.location.reload(); // 刷新父页面
					});
				}else{
					layer.alert(result.message, {icon: 2});
				}
			}
		})
	});
}
/*新闻-回退*/
function news_back(obj,id){
	layer.confirm('确认要回退吗？',{btn: ['确定','取消']
	},function(){
		$.ajax({
			type:'get',
			dataType:'json',
			url:baselocation+'/platform/categoryhasarticle/list/'+id+'/upstate',
			success:function(result){
				if(result.success==true){
					layer.msg('已回退!',{icon: 1,time:1000}, function() {
						window.location.reload(); // 刷新父页面
					});
				}else{
					layer.alert(result.message, {icon: 2});
				}
			}
		})
	});
}
/*新闻-置顶*/
function news_toTop(obj,id){
	layer.confirm('确认要置顶吗？',{btn: ['确定','取消']
	},function(){
		$.ajax({
			type:'get',
			dataType:'json',
			url:baselocation+'/platform/categoryhasarticle/list/'+id+'/toTop',
			success:function(result){
				if(result.success==true){
					layer.msg('已置顶!',{icon: 1,time:1000}, function() {
						window.location.reload(); // 刷新父页面
					});
				}else{
					layer.alert(result.message, {icon: 2});
				}
			}
		})
	});
}
/*新闻-取消发布*/
function news_cancel(obj,id){
	layer.confirm('确认要取消发布吗？',{btn: ['确定','取消']
	},function(){
		$.ajax({
			type:'get',
			dataType:'json',
			url:baselocation+'/platform/categoryhasarticle/list/'+id+'/cancel',
			success:function(result){
				if(result.success==true){
					layer.msg('已取消发布!',{icon: 1,time:1000}, function() {
						window.location.reload(); // 刷新父页面
					});
				}else{
					layer.alert(result.message, {icon: 2});
				}
			}
		})
	});
}
/*新闻-首页轮播*/
function news_play(obj,id){
	layer.confirm('确认要加入首页轮播吗？',{btn: ['确定','取消'] //按钮
	}, function(){
		$.ajax({
			type:'delete',
			dataType:'json',
			url:baselocation+'/platform/categoryhasarticle/list/'+id+'/play',
			success:function(result){
				if(result.success==true){
					layer.msg('已加入首页轮播!',{icon: 1,time:1000}, function() {
						window.location.reload(); // 刷新父页面
					});
				}else{
					layer.alert(result.message, {icon: 2});
				}
			}
		})
	});
}
/*新闻-重新审核*/
function news_recheck(obj,id){
	layer.confirm('确认要重新审核吗？',{btn: ['确定','取消']
	},function(){
		$.ajax({
			type:'get',
			dataType:'json',
			url:baselocation+'/platform/categoryhasarticle/list/'+id+'/cancel',
			success:function(result){
				if(result.success==true){
					layer.msg('已重新审核!',{icon: 1,time:1000}, function() {
						window.location.reload(); // 刷新父页面
					});
				}else{
					layer.alert(result.message, {icon: 2});
				}
			}
		})
	});
}
/*新闻-删除*/
function news_del(obj,id){
	layer.confirm('确认要删除吗？',{btn: ['确定','取消'] //按钮
	}, function(){
		$.ajax({
			type:'delete',
			dataType:'json',
			url:baselocation+'/platform/categoryhasarticle/list/'+id+'/delete',
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
/*图片-查看*/
function showimage(url){
	layer.open({
		  type: 1,
		  skin: 'layui-layer-demo', //样式类名
		  closeBtn: 0, //不显示关闭按钮
		  anim: 2,
		  shadeClose: true, //开启遮罩关闭
		  content: "<img src="+baselocation+"/"+url+"></img>"
		});

}
/*菜单-查看*/
function news_show(title,url,id,ope,w,h){
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

