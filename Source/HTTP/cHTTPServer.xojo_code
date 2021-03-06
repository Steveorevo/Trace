#tag Class
Protected Class cHTTPServer
Inherits ServerSocket
	#tag Event
		Function AddSocket() As TCPSocket
		  // Create a socket for handling the client
		  Dim clientSocket As New cClientSocket
		  
		  // Add a reference back to us
		  clientSocket.HTTPServer = Me
		  
		  // Store the clientSocket in our pool
		  Me.ClientSocketPool.Append clientSocket
		  
		  ''System.DebugLog "HTTPServer AddSocket " + Str(clientSocket.Handle)
		  
		  // Return the socket
		  return clientSocket
		  
		End Function
	#tag EndEvent

	#tag Event
		Sub Error(ErrorCode as Integer)
		  ''System.DebugLog "HTTPServer Error"
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h0
		Sub AddWebApp(sURL As String, myWebApp As ciWebApps)
		  // Add the given web application to the list of web applications to handle HTTP requests
		  dictWebApps.Value(sURL) = myWebApp
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor()
		  // Define the root folder from the app folder
		  Me.Root = GetFolderItemByURL(GetAppFolder().URLPath + "web/")
		  
		  // Allocate storage for web applications
		  Me.dictWebApps = New Dictionary
		  
		  // Start listening on port 80
		  Me.MaximumSocketsConnected = 500
		  Me.MinimumSocketsAvailable = 1
		  Me.Port = 80
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Destructor()
		  // Stop listening
		  If Me.IsListening Then Me.StopListening
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetMimeByExt(sExt As String) As String
		  // Return the mime type by the provided extension
		  Select Case sExt
		  Case "323"
		    return "text/h323"
		  Case "acx"
		    return "application/internet-property-stream"
		  Case "ai"
		    return "application/postscript"
		  Case "aif"
		    return "audio/x-aiff"
		  Case "aifc"
		    return "audio/x-aiff"
		  Case "aiff"
		    return "audio/x-aiff"
		  Case "asf", "asr", "asx"
		    return "video/x-ms-asf"
		  Case "au"
		    return "audio/basic"
		  Case "avi"
		    return "video/x-msvideo"
		  Case "axs"
		    return "application/olescript"
		  Case "bas"
		    return "text/plain"
		  Case "bcpio"
		    return "application/x-bcpio"
		  Case "bin"
		    return "application/octet-stream"
		  Case "bmp"
		    return "image/bmp"
		  Case "c"
		    return "text/plain"
		  Case "cat"
		    return "application/vnd.ms-pkiseccat"
		  Case "cdf"
		    return "application/x-cdf"
		  Case "cer"
		    return "application/x-x509-ca-cert"
		  Case "class"
		    return "application/octet-stream"
		  Case "clp"
		    return "application/x-msclip"
		  Case "cmx"
		    return "image/x-cmx"
		  Case "cod"
		    return "image/cis-cod"
		  Case "cpio"
		    return "application/x-cpio"
		  Case "crd"
		    return "application/x-mscardfile"
		  Case "crl"
		    return "application/pkix-crl"
		  Case "crt"
		    return "application/x-x509-ca-cert"
		  Case "csh"
		    return "application/x-csh"
		  Case "css"
		    return "text/css"
		  Case "dcr"
		    return "application/x-director"
		  Case "der"
		    return "application/x-x509-ca-cert"
		  Case "dir"
		    return "application/x-director"
		  Case "dll"
		    return "application/x-msdownload"
		  Case "dms"
		    return "application/octet-stream"
		  Case "doc", "dot"
		    return "application/msword"
		  Case "dvi"
		    return "application/x-dvi"
		  Case "dxr"
		    return "application/x-director"
		  Case "eps"
		    return "application/postscript"
		  Case "etx"
		    return "text/x-setext"
		  Case "evy"
		    return "application/envoy"
		  Case "exe"
		    return "application/octet-stream"
		  Case "fif"
		    return "application/fractals"
		  Case "flr"
		    return "x-world/x-vrml"
		  Case "gif"
		    return "image/gif"
		  Case "gtar"
		    return "application/x-gtar"
		  Case "gz"
		    return "application/x-gzip"
		  Case "h"
		    return "text/plain"
		  Case "hdf"
		    return "application/x-hdf"
		  Case "hlp"
		    return "application/winhlp"
		  Case "hqx"
		    return "application/mac-binhex40"
		  Case "hta"
		    return "application/hta"
		  Case "htc"
		    return "text/x-component"
		  Case "htm","html","stm","rbs","rbscript"
		    return "text/html"
		  Case "htt"
		    return "text/webviewhtml"
		  Case "ico"
		    return "image/x-icon"
		  Case "ief"
		    return "image/ief"
		  Case "iii"
		    return "application/x-iphone"
		  Case "ins", "isp"
		    return "application/x-internet-signup"
		  Case "jfif"
		    return "image/pipeg"
		  Case "jpe", "jpeg", "jpg"
		    return "image/jpeg"
		  Case "js"
		    return "application/x-javascript"
		  Case "latex"
		    return "application/x-latex"
		  Case "lha"
		    return "application/octet-stream"
		  Case "lsf", "lsx"
		    return "video/x-la-asf"
		  Case "lzh"
		    return "application/octet-stream"
		  Case "m13", "m14"
		    return "application/x-msmediaview"
		  Case "m3u"
		    return "audio/x-mpegurl"
		  Case "man"
		    return "application/x-troff-man"
		  Case "mdb"
		    return "application/x-msaccess"
		  Case "me"
		    return "application/x-troff-me"
		  Case "mht", "mhtml"
		    return "message/rfc822"
		  Case "mid"
		    return "audio/mid"
		  Case "mny"
		    return "application/x-msmoney"
		  Case "mov"
		    return "video/quicktime"
		  Case "movie"
		    return "video/x-sgi-movie"
		    return "video/mpeg"
		  Case "mp3"
		    return "audio/mpeg"
		  Case "mp2", "mpa", "mpe", "mpeg", "mpg", "mpv2"
		    return "video/mpeg"
		  Case "mpp"
		    return "application/vnd.ms-project"
		  Case "ms"
		    return "application/x-troff-ms"
		  Case "mvb"
		    return "application/x-msmediaview"
		  Case "nws"
		    return "message/rfc822"
		  Case "oda"
		    return "application/oda"
		  Case "p10"
		    return "application/pkcs10"
		  Case "p12"
		    return "application/x-pkcs12"
		  Case "p7b"
		    return "application/x-pkcs7-certificates"
		  Case "p7c", "p7m"
		    return "application/x-pkcs7-mime"
		  Case "p7r"
		    return "application/x-pkcs7-certreqresp"
		  Case "p7s"
		    return "application/x-pkcs7-signature"
		  Case "pbm"
		    return "image/x-portable-bitmap"
		  Case "pdf"
		    return "application/pdf"
		  Case "pfx"
		    return "application/x-pkcs12"
		  Case "pgm"
		    return "image/x-portable-graymap"
		  Case "pko"
		    return "application/ynd.ms-pkipko"
		  Case "pma","pmc","pmr","pml","pmw"
		    return "application/x-perfmon"
		  Case "pnm"
		    return "image/x-portable-anymap"
		  Case "png"
		    return "image/png"
		  Case "pot,"
		    return "application/vnd.ms-powerpoint"
		  Case "ppm"
		    return "image/x-portable-pixmap"
		  Case "pps","ppt"
		    return "application/vnd.ms-powerpoint"
		  Case "prf"
		    return "application/pics-rules"
		  Case "ps"
		    return "application/postscript"
		  Case "pub"
		    return "application/x-mspublisher"
		  Case "qt"
		    return "video/quicktime"
		  Case "ra","ram"
		    return "audio/x-pn-realaudio"
		  Case "ras"
		    return "image/x-cmu-raster"
		  Case "rgb"
		    return "image/x-rgb"
		  Case "rmi"
		    return "audio/mid"
		  Case "roff"
		    return "application/x-troff"
		  Case "rtf"
		    return "application/rtf"
		  Case "rtx"
		    return "text/richtext"
		  Case "scd"
		    return "application/x-msschedule"
		  Case "sct"
		    return "text/scriptlet"
		  Case "setpay"
		    return "application/set-payment-initiation"
		  Case "setreg"
		    return "application/set-registration-initiation"
		  Case "sh"
		    return "application/x-sh"
		  Case "shar"
		    return "application/x-shar"
		  Case "sit"
		    return "application/x-stuffit"
		  Case "snd"
		    return "audio/basic"
		  Case "spc"
		    return "application/x-pkcs7-certificates"
		  Case "spl"
		    return "application/futuresplash"
		  Case "src"
		    return "application/x-wais-source"
		  Case "sst"
		    return "application/vnd.ms-pkicertstore"
		  Case "stl"
		    return "application/vnd.ms-pkistl"
		  Case "svg"
		    return "image/svg+xml"
		  Case "sv4cpio"
		    return "application/x-sv4cpio"
		  Case "sv4crc"
		    return "application/x-sv4crc"
		  Case "swf"
		    return "application/x-shockwave-flash"
		  Case "t"
		    return "application/x-troff"
		  Case "tar"
		    return "application/x-tar"
		  Case "tcl"
		    return "application/x-tcl"
		  Case "tex"
		    return "application/x-tex"
		  Case "texi"
		    return "application/x-texinfo"
		  Case "texinfo"
		    return "application/x-texinfo"
		  Case "tgz"
		    return "application/x-compressed"
		  Case "tif","tiff"
		    return "image/tiff"
		  Case "tr"
		    return "application/x-troff"
		  Case "trm"
		    return "application/x-msterminal"
		  Case "tsv"
		    return "text/tab-separated-values"
		  Case "txt"
		    return "text/plain"
		  Case "uls"
		    return "text/iuls"
		  Case "ustar"
		    return "application/x-ustar"
		  Case "vcf"
		    return "text/x-vcard"
		  Case "vrml"
		    return "x-world/x-vrml"
		  Case "wav"
		    return "audio/x-wav"
		  Case "wcm"
		    return "application/vnd.ms-works"
		  Case "wdb"
		    return "application/vnd.ms-works"
		  Case "wks"
		    return "application/vnd.ms-works"
		  Case "wmf"
		    return "application/x-msmetafile"
		  Case "wps"
		    return "application/vnd.ms-works"
		  Case "wri"
		    return "application/x-mswrite"
		  Case "wrl"
		    return "x-world/x-vrml"
		  Case "wrz"
		    return "x-world/x-vrml"
		  Case "xaf"
		    return "x-world/x-vrml"
		  Case "xbm"
		    return "image/x-xbitmap"
		  Case "xla","xlc","xlm","xls","xlt","xlw"
		    return "application/vnd.ms-excel"
		  Case "xof"
		    return "x-world/x-vrml"
		  Case "xpm"
		    return "image/x-xpixmap"
		  Case "xwd"
		    return "image/x-xwindowdump"
		  Case "z"
		    return "application/x-compress"
		  Case "zip"
		    return "application/zip"
		  Else
		    return "application/octet-stream"
		  End Select
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub RemoveWebApp(sURL As String)
		  // Remove the web app by the given URL
		  dictWebApps.Remove(sURL)
		  
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h21
		Private ClientSocketPool() As cClientSocket
	#tag EndProperty

	#tag Property, Flags = &h0
		dictWebApps As Dictionary
	#tag EndProperty

	#tag Property, Flags = &h0
		Root As FolderItem
	#tag EndProperty


	#tag Constant, Name = StatusNotFound, Type = String, Dynamic = False, Default = \"404 Not Found", Scope = Public
	#tag EndConstant

	#tag Constant, Name = StatusOK, Type = String, Dynamic = False, Default = \"200 OK", Scope = Public
	#tag EndConstant

	#tag Constant, Name = StatusServerError, Type = String, Dynamic = False, Default = \"500 Server Error", Scope = Public
	#tag EndConstant

	#tag Constant, Name = Version, Type = Double, Dynamic = False, Default = \"1.0", Scope = Public
	#tag EndConstant


	#tag ViewBehavior
		#tag ViewProperty
			Name="Index"
			Visible=true
			Group="ID"
			InitialValue="-2147483648"
			Type="Integer"
			EditorType="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="MaximumSocketsConnected"
			Visible=true
			Group="Behavior"
			InitialValue="10"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="MinimumSocketsAvailable"
			Visible=true
			Group="Behavior"
			InitialValue="2"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Name"
			Visible=true
			Group="ID"
			Type="String"
			EditorType="String"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Port"
			Visible=true
			Group="Behavior"
			InitialValue="0"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Super"
			Visible=true
			Group="ID"
			Type="String"
			EditorType="String"
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
