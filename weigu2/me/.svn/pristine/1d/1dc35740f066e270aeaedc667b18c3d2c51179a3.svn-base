 // 多选框插件
$(document).ready(function() {
});

function chonse(teacherid,teacherName){
	$("#teacherName").val(teacherName);
	$("#teacherid").val(teacherid);
}

function reset(){
	$("#teacherName").val();
	$("#teacherid").val();
}

/*用户-编辑*/
$(function() {
	$("#submit").click(function() {
		if($("#teacherid").val()==null || $("#teacherid").val()==""||$("#sortby").val()==null || $("#sortby").val()==""){
			alert("请选择一个成员或者填写排序");
			return false;
		}else{
			$.ajax({
				data : {
					teacherid:$("#teacherid").val(),
					teamid:$("#teamid").val(),
					sortby:$("#sortby").val()
				},
				dataType : 'json',
				type : 'post',
				url : baselocation + '/platform/teamteacher/list/save',
				success : function(result) {
					if (result.success == true) {
						layer.msg(result.message, {
							shade : 0.3,
							time : 1500
						},layer_close());
					} else {
						alert(result.message);
					}
				}
			})
		}
	})
})

function layer_close(){
	window.parent.location.reload();
	console.log(window.location.href);
	console.log("关闭二级弹出框");
	var index = parent.layer.getFrameIndex(window.name);
	layer.close(index);
}

function areload(){
	
}