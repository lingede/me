/*查看*/
function teachercategory_showteacher(title,url,id,ope,w,h){
	
	if(id == null){
		layer_show(title,url,w,h);
	}else{
		layer_show(title,url+'/'+id+'/'+ope,w,h);
	}
	
}
/*关联-删除*/
function categoryhasteacher_del(obj,id){
	layer.confirm('确认要删除吗？',{btn: ['确定','取消'] //按钮
	}, function(){
		$.ajax({
			type:'delete',
			dataType:'json',
			url:baselocation+'/platform/teachercategory/list/'+id+'/deleteteacher',
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

/**修改排序值
 */
$(function(){

	$("body").delegate("td","dblclick",function(){
	   
		var $td=$(this);
		var tdId=$td.attr("id");
		if(tdId=="rank"){
			 var myval=$td.html();
			 $td.html("");
			 $("<input type='text'>").appendTo($td)
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
			                        	 var mid=$tr.attr("id");                   	 
			                             var mrank=$tr.find("#rank").html();
			                             
			                        	 $.get(baselocation+'/platform/teachercategory/list/updaterank?v='+Math.random(),{"id":mid,"rank":mrank}, function(result) {
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
			                			});
			                         })
		}
	});
})