 var ue = UE.getEditor('content');
$(document).ready(function() {
	ue.setHide();
});


var index = parent.layer.getFrameIndex(window.name); //获取窗口索引
/*用户-编辑*/
$(function() {
	$("#submit").click(function() {
		$.ajax({
			data : {
				data:ue.getContent()
			},
			dataType : 'json',
			type : 'post',
			url : baselocation + '/platform/team/list/'+$("#teamid").val()+'/'+$("#type").val()+'/data',
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
						time : 1000
					});
				}
			}
		})
	})
})

function show(){
	editor.setShow();
}