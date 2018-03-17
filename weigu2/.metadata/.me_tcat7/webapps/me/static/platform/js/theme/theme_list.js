// 日期插件
$(document).ready(function () {
	$('#data_5 .input-daterange').datepicker({
		keyboardNavigation: false,
		forceParse: false,
		autoclose: true,
		format: 'yyyy/mm/dd',  
	});
})

/*主题采用*/
function member_apply(obj,id){
	layer.confirm('确定采用吗?', {btn:['确定','取消']},function(){
		$.ajax({ url: baselocation + '/platform/theme/list/'+id+'/apply',
			dataType: "json", 
			success: function(result){
				if(result.success == true){
					layer.msg('已采用',{icon:1,time:1000});
					window.location.reload(); 
				}
				else{
					layer.alert(result.message,{icon:2});
				}
			}
		});
	})
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

