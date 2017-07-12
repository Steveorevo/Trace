#tag Class
Protected Class cRequest
	#tag Method, Flags = &h0
		Sub Constructor()
		  // Create our dictionaries to hold our client request information
		  Me.dictHeader = New Dictionary
		  Me.dictQuery = New Dictionary
		  Me.dictPost = New Dictionary
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Destructor()
		  // Cleanup our internal objects
		  Me.dictHeader = nil
		  Me.dictQuery = nil
		  Me.dictPost = nil
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Header(sKey As String) As String
		  // Provide a method to return requested header data
		  If Me.dictHeader.HasKey(sKey) Then
		    return Me.dictHeader.value(sKey)
		  Else
		    return ""
		  End If
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Post(sKey As String) As String
		  // Provide a method to return requested post string data
		  If Me.dictPost.HasKey(EncodeURLComponent(sKey)) Then
		    return DecodeURLComponent(Me.dictPost.value(EncodeURLComponent(sKey)))
		  Else
		    return ""
		  End If
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Query(sKey As String) As String
		  // Provide a method to return requested query string data
		  If Me.dictQuery.HasKey(EncodeURLComponent(sKey)) Then
		    return DecodeURLComponent(Me.dictQuery.value(EncodeURLComponent(sKey)))
		  Else
		    return ""
		  End If
		  
		End Function
	#tag EndMethod


	#tag Property, Flags = &h0
		Data As String
	#tag EndProperty

	#tag Property, Flags = &h0
		dictHeader As Dictionary
	#tag EndProperty

	#tag Property, Flags = &h0
		dictPost As Dictionary
	#tag EndProperty

	#tag Property, Flags = &h0
		dictQuery As Dictionary
	#tag EndProperty

	#tag Property, Flags = &h0
		Method As String
	#tag EndProperty

	#tag Property, Flags = &h0
		Path As String
	#tag EndProperty

	#tag Property, Flags = &h0
		Version As String
	#tag EndProperty


	#tag ViewBehavior
		#tag ViewProperty
			Name="data"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
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
			Name="method"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Name"
			Visible=true
			Group="ID"
			Type="String"
		#tag EndViewProperty
		#tag ViewProperty
			Name="path"
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
		#tag ViewProperty
			Name="version"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
