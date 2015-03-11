<?php
/* 
	Trace utility connector for PHP
	Virtuosoft (c)2004
   	Stephen J Carroll
*/
if (!function_exists('trace')){
    global $notrace;
    $notrace = false;
    function trace($msg){
	global $notrace;
	if ($notrace) return;
    	if (! is_string($msg) ){
    		$msg = var_export($msg,true);
    	}
	$notrace = ('ok'!=
		@file_get_contents(
			'http://127.0.0.1:8189/trace?m='.substr(rawurlencode($msg),0,32000),
			false,
			stream_context_create(array('http' => array( 'timeout' => 0.2 )))
		));
	
    }
}
?>