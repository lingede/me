$(document).ready(function() {
});

//表单验证-添加用户验证
$(function(){
	$('#teamform').bootstrapValidator({
        container: 'tooltip',
	    message: 'This value is not valid',
	    feedbackIcons: {
	        valid: 'glyphicon glyphicon-ok',
	        invalid: 'glyphicon glyphicon-remove',
	        validating: 'glyphicon glyphicon-refresh'
	    },
	    fields: {
	    	'team.username': {
	            message: '用户名验证失败',
	            validators: {
	                notEmpty: {
	                    message: '用户名不能为空'
	                }
	            }
	        },
	    	'team.password': {
	            message: '密码验证失败',
	            validators: {
	                notEmpty: {
	                    message: '密码不能为空'
	                }
	            }
	        },
	    	'team.name': {
	            message: '名称验证失败',
	            validators: {
	                notEmpty: {
	                    message: '名称不能为空'
	                }
	            }
	        },
	        'team.sortby': {
	        	message: '菜单排序验证失败',
	            validators: {
	                notEmpty: {
	                    message: '菜单排序不能为空'
	                }
	            }
	        },
	        'team.address': {
	        	message: '地址验证失败',
	            validators: {
	                notEmpty: {
	                    message: '地址不能为空'
	                }
	            }
	        }
	    }
	})
})

var index = parent.layer.getFrameIndex(window.name); //获取窗口索引
/*用户-编辑*/
$(function() {
	$(".teamsubmit").click(function() {
		var params = '';
		$("#teamform input").each(function() {
			params += $(this).serialize() + "&";
		});
		$("#teamform textarea").each(function() {
			params += $(this).serialize() + "&";
		});
		$.ajax({
			data : params,
			dataType : 'json',
			type : 'post',
			url : baselocation + '/platform/team/list/save',
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