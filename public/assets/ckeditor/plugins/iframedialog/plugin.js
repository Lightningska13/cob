/*
Copyright (c) 2003-2012, CKSource - Frederico Knabben. All rights reserved.
For licensing, see LICENSE.html or http://ckeditor.com/license
*/
CKEDITOR.plugins.add("iframedialog",{requires:["dialog"],onLoad:function(){CKEDITOR.dialog.addIframe=function(a,b,c,d,e,f,g){var h={type:"iframe",src:c,width:"100%",height:"100%"};typeof f=="function"?h.onContentLoad=f:h.onContentLoad=function(){var a=this.getElement(),b=a.$.contentWindow;if(b.onDialogEvent){var c=this.getDialog(),d=function(a){return b.onDialogEvent(a)};c.on("ok",d),c.on("cancel",d),c.on("resize",d),c.on("hide",function(a){c.removeListener("ok",d),c.removeListener("cancel",d),c.removeListener("resize",d),a.removeListener()}),b.onDialogEvent({name:"load",sender:this,editor:c._.editor})}};var i={title:b,minWidth:d,minHeight:e,contents:[{id:"iframe",label:b,expand:!0,elements:[h]}]};for(var j in g)i[j]=g[j];this.add(a,function(){return i})},function(){var a=function(a,b,c){if(arguments.length<3)return;var d=this._||(this._={}),e=b.onContentLoad&&CKEDITOR.tools.bind(b.onContentLoad,this),f=CKEDITOR.tools.cssLength(b.width),g=CKEDITOR.tools.cssLength(b.height);d.frameId=CKEDITOR.tools.getNextId()+"_iframe",a.on("load",function(){var a=CKEDITOR.document.getById(d.frameId),b=a.getParent();b.setStyles({width:f,height:g})});var h={src:"%2",id:d.frameId,frameborder:0,allowtransparency:!0},i=[];typeof b.onContentLoad=="function"&&(h.onload="CKEDITOR.tools.callFunction(%1);"),CKEDITOR.ui.dialog.uiElement.call(this,a,b,i,"iframe",{width:f,height:g},h,""),c.push('<div style="width:'+f+";height:"+g+';" id="'+this.domId+'"></div>'),i=i.join(""),a.on("show",function(){var a=CKEDITOR.document.getById(d.frameId),c=a.getParent(),f=CKEDITOR.tools.addFunction(e),g=i.replace("%1",f).replace("%2",CKEDITOR.tools.htmlEncode(b.src));c.setHtml(g)})};a.prototype=new CKEDITOR.ui.dialog.uiElement,CKEDITOR.dialog.addUIElement("iframe",{build:function(b,c,d){return new a(b,c,d)}})}()}});