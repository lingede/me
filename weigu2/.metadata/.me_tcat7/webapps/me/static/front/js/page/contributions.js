$(function() {
  // 触发input file
  $('#upload_btn').click(function() {
    $('#btn1').trigger('click');
  });

  // 图片上传
  var $image = $('#theirimage');
  $image.cropper({
      viewMode: 1,
// preview: '.img-preview', //不同尺寸预览区
      aspectRatio: 1.6/1, // 裁剪比例，NaN-自由选择区域
      autoCropArea: 0.7, // 初始裁剪区域占图片比例
      crop: function(data) { 
    	  var canVas = $image.cropper("getCroppedCanvas", {});
          // 将裁剪的图片加载到face_image
          $('#myimage').attr('src', canVas.toDataURL());
      }
  });
  
  var fileName; // 选择上传的文件名
  $('#btn1').change(function(){
	  $("#info").show();
      var file = this.files[0];
      fileName = file.name;
      var reader = new FileReader();
      // reader回调，重新初始裁剪区
      reader.onload = function(){
          // 通过 reader.result 来访问生成的 DataURL
          var url = reader.result;
          // 选择图片后重新初始裁剪区
          $image.cropper('reset', true).cropper('replace', url);
      };
      reader.readAsDataURL(file);
  });

  /*
	 * 上传图片
	 */
  $('#submitArticle').click(function() {
	  if(vatation()){
		  if(fileName!=null){
			  var type = $image.attr('src').split(';')[0].split(':')[1];
		      var canVas = $image.cropper("getCroppedCanvas", {});
		      // 将裁剪的图片加载到face_image
		      $('#myimage').attr('src', canVas.toDataURL());
		      canVas.toBlob(function(blob) {
		          var formData = new FormData();
		          formData.append("file", blob, fileName);
		          formData.append("info",$('#info').val());
		          formData.append("content",ue.getContent());
		          formData.append("categoryId",$('#categoryId').val());
		          formData.append("author",$('#author').val());
		          formData.append("email",$('#email').val());
		          formData.append("source",$('#source').val());
		          formData.append("title",$('#title').val());
		          $.ajax({
		              type: "POST",
		              url: ctx+'/front/contributions',
		              data: formData,
		              contentType: false, // 必须
		              processData: false, // 必须
		              dataType: "json",
		              success: function(retJson){
		            	  if(retJson.success){
		            		  layer.msg(retJson.info, {
		  						shade : 0.3,
		  						time : 3000
		  					});
		            		  
		            	  }else{
		            		  layer.msg(retJson.info, {
		    						shade : 0.3,
		    						time : 1500
		    					});
		            	  }
		            	  
		              },
		              error : function() {
		                 
		              }
		          });
		      }, type);
		  }else{
			  var formData = new FormData();
	          formData.append("content",ue.getContent());
	          formData.append("categoryId",$('#categoryId').val());
	          formData.append("author",$('#author').val());
	          formData.append("email",$('#email').val());
	          formData.append("source",$('#source').val());
	          formData.append("title",$('#title').val());
			  $.ajax({
	              type: "POST",
	              url: ctx+'/front/contributions',
	              data: formData,
	              contentType: false, // 必须
	              processData: false, // 必须
	              dataType: "json",
	              success: function(retJson){
	            	  if(retJson.success){
	            		  layer.msg(retJson.info, {
	  						shade : 0.3,
	  						time : 1500
	  					}, function() {
	  						window.location.href= ctx+'/front/index';
	  					});
	            	  }else{
	            		  layer.msg(retJson.info, {
	    						shade : 0.3,
	    						time : 1500
	    					});
	            	  }
	            	  
	              },
	              error : function() {
	                 
	              }
	          });
		  }
	  }
  });
  // 取消
  $("#deleteImg").click(function() {
	  $('#myimage').attr('src',ctxsta+'/front/image/noImg.png');
	  $('#theirimage').attr('src', ctxsta+'/front/image/noImg.png');
	  fileName=null;
	  $("#info").hide();
  });
  
  function vatation(){
	  var content = ue.getContent();
		
		if ($.trim(content).length <= 15) {
			alert("文章内容不能少于15字");
			return false;
		} 
		var display =$('#categoryId').css('display');
		if(display == 'none'){
			alert("栏目种类不能为空");return false;
		}
		if($("#title").val() == ""){
			alert("标题不能为空");return false;
		}
		if($("#author").val()==""){alert("作者名不能为空");return false;}
		if($("#email").val()==""){alert("邮箱不能为空");return false;}
		if($("#source").val()==""){alert("来源不能为空");return false;}
		if(fileName!=null){
			if($("#info").val()==""){alert("请输入图片描述");return false;}
		}
		return true;
  }
});