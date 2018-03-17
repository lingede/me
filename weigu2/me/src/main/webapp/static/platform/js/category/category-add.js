$(document).ready(function() {
	 // 多选框插件
	$('input').iCheck({
		checkboxClass : 'icheckbox_flat-green',
		radioClass : 'iradio_flat-green'
	});
});

//表单验证-添加栏目验证
$(function(){
	$('#categoryaddform').bootstrapValidator({
        container: 'tooltip',
	    message: 'This value is not valid',
	    feedbackIcons: {
	        valid: 'glyphicon glyphicon-ok',
	        invalid: 'glyphicon glyphicon-remove',
	        validating: 'glyphicon glyphicon-refresh'
	    },
	    fields: {
	    	'name': {
	            message: '栏目名称验证失败',
	            validators: {
	                notEmpty: {
	                    message: '栏目名称不能为空'
	                }
	            }
	        },
	    	'sortby': {
	            message: '栏目排序验证失败',
	            validators: {
	                notEmpty: {
	                    message: '栏目排序不能为空'
	                }
	            }
	        },
	    }
	})
})

var index = parent.layer.getFrameIndex(window.name); //获取窗口索引

/*栏目-编辑*/
$(function() {
	$(".syscategorysubmit").click(function() {
		var params = '';
		$("#categoryaddform input").each(function() {
			params += $(this).serialize() + "&";
		});
		var typeId = $('#category_type').find("option:selected").val();
		params += "type="+typeId;
		var categoryId = $('#category_parent').find("option:selected").val();
		params += "&categoryId="+categoryId;
		$.ajax({
			data : params,
			dataType : 'json',
			type : 'post',
			url : baselocation + '/platform/category/list/save',
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


