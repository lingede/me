
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
				pIdKey: "parentId",
				rootPId: 0
			},
			key: {
				name:'menuName',
				title:'menuName'
			}
		},
		check:{
			enable:true,
			nocheckInherit:true
		}
	};

/**初始化菜单树*/
function initMenuTree(treedata){
	treedata = eval('('+treedata+')');
	ztreeObject = $.fn.zTree.init($("#ztreedemo"), setting, treedata);
	//展开所有节点
	ztreeObject.expandAll(true);
}

var index = parent.layer.getFrameIndex(window.name); //获取窗口索引

/*菜单-编辑*/
$(function() {
	$(".sysrolesubmit").click(function() {
		var params = '';
		$("#systemRoleform input").each(function() {
			params += $(this).serialize() + "&";
		});
		ztreeObject = $.fn.zTree.getZTreeObj("ztreedemo");
		var nodes = ztreeObject.getCheckedNodes(true);
		var menuIds='';
		if(nodes!=null && nodes.length>0){
			for(var i=0;i<nodes.length;i++){
				menuIds+=nodes[i].id+',';
			}
		}
		params += "menuIds="+menuIds;
		$.ajax({
			data : params,
			dataType : 'json',
			type : 'post',
			url : baselocation + '/system/sysrole/list/save',
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
			},
			error:function (XMLHttpRequest, textStatus, errorThrown) { 
				alert(XMLHttpRequest.status);
				alert(XMLHttpRequest.readyState);
				alert(textStatus);
				alert(errorThrown);

			} 

		})
	})
})