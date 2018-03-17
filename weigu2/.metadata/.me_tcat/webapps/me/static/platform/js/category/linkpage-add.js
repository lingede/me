$(document).ready(function() {
	 // 多选框插件
	$('input').iCheck({
		checkboxClass : 'icheckbox_flat-green',
		radioClass : 'iradio_flat-green'
	});
});

var ztreeObject;
var setting = {
		data: {
			simpleData: {
				enable: true,
				idKey: "id",
				pIdKey: "categoryId",
				rootPId: 0
			},
			key: {
				name:'name',
				title:'name'
			}
		},
		check:{
			enable:true,
			chkStyle: "radio",
			radioType: "all",
			nocheckInherit:true
		}
	};

/**初始化菜单树*/
function initMenuTree(treedata){
	treedata = eval('('+treedata+')');
	ztreeObject = $.fn.zTree.init($("#ztreedemo"), setting, treedata);
	//展开所有节点
	ztreeObject.expandAll(false);
}

//表单验证-添加链接验证
$(function(){
	$('#linkpageaddform').bootstrapValidator({
        container: 'tooltip',
	    message: 'This value is not valid',
	    feedbackIcons: {
	        valid: 'glyphicon glyphicon-ok',
	        invalid: 'glyphicon glyphicon-remove',
	        validating: 'glyphicon glyphicon-refresh'
	    },
	    fields: {
	    	'url': {
	            message: '链接URL验证失败',
	            validators: {
	                notEmpty: {
	                    message: '链接URL不能为空'
	                }
	            }
	        }
	    }
	})
})

var index = parent.layer.getFrameIndex(window.name); //获取窗口索引

/*链接-编辑*/
$(function() {
	$(".linkpagesubmit").click(function() {
		$('#linkpageaddform').data('bootstrapValidator').validate();  
        if(!$('#linkpageaddform').data('bootstrapValidator').isValid()){  
            return ;  
        }  
		//获取选中的栏目的ID及名称
		var zTreeObj = $.fn.zTree.getZTreeObj("ztreedemo");
		var checkedNodes = zTreeObj.getCheckedNodes();
		if(checkedNodes.length == 0){
			layer.msg('关联栏目不能为空', {
				icon : 2,
				time : 1000
			});
			return false;
		}
		$.ajax({
			data : {'id':$('#linkpageid').val(),
					'categoryId':checkedNodes[0].id,
					'name':checkedNodes[0].name,
					'url':$('#url').val()},
			dataType : 'json',
			type : 'post',
			url : baselocation + '/platform/linkpage/list/save',
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