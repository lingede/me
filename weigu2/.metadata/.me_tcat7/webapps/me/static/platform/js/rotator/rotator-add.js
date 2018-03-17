// 多选框插件
$(document).ready(function() {
});

//表单验证-添加用户验证
$(function(){
	$('#rotatorform').bootstrapValidator({
        container: 'tooltip',
	    message: 'This value is not valid',
	    feedbackIcons: {
	        valid: 'glyphicon glyphicon-ok',
	        invalid: 'glyphicon glyphicon-remove',
	        validating: 'glyphicon glyphicon-refresh'
	    },
	    fields: {
	    	'rotator.title': {
	            message: '轮播主题验证失败',
	            validators: {
	                notEmpty: {
	                    message: '轮播主题不能为空'
	                }
	            }
	        },
	    	'rotator.description': {
	            message: '描述验证失败',
	            validators: {
	                notEmpty: {
	                    message: '描述不能为空'
	                }
	            }
	        },
	        'rotator.sequence': {
	        	message: '轮播主题排序验证失败',
	            validators: {
	                notEmpty: {
	                    message: '轮播主题不能为空'
	                }
	            }
	        }
	    }
	})
})

var index = parent.layer.getFrameIndex(window.name); //获取窗口索引
/*用户-编辑*/
$(function() {
	$(".Rotatorsubmit").click(function() {
		$('#rotatorform').data('bootstrapValidator').validate();  
        if(!$('#rotatorform').data('bootstrapValidator').isValid()){  
            return ;  
        }  
		var params = '';
		$("#rotatorform input").each(function() {
			params += $(this).serialize() + "&";
		});
		$.ajax({
			data : params,
			async:false,
			dataType : 'json',
			type : 'post',
			url : baselocation + '/platform/rotator/list/save',
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
						time : 3000
					});
				}
			}
		})
	})
})