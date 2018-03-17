 var projectfileoptions = {
        showUpload : false,
        showRemove : false,
        showClose: false,
        language : 'zh',
        allowedPreviewTypes : [ 'image' ],
        allowedFileExtensions : [ 'jpg', 'png', 'gif' ],
        maxFileSize : 2000
 };
//设置图片预览
$(function(){
	$('input[class=projectfile]').each(function() {
	    var imageurl = $(this).attr("value");
      
	    if (imageurl) {
	        var op = $.extend({
	            initialPreview : [ // 预览图片的设置
	            "<img src='"+baselocation + imageurl + "' style='width:50px;height:50px;' >", ]
	        }, projectfileoptions);

	        $(this).fileinput(op);
	    } else {
	        $(this).fileinput(projectfileoptions);
	    }
	});
	
	
});

//表单验证-添加教师验证
$(function(){
	$("#teacherform").bootstrapValidator({
        container: 'tooltip',
	    message: 'This value is not valid',
	    feedbackIcons: {
	        valid: 'glyphicon glyphicon-ok',
	        invalid: 'glyphicon glyphicon-remove',
	        validating: 'glyphicon glyphicon-refresh'
	    },
	    fields: {
	    	'username': {
	            message: '用户名验证失败',
	            validators: {
	                notEmpty: {
	                    message: '用户名不能为空'
	                }
	            }
	        },
	        'name':{
	        	 message: '姓名验证失败',
		            validators: {
		                notEmpty: {
		                    message: '姓名不能为空'
		                }
		            }
	        },
	        'tel': {
	            validators: {
	                notEmpty: {
	                    message: '电话不能为空'
	                }
	       
	            }
	        },
	        'email': {
	            validators: {
	                notEmpty: {
	                    message: '电子邮箱不能为空'
	                },
	                regexp: {
	                    regexp: /^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/,
	                    message: '电子邮箱格式不正确'
	                }
	            }
	        },
	    }
	})
})

//表单提交
$(function() {
	
	$(".teachersubmit").click(function() {
		$('#teacherform').data('bootstrapValidator').validate();  
        if(!$('#teacherform').data('bootstrapValidator').isValid()){  
            return ;  
        }  
		var formData = new FormData($( "#teacherform" )[0]);
		//FormData传递文件和参数
		$.ajax({
			type: 'POST',  
		    data: formData,  
			async: false,  
			cache: false,  
			contentType: false,  
			processData: false, 
            url : baselocation + '/platform/teacher/list/save',
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
