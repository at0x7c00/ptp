(function($){
	
	var h5UploadSupport = true;
	try{
		new FormData();
	}catch(e){
		h5UploadSupport = false;
	}

	$.fn.extend({
		
		h5Upload:function(){
			return this.each(function(){
				if(!h5UploadSupport){
					console.log("h5 upload is not supported by browser!")
					toastr["warning"]("您的浏览器版本太低了，建议使用Chrome、火狐或者IE11+访问本系统。")
					return false;
				}
				var _this = $(this);
				/*var parent = _this.parent();
				var b = $("<div class='h5-upload-btn'></div>")
				var input = $("<input type='file'/>");
				//var uploaderoption = _this.attr("uploaderoption");
				
				input.attr("id",_this.attr("id"));
				input.attr("name",_this.attr("name"));
				input.attr("multiple",_this.attr("multiple"));
				input.attr("dname",_this.attr("dname"));
				//input.attr("h5uploaderoption",uploaderoption);
				
				var h5uploaderoption = uploaderoption;//eval("(" + uploaderoption + ")");
				input.attr("accpet",h5uploaderoption.fileTypeDesc);
				
				b.append("<i class='fa fa-upload'></i>&nbsp;" + h5uploaderoption.buttonText);
				b.append(input);
				parent.append(b);
				_this.remove();*/
				
				_this.change(function(){
					doH5Upload($(this)[0]);
				});
			});
		}
		
		
	});
	
	function doH5Upload(fileInput){
		if(!fileInput.files || fileInput.files.length==0){
			return;
		}
		for(var i = 0;i<fileInput.files.length;i++){
			var file = fileInput.files[i];
			doUploadFile(file,fileInput);
		}
	}
	function doUploadFile(file,fileInput){
		var h5uploaderoption = eval("(" + $(fileInput).attr("h5uploaderoption") + ")");
		var attSizeTicket = parseInt(h5uploaderoption.fileSizeLimit.substring(0,h5uploaderoption.fileSizeLimit.length - 2));
		
		var fileSize = file.size;
		if(fileSize > attSizeTicket * 1024){
			 toastr["warning"]("文件大小超过限制,请上传小于2M的文件");
			 return;
		}
		var formData = new FormData();
		formData.append("photofile", file);

		var request = new XMLHttpRequest();
		request.open("POST", basePath + "filee/frontendAdd.do");
		request.send(formData);

		request.onload = function(oEvent) {
		   if (request.status == 200) {
			   	var res = eval("("+request.responseText +")");
			   	if(res.statusCode=='200'){
			   		var fileKey = res.message;
			   		var dname = $(fileInput).attr("dname");
			   		var multifile = $(fileInput).attr("multifile")=="true";
			   		var divHtml = "<div class='atta-div'><input type='hidden' name='"+dname+"' value='"+ fileKey +"'/><img src='" + basePath +'filee/viewPic.do?manageKey=' + fileKey +"' class='attachement-image' onclick='imageView(\""+ fileKey +"\")'/>";
			   		if(multifile){
			   			divHtml+= "<div class='atta-delete-div' onclick='removeThisAtt(this)'>删除</div>";
			   		}
			   		divHtml += "</div>";
			   		
			   		var imageWrapper = $("+div.form-input.image-wrapper",$(fileInput).parents(".form-input").first());
			   		if(imageWrapper[0]){
			   			if(multifile){
			   				if($(".atta-div",imageWrapper).length>=10){
			   					toastr['warning']("其他资质不能超过10个");
			   					return;
			   				}
			   				imageWrapper.append(divHtml);
			   			}else{
			   				imageWrapper.html(divHtml);
			   			}
			   			
			   			imageWrapper.removeClass("hide");
			   		}
			   	}else{
			   		var error = getCodeMsgs[res.message];
			   		if(!error){
			   			error = res.message;
			   		}
			   		toastr['error'](error);
			   	}
		   }else{
			   ajaxError(request);
		   }
		}
	}
	
	function getH5UploadQueueHtml(id,fileName,fileKey,fileSize,inputFormName){
		var x = '<div id="'+ fileKey +'" class="uploadify-queue">'+
		'<div id="H5Upload_'+ fileKey +'" class="uploadify-queue-item">'+
		'<div class="cancel">'+
		'<a href="javascript:$(\'#'+ fileKey +'\').remove()">X</a>'+
		'</div>'+
		'<span><input type="hidden" name="'+ inputFormName +'" value="'+ fileKey +'" class="manageKey"></span>'+
		'<span class="fileName">'+ fileName +' ('+ formatSize(fileSize) +')</span><span class="data"> - 完成</span>'+
		'<div class="uploadify-progress"><div class="uploadify-progress-bar" style="width: 100%;"></div></div></div></div>';
		return x;
	}
	
	function formatSize(size){
		if(size<1024){
			return size + "Byte";
		}else if(size<1024 * 1024){
			return (size/1024).toFixed(2) + "KB";
		}else if(size<1024 * 1024 * 1024){
			return (size/(1024*1024)).toFixed(2) + "M";
		}else if(size<1024 * 1024 * 1024 * 1024){
			return (size/(1024*1024*1024)).toFixed(2) + "G";
		}else if(size<1024 * 1024 * 1024 * 1024 * 1024){
			return (size/(1024*1024*1024*1024)).toFixed(2) + "T";
		}
	}
	

})(jQuery);

