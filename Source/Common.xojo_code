#tag Module
Protected Module Common
	#tag Method, Flags = &h0
		Sub Append(Extends ByRef sInput As String, sStuff As String)
		  // Append additional string content to ourself
		  sInput = sInput + sStuff
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function CollectionToVariantArray(c As Collection) As Variant
		  Dim vValues() As Variant
		  For i As Integer = 1 to c.Count
		    vValues.Append(c.Item(i))
		  Next
		  Return vValues
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub CopyFolder(src as folderItem, dest as folderItem, Optional Prog As Variant, Optional sOwner As String)
		  // Copy the given folder with optional refresh of control (progress wheel, etc)
		  // and assign new owner in the given optional sOwner parameter
		  Dim m as integer
		  Dim rect As RectControl
		  App.DoEvents 1
		  for m = 1 to src.count
		    If Prog <> Nil Then
		      rect = Prog
		      #If TargetMacOS
		        rect.Refresh
		      #Endif
		    End If
		    if src.item(m) <> nil then
		      if src.item(m).directory then
		        dest.child(src.item(m).name).createAsFolder
		        If sOwner <> "" Then
		          dest.child(src.item(m).name).Owner = sOwner
		        End if
		        CopyFolder(src.item(m), dest.child(src.item(m).name), Prog, sOwner)
		      else
		        
		        // Copy the given item
		        src.item(m).copyFileTo dest
		        
		        // Re-assign optional owner parameter
		        If sOwner <> "" Then
		          dest.Owner = sOwner
		        End if
		      end if
		    end if
		  next
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function CountString(Extends sSubject As String, sSearch As String) As Integer
		  // Return the number of occurances of sSearch in sSubject
		  Dim nCount As Integer
		  While InStr(sSubject, sSearch) > 0
		    sSubject = sSubject.DelLeftMost(sSearch)
		    nCount = nCount + 1
		  Wend
		  Return nCount
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub CreatePath(sNewPath As String)
		  // Create the path in the given FolderItem path, ensuring it exists
		  Dim sDel As String
		  #If TargetMacOS
		    sDel = ":"
		  #Else
		    sDel = "\"
		  #Endif
		  
		  // Create an array of the folder names
		  Dim aFolders() As String
		  Dim sPath As String = sDel + sNewPath
		  If sPath.Right(1) = sDel Then sPath = sPath.DelRightMost(sDel)
		  While sPath.InStr(sDel) <> 0
		    aFolders.Append(sPath.GetRightMost(sDel) + sDel)
		    sPath = sPath.DelRightMost(sDel)
		  Wend
		  
		  // Sequentially attempt to create the given path
		  Dim fiPath As FolderItem
		  sPath = aFolders.Pop
		  fiPath = New FolderItem(sPath, FolderItem.PathTypeAbsolute)
		  While aFolders.Ubound <> -1
		    sPath = aFolders.Pop
		    fiPath = fiPath.Child(sPath)
		    If Not fiPath.Exists Then
		      fiPath.CreateAsFolder
		    End If
		  Wend
		  Exit Sub
		  Exception
		    MsgBox "Error - Unable to create path."
		    
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub DeleteFolder(aFolder as FolderItem)
		  if aFolder.Directory then
		    for n as Integer = aFolder.Count downto 1
		      DeleteFolder aFolder.TrueItem(n)
		    next
		  end if
		  aFolder.Delete
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function DelLeftMost(Extends sInput As String, sFind As String) As String
		  Dim n As Integer
		  n = sInput.InStr(sFind)
		  if (n > 0) then
		    return sInput.Right(Len(sInput) - n - Len(sFind) + 1)
		  else
		    return sInput
		  end if
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function DelRightMost(Extends sInput As String, sFind As String) As String
		  Dim n As Integer
		  n = sInput.InStrRev(sFind)
		  if (n > 0) then
		    Return sInput.Left(n-1)
		  else
		    Return sInput
		  end if
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function dictItem(Extends c As Collection, index As Integer) As Dictionary
		  // Ensure that we return a dictionary object
		  Return Dictionary(c.Item(index))
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub DoAppleScript(sScript As String)
		  #If TargetMacOS
		    
		    // Execute the given AppleScript asynchronously from the temp folder
		    Dim fi As FolderItem = SpecialFolder.Temporary.Child(App.ExecutableFile.Name + ".scpt")
		    Dim tos As TextOutputStream
		    If fi.Exists Then fi.Delete
		    tos = TextOutputStream.Create(fi)
		    tos.Write(sScript)
		    tos.Close
		    
		    // Shell our temp file async
		    Dim sh As New Shell
		    sh.Mode = 1 ' Async
		    Dim sCmd As String = "osascript " + Chr(34) + fi.ShellPath.ReplaceAll("\-","-").ReplaceAll("\+","+").ReplaceAll("\ ", " ") + Chr(34) + " &"
		    sh.TimeOut = 30
		    sh.Execute(sCmd)
		    WaitSeconds 1 ' hang out for at least 1 second
		    // Don't close, just set the timeout and leave
		  #Endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub DoVBScript(sScript As String)
		  #If TargetWin32
		    // Execute the given VBScript asynchronously from the temp folder
		    Dim fi As FolderItem = SpecialFolder.Temporary.Child(App.ExecutableFile.Name + ".vbs")
		    Dim tos As TextOutputStream
		    If fi.Exists Then fi.Delete
		    tos = TextOutputStream.Create(fi)
		    tos.Write(sScript)
		    tos.Close
		    fi.Launch
		  #Endif
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetAppFolder() As FolderItem
		  // A cross platform way to get the application folder of the currently running executable
		  #If TargetMacOS
		    
		    // Return the folder that the .app lives in on Mac
		    Return GetFolderItemByURL(App.ExecutableFile.URLPath.DelRightMost(".app/Contents").DelRightMost("/"))
		  #Else
		    
		    // Return the folder that the .exe lives in on Windows
		    #If DebugBuild
		      
		      // Backup one folder when its a debug build
		      Return GetFolderItemByURL(App.ExecutableFile.URLPath.DelRightMost("/").DelRightMost("/"))
		    #Else
		      Return GetFolderItemByURL(App.ExecutableFile.URLPath.DelRightMost("/"))
		    #Endif
		  #Endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetFolderItemByURL(sPath As String) As FolderItem
		  // A fix for RB's GetFolderItem that fails on PathTypeURL because of un encoded spaces
		  Return GetFolderItem(sPath.ReplaceAll(" ", "%20"), FolderItem.PathTypeURL)
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetLeftMost(Extends sInput As String, sFind As String) As String
		  Dim n As Integer
		  n = sInput.InStr(sFind)
		  if (n > 1) Then
		    return sInput.Left(n -1)
		  else
		    If sInput = sFind Then
		      return ""
		    Else
		      return sInput
		    End If
		  end if
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetRightMost(Extends sInput As String, sFind As String) As String
		  Dim n As Integer
		  n = sInput.InStrRev(sFind)
		  if (n > 0) then
		    return sInput.Right(Len(sInput) - (n + Len(sFind) -1))
		  else
		    return sInput
		  end if
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function InStrRev(Extends source As String, startPos As Integer=-1, substr As String) As Integer
		  // Similar to InStr, but searches backwards from the given position
		  // (or if startPos = -1, then from the end of the string).
		  // If substr can't be found, returns 0.
		  Dim srcLen As Integer = source.Len
		  if startPos = -1 then startPos = srcLen
		  
		  // Here's an easy way...
		  // There may be a faster implementation, but then again, there may not -- it probably
		  // depends on the particulars of the data.
		  Dim reversedSource As String = Reverse(source)
		  Dim reversedSubstr As String = Reverse(substr)
		  Dim reversedPos As Integer
		  reversedPos = InStr( srcLen - startPos + 1, reversedSource, reversedSubstr )
		  if reversedPos < 1 then return 0
		  return srcLen - reversedPos - substr.Len + 2
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Reverse(s As String) As String
		  // Return s with the characters in reverse order.
		  
		  if Len(s) < 2 then return s
		  
		  Dim characters() as String = Split( s, "" )
		  Dim leftIndex as Integer = 0
		  Dim rightIndex as Integer = UBound(characters)
		  #pragma BackgroundTasks False
		  While leftIndex < rightIndex
		    Dim temp as String = characters(leftIndex)
		    characters(leftIndex) = characters(rightIndex)
		    characters(rightIndex) = temp
		    leftIndex = leftIndex + 1
		    rightIndex = rightIndex - 1
		  Wend
		  Return Join( characters, "" )
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SetValue(Extends dictValue As Dictionary, vKey As Variant, vValue As Variant)
		  dictValue.Value(vKey) = vValue
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Value(Extends dictValue As Dictionary, vKey As Variant) As Variant
		  Dim vReturn As Variant
		  vReturn =  dictValue.Value(vKey)
		  Return vReturn
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function VariantArrayToCollection(v As Variant) As Collection
		  Dim vValues() As Variant
		  Dim c As New Collection
		  vValues = v
		  For i As Integer = 0 to UBound(vValues)
		    c.Add(vValues(i))
		  Next
		  Return c
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function VariantArrayToStringArray(vArray() As Variant) As String()
		  // Simply convert a variant array to a string array
		  Dim sArray() As String
		  ReDim sArray(UBound(vArray))
		  For i As Integer = 0 to UBound(vArray)
		    sArray(i) = Str(vArray(i))
		  Next
		  Return sArray
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub WaitSeconds(nSecs As Integer, Optional Prog As Variant)
		  '' This routine simply holds the instruction pointer in the current thread
		  '' for the number of seconds specified in nSecs
		  Dim nCount As Integer
		  Dim rect As RectControl
		  while(nCount < nSecs)
		    Dim r As Integer
		    For r = 1 to 10
		      If Prog <> Nil Then
		        rect = Prog
		        #If TargetMacOS
		          rect.Refresh
		        #Endif
		      End If
		      App.DoEvents 100
		    Next r
		    nCount = nCount + 1
		  wend
		  
		End Sub
	#tag EndMethod


	#tag Note, Name = ReadMe
		Copyright 2011 Virtuosoft
		
		
	#tag EndNote


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
End Module
#tag EndModule
