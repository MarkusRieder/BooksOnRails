/* ========================================================================
 * Bootstrap: alert.js v3.1.1
 * http://getbootstrap.com/javascript/#alerts
 * ========================================================================
 * Copyright 2011-2014 Twitter, Inc.
 * Licensed under MIT (https://github.com/twbs/bootstrap/blob/master/LICENSE)
 * ======================================================================== */
+function(t){"use strict";var e='[data-dismiss="alert"]',a=function(a){t(a).on("click",e,this.close)};a.prototype.close=function(e){function a(){s.trigger("closed.bs.alert").remove()}var r=t(this),n=r.attr("data-target");n||(n=r.attr("href"),n=n&&n.replace(/.*(?=#[^\s]*$)/,""));var s=t(n);e&&e.preventDefault(),s.length||(s=r.hasClass("alert")?r:r.parent()),s.trigger(e=t.Event("close.bs.alert")),e.isDefaultPrevented()||(s.removeClass("in"),t.support.transition&&s.hasClass("fade")?s.one(t.support.transition.end,a).emulateTransitionEnd(150):a())};var r=t.fn.alert;t.fn.alert=function(e){return this.each(function(){var r=t(this),n=r.data("bs.alert");n||r.data("bs.alert",n=new a(this)),"string"==typeof e&&n[e].call(r)})},t.fn.alert.Constructor=a,t.fn.alert.noConflict=function(){return t.fn.alert=r,this},t(document).on("click.bs.alert.data-api",e,a.prototype.close)}(jQuery);