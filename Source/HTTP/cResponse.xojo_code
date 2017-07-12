#tag Class
Protected Class cResponse
	#tag Method, Flags = &h0
		Sub Constructor()
		  // Prepare default headers
		  Dim dNow As New Date
		  Dim sDate As String
		  
		  dNow.GMTOffset = 0
		  sDate = Left(dNow.LongDate, 3) + ", " + dNow.LongDate.DelRightMost(",").GetRightMost(" ") + " "
		  sDate = sDate + Left(dNow.LongDate.DelLeftMost(", "),3) + " " + CStr(dNow.Year) + " "
		  sDate = sDate + Format(dNow.Hour ,"00")+ ":" + Format(dNow.Minute,"00") + ":" + Format(dNow.Second, "00") + " GMT"
		  Me.Headers = New Dictionary
		  Me.Headers.Value("Date") = sDate
		  Me.Headers.Value("Content-Type") = "text/html"
		  Me.Status = cHTTPServer.StatusOK
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Write(sOut As String)
		  // Append data to the buffer that will be output to client
		  Me.sBuffer = Me.sBuffer + sOut
		  
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h0
		Headers As Dictionary
	#tag EndProperty

	#tag Property, Flags = &h0
		Port As Integer
	#tag EndProperty

	#tag Property, Flags = &h0
		Root As FolderItem
	#tag EndProperty

	#tag Property, Flags = &h0
		sBuffer As String
	#tag EndProperty

	#tag Property, Flags = &h0
		Status As String
	#tag EndProperty


	#tag ViewBehavior
		#tag ViewProperty
			Name="Index"
			Visible=true
			Group="ID"
			InitialValue="-2147483648"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Left"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Name"
			Visible=true
			Group="ID"
			Type="String"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Port"
			Group="Behavior"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="sBuffer"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="status"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Super"
			Visible=true
			Group="ID"
			Type="String"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Top"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
