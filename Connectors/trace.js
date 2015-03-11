/* 
	Trace utility connector for Node.JS
	Virtuosoft (c)2012
   	Stephen J Carroll
*/

var http = require('http');
var util = require('util');
function trace(m) {
    var r = http.get("http://127.0.0.1:8189/trace?m=" + escape(util.inspect(m, { showHidden: true, depth: null })));
    r.on('error', function(e){}).setTimeout(5000, function(){this.abort();}); // prevent hanging
};
module.exports = trace;