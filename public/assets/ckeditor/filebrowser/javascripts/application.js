$.QueryString=function(a){if(a=="")return{};var b={};for(var c=0;c<a.length;++c){var d=a[c].split("=");if(d.length!=2)continue;b[d[0]]=decodeURIComponent(d[1].replace(/\+/g," "))}return b}(window.location.search.substr(1).split("&")),$(document).ready(function(){$("div.gal-item div.gal-inner-holder").live("mouseover",function(a){$(this).addClass("hover")}).live("mouseout",function(a){$(this).removeClass("hover")}).live("click",function(a){var b=$(this).parents("div.gal-item").data("url");CKEDITOR.tools.callFunction(CKEditorFuncNum,b),window.close()}),$("div.gal-item a.gal-del").live("ajax:complete",function(a,b){$(this).parents("div.gal-item").remove()})}),qq.FileUploader.instances=new Object,qq.FileUploaderInput=function(a){qq.FileUploaderBasic.apply(this,arguments),qq.extend(this._options,{element:null,listElement:null,template_id:"#fileupload_tmpl",classes:{button:"fileupload-button",drop:"fileupload-drop-area",dropActive:"fileupload-drop-area-active",list:"fileupload-list",preview:"fileupload-preview",file:"fileupload-file",spinner:"fileupload-spinner",size:"fileupload-size",cancel:"fileupload-cancel",success:"fileupload-success",fail:"fileupload-fail"}}),qq.extend(this._options,a),this._element=document.getElementById(this._options.element),this._listElement=this._options.listElement||this._find(this._element,"list"),this._classes=this._options.classes,this._button=this._createUploadButton(this._find(this._element,"button")),this._path=$('meta[name="ckeditor-path"]').attr("content"),qq.FileUploader.instances[this._element.id]=this},qq.extend(qq.FileUploaderInput.prototype,qq.FileUploaderBasic.prototype),qq.extend(qq.FileUploaderInput.prototype,{_find:function(a,b){var c=qq.getByClass(a,this._options.classes[b])[0];if(!c)throw alert(b),new Error("element not found "+b);return c},_setupDragDrop:function(){var a=this,b=this._find(this._element,"drop"),c=new qq.UploadDropZone({element:b,onEnter:function(c){qq.addClass(b,a._classes.dropActive),c.stopPropagation()},onLeave:function(a){a.stopPropagation()},onLeaveNotDescendants:function(c){qq.removeClass(b,a._classes.dropActive)},onDrop:function(c){b.style.display="none",qq.removeClass(b,a._classes.dropActive),a._uploadFileList(c.dataTransfer.files)}});b.style.display="none",qq.attach(document,"dragenter",function(a){if(!c._isValidFileDrag(a))return;b.style.display="block"}),qq.attach(document,"dragleave",function(a){if(!c._isValidFileDrag(a))return;var d=document.elementFromPoint(a.clientX,a.clientY);if(!d||d.nodeName=="HTML")b.style.display="none"})},_onSubmit:function(a,b){qq.FileUploaderBasic.prototype._onSubmit.apply(this,arguments),this._addToList(a,b)},_onProgress:function(a,b,c,d){qq.FileUploaderBasic.prototype._onProgress.apply(this,arguments);var e=this._getItemByFileId(a),f=this._find(e,"size"),g;c!=d?g=Math.round(c/d*100)+"% from "+this._formatSize(d):g=this._formatSize(d),qq.setText(f,g)},_onComplete:function(a,b,c){qq.FileUploaderBasic.prototype._onComplete.apply(this,arguments);var d=this._getItemByFileId(a),e=c.asset?c.asset:c;e&&e.id?(qq.addClass(d,this._classes.success),e.size=this._formatSize(e.size),e.controller=e.type.toLowerCase()=="ckeditor::picture"?"pictures":"attachment_files",$(d).replaceWith($(this._options.template_id).tmpl(e))):qq.addClass(d,this._classes.fail)},_addToList:function(a,b){if(this._listElement){this._options.multiple===!1&&$(this._listElement).empty();var c={id:0,filename:this._formatFileName(b),size:0,format_created_at:"",url_content:"#",controller:"assets",url_thumb:this._path+"/filebrowser/images/preloader.gif"},d=$(this._options.template_id).tmpl(c).attr("qqfileid",a).prependTo(this._listElement);d.find("div.img").addClass("preloader"),this._bindCancelEvent(d)}},_getItemByFileId:function(a){return $(this._listElement).find("div[qqfileid="+a+"]").get(0)},_bindCancelEvent:function(a){var b=this,c=$(a);c.find("a."+this._classes.cancel).bind("click",function(a){return b._handler.cancel(c.attr("qqfileid")),c.remove(),qq.preventDefault(a),!1})}});