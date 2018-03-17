//表单验证-添加教师职称类型验证
$(function(){
	$("#teachercategorytypeform").bootstrapValidator({
        container: 'tooltip',
	    message: 'This value is not valid',
	    feedbackIcons: {
	        valid: 'glyphicon glyphicon-ok',
	        invalid: 'glyphicon glyphicon-remove',
	        validating: 'glyphicon glyphicon-refresh'
	    },
	    fields: {
	    	'teachercategorytype.name': {
	            message: '名称验证失败',
	            validators: {
	                notEmpty: {
	                    message: '名称不能为空'
	                }
	            }
	        },
	    	
	        'teachercategorytype.fsort': {
	            validators: {
	                notEmpty: {
	                    message: '排序不能为空'
	                },
	                regexp: {
	                    regexp: /^[1-9][0-9]*$/,
	                    message: '排序必须为数字'
	                }
	            }
	        }
	        
	    }
	})
})

//表单提交
$(function() {
	
	$(".teachercategorytypesubmit").click(function() {
		$('#teachercategorytypeform').data('bootstrapValidator').validate();  
        if(!$('#teachercategorytypeform').data('bootstrapValidator').isValid()){  
            return ;  
        }  
		var params = '';
		$("#teachercategorytypeform input").each(function() {
			params += $(this).serialize() + "&";
		});
		
		$.ajax({
			data : params,
			dataType : 'json',
			type : 'post',
			url : baselocation + '/platform/teachercategorytype/list/save',
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