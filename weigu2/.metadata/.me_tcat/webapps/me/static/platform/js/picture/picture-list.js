$(document).ready(function () {
})

function member_apply(obj,id){
	$.ajax({
		type:'get',
		dataType:'json',
		url:baselocation+'/platform/picture/test',
		success:function(result){
		}
	})
}
  
/*图片-查看*/
function member_show(title,url,id,ope,w,h){
	if(id == null || id == ''){
		id = 0;
	}
	layer_show(title,url+'/'+id+'/'+ope,w,h);
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
    
    $("#submit").click(function(){
    	var rotatorID = $("#rotatorid").val();
    	var pictureID = $("#pictureid").val();
    	var sortby = $("#sortby").val();
    	var params = '';
    	if(pictureID == ''){
    		layer.alert("请选择一张图片!", {icon: 2});
    		return false;
    	}else{
    		params += "picture.rotatorId=" + rotatorID + "&picture.id=" + pictureID + "&picture.sortby=" + sortby + "&";
        	$.ajax({
    			type:'POST',
    			data:params,
    			dataType:'json',
    			url:baselocation+'/platform/picture/list/updateSortbyAndRotator',
    			success:function(result){
    				if(result.success==true){
    					layer.msg('已修改!',{icon:1,time:1000},layer_close());
    				}else{
    					layer.alert(result.message, {icon: 2});
    				}
    			}
    		})
    	}
    })
});

function chose(info,id){
	$("#pictureinfo").val(info);
	$("#pictureid").val(id);
}

function reset(){
	$("#pictureinfo").val("");
	$("#sortby").val("");
}

function layer_close(){
	window.parent.location.reload();
	console.log(window.location.href);
	console.log("关闭二级弹出框");
	var index = parent.layer.getFrameIndex(window.name);
	layer.close(index);
}