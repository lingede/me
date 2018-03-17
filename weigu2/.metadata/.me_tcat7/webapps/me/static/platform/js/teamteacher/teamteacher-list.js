// 日期插件
$(document).ready(function () {
	$("body").delegate("td","dblclick",function(){
		var $td=$(this);
		var tdId=$td.attr("id");
		if(tdId=="sortby"){
			 var myval=$td.html();
			 $td.html("");
			 $("<input style='width:20px' type='text'>").appendTo($td)
			                         .val(myval)
			                         .trigger("focus")
			                         .trigger("select")
			                         .dblclick(function(){
			                        	 return false;
			                         })
			                         .blur(function(){
			                        	 var txtVal=$(this).val();
			                        	 $td.html(txtVal);
			                        	 var $tr=$td.parent();
			                        	 var teacherid=$tr.attr("id");                   	 
			                             var sortby=$tr.find("#sortby").html();
			                             
			                             $.ajax({
			                     			type:'post',
			                     			dataType:'json',
			                     			url:baselocation+'/platform/teamteacher/list/'+teacherid+'/'+$("#teamId").val()+'/'+sortby+'/sortBy',
			                     			success:function(result){
			                     				if (result.success == true) {
				                					parent.layer.msg(result.message, {
				                						shade : 0.3,
				                						time : 1500
				                					});
				                				} else {
				                					layer.msg(result.message, {
				                						icon : 2,
				                						time : 1000
				                					});
				                					window.location.reload(); 
				                				}
			                     			}
			                     		})
			                         })
		}
	});
})

/*用户-删除*/
function member_del(obj,id){
	layer.confirm('确认要删除此成员吗？',{btn: ['确定','取消'] //按钮
	}, function(){
		$.ajax({
			type:'delete',
			dataType:'json',
			url:baselocation+'/platform/teamteacher/list/'+id+'/'+$("#teamId").val()+'/delete',
			success:function(result){
				if(result.success==true){
					window.location.reload()
					layer.msg('已删除!',{icon:1,time:1000});
				}else{
					layer.alert(result.message, {icon: 2});
				}
			}
		})
	});
}
    
/*用户-查看*/
function member_show(title,url,id,ope,w,h){
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

