function choose(teacherid,teacherName){
	$("#teacherName").val(teacherName);
	$("#teacherid").val(teacherid);
	
}

function reset1(){
	$("#teacherName").val("");
	$("#rank").val("");
	$("#teacherid").val("");
}

//表单验证-添加教师类型关联验证
$(function(){
	$("#categoryhasteacherform").bootstrapValidator({
        container: 'tooltip',
	    message: 'This value is not valid',
	    feedbackIcons: {
	        valid: 'glyphicon glyphicon-ok',
	        invalid: 'glyphicon glyphicon-remove',
	        validating: 'glyphicon glyphicon-refresh'
	    },
	    fields: {
	    	
	    'categoryhasteacher.rank': {
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
	
	$("#submit").click(function() {
	
		$('#categoryhasteacherform').data('bootstrapValidator').validate();  
        if(!$('#categoryhasteacherform').data('bootstrapValidator').isValid()){  
            return ;  
        }  
		
		var params = '';
		$("#categoryhasteacherform input").each(function() {
			params += $(this).serialize() + "&";
		});
       
		$.ajax({
			data : params,
			dataType : 'json',
			type : 'post',
			url : baselocation + '/platform/teachercategory/list/saveteacher',
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