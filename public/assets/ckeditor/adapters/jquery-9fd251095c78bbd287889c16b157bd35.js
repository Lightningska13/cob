/*
Copyright (c) 2003-2012, CKSource - Frederico Knabben. All rights reserved.
For licensing, see LICENSE.html or http://ckeditor.com/license
*/
(function(){CKEDITOR.config.jqueryOverrideVal=typeof CKEDITOR.config.jqueryOverrideVal=="undefined"?!0:CKEDITOR.config.jqueryOverrideVal;var a=window.jQuery;if(typeof a=="undefined")return;a.extend(a.fn,{ckeditorGet:function(){var a=this.eq(0).data("ckeditorInstance");if(!a)throw"CKEditor not yet initialized, use ckeditor() with callback.";return a},ckeditor:function(b,c){if(!CKEDITOR.env.isCompatible)return this;if(!a.isFunction(b)){var d=c;c=b,b=d}return c=c||{},this.filter("textarea, div, p").each(function(){var d=a(this),e=d.data("ckeditorInstance"),f=d.data("_ckeditorInstanceLock"),g=this;if(e&&!f)b&&b.apply(e,[this]);else if(!f){if(c.autoUpdateElement||typeof c.autoUpdateElement=="undefined"&&CKEDITOR.config.autoUpdateElement)c.autoUpdateElementJquery=!0;c.autoUpdateElement=!1,d.data("_ckeditorInstanceLock",!0),e=CKEDITOR.replace(g,c),d.data("ckeditorInstance",e),e.on("instanceReady",function(a){var c=a.editor;setTimeout(function(){if(!c.element){setTimeout(arguments.callee,100);return}a.removeListener("instanceReady",this.callee),c.on("dataReady",function(){d.trigger("setData.ckeditor",[c])}),c.on("getData",function(a){d.trigger("getData.ckeditor",[c,a.data])},999),c.on("destroy",function(){d.trigger("destroy.ckeditor",[c])});if(c.config.autoUpdateElementJquery&&d.is("textarea")&&d.parents("form").length){var e=function(){d.ckeditor(function(){c.updateElement()})};d.parents("form").submit(e),d.parents("form").bind("form-pre-serialize",e),d.bind("destroy.ckeditor",function(){d.parents("form").unbind("submit",e),d.parents("form").unbind("form-pre-serialize",e)})}c.on("destroy",function(){d.data("ckeditorInstance",null)}),d.data("_ckeditorInstanceLock",null),d.trigger("instanceReady.ckeditor",[c]),b&&b.apply(c,[g])},0)},null,null,9999)}else CKEDITOR.on("instanceReady",function(a){var c=a.editor;setTimeout(function(){if(!c.element){setTimeout(arguments.callee,100);return}c.element.$==g&&b&&b.apply(c,[g])},0)},null,null,9999)}),this}}),CKEDITOR.config.jqueryOverrideVal&&(a.fn.val=CKEDITOR.tools.override(a.fn.val,function(b){return function(c,d){var e=typeof c!="undefined",f;return this.each(function(){var g=a(this),h=g.data("ckeditorInstance");if(!d&&g.is("textarea")&&h){if(!e)return f=h.getData(),null;h.setData(c)}else{if(!e)return f=b.call(g),null;b.call(g,c)}return!0}),e?this:f}}))})();