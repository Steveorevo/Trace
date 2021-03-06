#tag Class
Protected Class TraceApp
Implements ciWebApps
	#tag Method, Flags = &h0
		Sub HandleRequest(ByRef Request As cRequest, ByRef Response As cResponse, ByRef HTTPServer As cHTTPServer)
		  // Get the date/time stamp
		  Static sLastTime As String
		  Static nLastTicks As Double
		  Dim sTime As String
		  Dim sTicks As String
		  Dim d As New Date
		  sTime = d.SQLDateTime.GetRightMost(" ")
		  If sTime = sLastTime Then
		    sTicks = CStr(Ticks - nLastTicks).Left(2)
		    If sTicks.Len() = 1 Then sTicks = "0" + sTicks
		  Else
		    sTicks = "00"
		    nLastTicks = Ticks
		  End If
		  
		  // Purge old items from array
		  Dim nMax As Integer = UBound(winTrace.sTStamp) - 64000
		  For n As Integer = 0 to nMax
		    winTrace.sTStamp.Remove(0)
		    winTrace.sMessage.Remove(0)
		  Next
		  
		  // Append new items to array
		  winTrace.sTStamp.Append(sTime + "." + sTicks)
		  winTrace.sMessage.Append(Request.Query("m"))
		  sLastTime = sTime
		  Response.Write("ok")
		  
		  // Queue timer to display when convenient
		  winTrace.tmrUpdate.Mode = Timer.ModeSingle
		  winTrace.tmrUpdate.Reset()
		  
		End Sub
	#tag EndMethod


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
