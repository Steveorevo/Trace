/*
	Trace utility connector for jQuery enabled web pages
	Virtuosoft (c)2016
  Stephen J Carnam
*/
var trace;
(function($) {
    trace = function(m) {
        $.ajax({ url: "http://127.0.0.1:8189/trace?m=" + escape(m)});
    }
})(jQuery);
