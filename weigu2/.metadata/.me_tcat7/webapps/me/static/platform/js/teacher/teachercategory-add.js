//表单验证-添加教师职称验证
$(function(){
	$("#teachercategoryform").bootstrapValidator({
        container: 'tooltip',
	    message: 'This value is not valid',
	    feedbackIcons: {
	        valid: 'glyphicon glyphicon-ok',
	        invalid: 'glyphicon glyphicon-remove',
	        validating: 'glyphicon glyphicon-refresh'
	    },
	    fields: {
	    	'teachercategory.name': {
	            message: '名称验证失败',
	            validators: {
	                notEmpty: {
	                    message: '名称不能为空'
	                }
	            }
	        }
	        
	    }
	})
})

//表单提交
$(function() {
	
	$(".teachercategorysubmit").click(function() {
		$('#teachercategoryform').data('bootstrapValidator').validate();  
        if(!$('#teachercategoryform').data('bootstrapValidator').isValid()){  
            return ;  
        }  
		//id name typdid参数注入
		var params = '';
		$("#teachercategoryform input").each(function() {
			params += $(this).serialize() + "&";
		});
	
		var typdid = $('#teachercategory\\.typdid').find("option:selected").attr("data-parent");
		params += "teachercategory.typdid="+typdid;
		
		$.ajax({
			data : params,
			dataType : 'json',
			type : 'post',
			url : baselocation + '/platform/teachercategory/list/save',
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