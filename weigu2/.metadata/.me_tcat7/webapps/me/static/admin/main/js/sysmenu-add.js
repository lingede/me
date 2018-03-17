 // 多选框插件
$(document).ready(function() {
	$('input').iCheck({
		checkboxClass : 'icheckbox_flat-green',
		radioClass : 'iradio_flat-green'
	});
});


//表单验证-添加管理员验证
$(function(){
	$('#systemmenuform').bootstrapValidator({
        container: 'tooltip',
	    message: 'This value is not valid',
	    feedbackIcons: {
	        valid: 'glyphicon glyphicon-ok',
	        invalid: 'glyphicon glyphicon-remove',
	        validating: 'glyphicon glyphicon-refresh'
	    },
	    fields: {
	    	'systemMenu.menuName': {
	            message: '菜单名验证失败',
	            validators: {
	                notEmpty: {
	                    message: '菜单用户名不能为空'
	                }
	            }
	        },
	    	'systemMenu.sort': {
	            message: '菜单排序验证失败',
	            validators: {
	                notEmpty: {
	                    message: '菜单排序不能为空'
	                }
	            }
	        }
	    }
	})
})

var index = parent.layer.getFrameIndex(window.name); //获取窗口索引

/*菜单-编辑*/
$(function() {
	$(".sysmenusubmit").click(function() {
		var params = '';
		$("#systemmenuform input").each(function() {
			params += $(this).serialize() + "&";
		});
		var parentId = $('#systemMenuParent').find("option:selected").attr("data-parent");
		params += "systemMenu.parentId="+parentId;
		$.ajax({
			data : params,
			dataType : 'json',
			type : 'post',
			url : baselocation + '/system/sysmenu/list/save',
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