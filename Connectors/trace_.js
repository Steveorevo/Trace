/*
	Trace utility connector for Electron enabled web pages
	Virtuosoft (c)2019
  	Stephen J Carnam
*/
var trace;
(function() {
    trace = function(m) {
		var Http = new XMLHttpRequest();
		var url="http://127.0.0.1:8189/trace?m=" + escape(var_dump(m));
		Http.open("GET", url);
		Http.send();
    }

    /** Our var_dump implementation for JavaScript */
    function var_dump(arr, level) {
        var dumped_text = "";
        if (!level)
            level = 5;

        //The padding given at the beginning of the line.
        var level_padding = "";
        for (var j = 0; j < level + 1; j++)
            level_padding += "    ";

        if (typeof(arr) === 'object') { //Array/Hashes/Objects
            for (var item in arr) {
                var value = arr[item];

                if (typeof(value) === 'object') { //If it is an array,
                    dumped_text += level_padding + "'" + item + "' ...\n";
                    dumped_text += var_dump(value, level + 1);
                } else {
                    dumped_text += level_padding + "'" + item + "' => " + "(" + typeof(value) + ") \"" + value + "\"\n";
                }
            }
        } else { //Stings/Chars/Numbers etc.
            dumped_text = "(" + typeof(arr) + ") " + arr;
            return dumped_text;
        }
        if (level===0){
            return '(object)' + String.fromCharCode(10) + dumped_text;
        }else{
            return dumped_text;
        }
    }
})();
