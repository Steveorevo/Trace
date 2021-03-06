#tag Class
Protected Class cClientSocket
Inherits TCPSocket
	#tag Event
		Sub Connected()
		  ''System.DebugLog "ClientSocket Connected " + Str(Me.Handle)
		  
		End Sub
	#tag EndEvent

	#tag Event
		Sub DataAvailable()
		  ''System.DebugLog "ClientSocket DataAvailable " + Str(Me.Handle)
		  
		  // Get the incoming request from the client
		  Static sData As String
		  sData = sData + Me.ReadAll(Encodings.UTF8)
		  
		  // Strip out unecessary CR from Windows systems
		  sData = ReplaceAll(sData, Chr(13), "")
		  
		  // Validate the data or exit until we get more data
		  If InStr(sData, Chr(10) + Chr(10)) = 0 Then Exit
		  
		  // Parse the initial request line
		  Dim myRequest As New cRequest
		  Dim sLine As String
		  Dim sPath As String
		  sLine = sData.GetLeftMost(Chr(10)).Trim()
		  myRequest.Method = sLine.GetLeftMost(" ")
		  sLine = sLine.DelLeftMost(" ")
		  sPath = sLine.GetLeftMost(" ")
		  myRequest.Version = sLine.GetRightMost(" ")
		  sData = sData.DelLeftMost(Chr(10))
		  
		  // Parse the path of any query strings
		  Dim sValue As String
		  Dim sKey As String
		  If InStr(sPath,"?") > 0 Then
		    myRequest.Path = sPath.GetLeftMost("?")
		    sPath = sPath.DelLeftMost("?") + "&"
		    While InStr(sPath, "&") > 0
		      sLine = sPath.GetLeftMost("&")
		      If InStr(sLine,"=") > 0 Then
		        sValue = DecodeURLComponent(sLine.DelLeftMost("="),Encodings.ASCII)
		        sKey = DecodeURLComponent(sLine.GetLeftMost("="),Encodings.ASCII)
		      Else
		        sValue = DecodeURLComponent(sLine, Encodings.ASCII)
		        sKey = ""
		      End If
		      myRequest.dictQuery.Value(sKey) = sValue
		      sPath = sPath.DelLeftMost("&")
		    Wend
		  Else
		    myRequest.Path = sPath
		  End If
		  
		  // Parse out header lines
		  Dim sHLines As String
		  sHLines = sData.GetLeftMost(Chr(10)+Chr(10))
		  While InStr(sHLines, ":") > 0
		    sKey = sHLines.GetLeftMost(":")
		    sHLines = sHLines.DelLeftMost(":")
		    sValue = sHLines.GetLeftMost(Chr(10))
		    sHLines = sHLines.DelLeftMost(Chr(10))
		    myRequest.dictHeader.Value(sKey) = sValue
		  Wend
		  
		  // Store remainder of payload as data
		  sData = sData.DelLeftMost(Chr(10)+Chr(10))
		  myRequest.Data = sData
		  
		  // Parse out POST data into value/keys
		  If myRequest.Method = "POST" And LenB(sData) > 0 Then
		    sData = sData + "&"
		    While InStr(sData, "&") > 0
		      sKey = sData.GetLeftMost("=")
		      sData = sData.DelLeftMost("=")
		      sValue = sData.GetLeftMost("&")
		      sData = sData.DelLeftMost("&")
		      myRequest.dictPost.Value(sKey)=sValue
		    Wend
		  End If
		  sData = ""
		  
		  // Find a matching WebApp to handle the request and response
		  Dim myResponse As New cResponse
		  myResponse.Root = Me.HTTPServer.Root
		  myResponse.Port = Me.HTTPServer.Port
		  sPath = myRequest.Path
		  
		  // Pass request and response objects to WebApp class to handle request
		  If Me.HTTPServer.dictWebApps.HasKey(sPath) Then
		    
		    Dim myWebApp As ciWebApps = Me.HTTPServer.dictWebApps.Value(sPath)
		    Dim myHTTPServer As cHTTPServer = Me.HTTPServer
		    If myWebApp <> Nil Then
		      myWebApp.HandleRequest myRequest, myResponse, myHTTPServer
		    End If
		  Else
		    myResponse.Status = cHTTPServer.StatusNotFound
		  End If
		  
		  // NetLingo bug, ensure buffer has at least one byte
		  If myResponse.sBuffer.Len = 0 Then
		    myResponse.sBuffer = myResponse.sBuffer +" "
		  End If
		  
		  // Add our content length response header
		  myResponse.Headers.Value("Content-Length") = myResponse.sBuffer.LenB
		  
		  // Write out our response following HTTP protocol
		  Dim sOutput As String
		  Dim nCount As Integer
		  sOutput = "HTTP/1.1 " + myResponse.Status + Chr(13) + Chr(10)
		  For nCount = 0 To myResponse.Headers.Count - 1
		    sKey = myResponse.Headers.Key(nCount)
		    sOutput = sOutput + sKey + ": " + myResponse.Headers.Value(sKey) + Chr(13) + Chr(10)
		  Next nCount
		  sOutput = sOutput + Chr(13) + Chr(10) + myResponse.sBuffer 
		  myResponse.sBuffer = ""
		  Me.Write sOutput
		  
		  
		  
		  
		End Sub
	#tag EndEvent

	#tag Event
		Sub Error()
		  ''System.DebugLog "ClientSocket Error " + Str(Me.LastErrorCode)
		End Sub
	#tag EndEvent

	#tag Event
		Sub SendComplete(userAborted as Boolean)
		  ''System.DebugLog "ClientSocket Send Complete " + Str(Me.Handle)
		  Me.Close
		End Sub
	#tag EndEvent

	#tag Event
		Function SendProgress(bytesSent as Integer, bytesLeft as Integer) As Boolean
		  ''System.DebugLog "ClientSocket SendProgress"
		End Function
	#tag EndEvent


	#tag Property, Flags = &h0
		HTTPServer As cHTTPServer
	#tag EndProperty


	#tag ViewBehavior
		#tag ViewProperty
			Name="Address"
			Visible=true
			Group="Behavior"
			Type="String"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Index"
			Visible=true
			Group="ID"
			Type="Integer"
			EditorType="Integer"
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
