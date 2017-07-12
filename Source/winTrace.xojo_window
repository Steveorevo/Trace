#tag Window
Begin Window winTrace
   BackColor       =   &cFFFFFF00
   Backdrop        =   0
   CloseButton     =   True
   Compatibility   =   ""
   Composite       =   False
   Frame           =   7
   FullScreen      =   False
   FullScreenButton=   False
   HasBackColor    =   False
   Height          =   400
   ImplicitInstance=   True
   LiveResize      =   True
   MacProcID       =   0
   MaxHeight       =   32000
   MaximizeButton  =   True
   MaxWidth        =   32000
   MenuBar         =   0
   MenuBarVisible  =   True
   MinHeight       =   64
   MinimizeButton  =   True
   MinWidth        =   64
   Placement       =   0
   Resizeable      =   True
   Title           =   " Trace"
   Visible         =   True
   Width           =   600
   Begin Canvas Canvas1
      AcceptFocus     =   False
      AcceptTabs      =   False
      AutoDeactivate  =   True
      Backdrop        =   0
      DoubleBuffer    =   False
      Enabled         =   True
      EraseBackground =   True
      Height          =   400
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   0
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   True
      Scope           =   0
      TabIndex        =   4
      TabPanelIndex   =   0
      TabStop         =   True
      Top             =   0
      Transparent     =   True
      UseFocusRing    =   True
      Visible         =   True
      Width           =   600
      Begin TextArea txtLog
         AcceptTabs      =   True
         Alignment       =   0
         AutoDeactivate  =   True
         AutomaticallyCheckSpelling=   True
         BackColor       =   &cFFFFFF00
         Bold            =   False
         Border          =   True
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         Format          =   ""
         Height          =   342
         HelpTag         =   ""
         HideSelection   =   False
         Index           =   -2147483648
         InitialParent   =   "Canvas1"
         Italic          =   False
         Left            =   13
         LimitText       =   0
         LineHeight      =   0.0
         LineSpacing     =   1.0
         LockBottom      =   True
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   True
         LockTop         =   True
         Mask            =   ""
         Multiline       =   True
         ReadOnly        =   True
         Scope           =   0
         ScrollbarHorizontal=   True
         ScrollbarVertical=   True
         Styled          =   True
         TabIndex        =   1
         TabPanelIndex   =   0
         TabStop         =   True
         Text            =   ""
         TextColor       =   &c00000000
         TextFont        =   "Courier"
         TextSize        =   0.0
         TextUnit        =   0
         Top             =   48
         Underline       =   False
         UseFocusRing    =   False
         Visible         =   True
         Width           =   574
      End
   End
   Begin TextField txtFilter
      AcceptTabs      =   False
      Alignment       =   0
      AutoDeactivate  =   True
      AutomaticallyCheckSpelling=   False
      BackColor       =   &cFFFFFF00
      Bold            =   False
      Border          =   True
      CueText         =   ""
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Format          =   ""
      Height          =   22
      HelpTag         =   ""
      Index           =   -2147483648
      Italic          =   False
      Left            =   57
      LimitText       =   0
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   True
      Mask            =   ""
      Password        =   False
      ReadOnly        =   False
      Scope           =   0
      TabIndex        =   0
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   ""
      TextColor       =   &c00000000
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   14
      Underline       =   False
      UseFocusRing    =   True
      Visible         =   True
      Width           =   443
   End
   Begin Label Label1
      AutoDeactivate  =   True
      Bold            =   False
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   20
      HelpTag         =   "Hide matching lines (comma seperated values)"
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   13
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Multiline       =   False
      Scope           =   0
      Selectable      =   False
      TabIndex        =   1
      TabPanelIndex   =   0
      Text            =   "Filter:"
      TextAlign       =   0
      TextColor       =   &c00000000
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   15
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   44
   End
   Begin BevelButton btnClear
      AcceptFocus     =   False
      AutoDeactivate  =   True
      BackColor       =   &c00000000
      Bevel           =   0
      Bold            =   False
      ButtonType      =   0
      Caption         =   "Clear"
      CaptionAlign    =   3
      CaptionDelta    =   0
      CaptionPlacement=   1
      Enabled         =   True
      HasBackColor    =   False
      HasMenu         =   0
      Height          =   22
      HelpTag         =   ""
      Icon            =   0
      IconAlign       =   0
      IconDX          =   0
      IconDY          =   0
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   512
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   True
      MenuValue       =   0
      Scope           =   0
      TabIndex        =   3
      TabPanelIndex   =   0
      TabStop         =   True
      TextColor       =   &c00000000
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   14
      Underline       =   False
      Value           =   False
      Visible         =   True
      Width           =   75
   End
   Begin Timer tmrUpdate
      Index           =   -2147483648
      InitialParent   =   ""
      LockedInPosition=   False
      Mode            =   0
      Period          =   1000
      Scope           =   0
      TabPanelIndex   =   "0"
   End
End
#tag EndWindow

#tag WindowCode
	#tag Event
		Sub Close()
		  // Close our server, cleanup and quit
		  myHTTPServer.StopListening
		  Quit
		End Sub
	#tag EndEvent

	#tag Event
		Sub Moved()
		  Self.OrigTop = Self.Top
		End Sub
	#tag EndEvent

	#tag Event
		Sub Open()
		  // Allow only one instance of the application in memory
		  App.Instance = New Mutex(App.ExecutableFile.Name)
		  If not App.Instance.TryEnter then
		    Quit
		  End if
		  
		  // Ensure we quit on Mac
		  App.AutoQuit = True
		  
		  // Windows fix for HiDPI
		  btnClear.TextUnit = FontUnits.Point
		  
		  // Create our debug HTTP Server
		  myHTTPServer = New cHTTPServer
		  myHTTPServer.Port = 8189
		  
		  // Create our webapp to add to server
		  Dim myTraceApp As New TraceApp
		  myHTTPServer.AddWebApp("/trace",myTraceApp)
		  myHTTPServer.Listen
		  
		  // Get our initial position
		  Self.OrigHeight = Self.Height
		  Self.OrigTop = Self.Top
		  
		  
		  
		End Sub
	#tag EndEvent


	#tag Property, Flags = &h0
		myHTTPServer As cHTTPServer
	#tag EndProperty

	#tag Property, Flags = &h0
		OrigHeight As Integer
	#tag EndProperty

	#tag Property, Flags = &h0
		OrigTop As Integer
	#tag EndProperty

	#tag Property, Flags = &h0
		sMessage() As String
	#tag EndProperty

	#tag Property, Flags = &h0
		sTStamp() As String
	#tag EndProperty


#tag EndWindowCode

#tag Events Canvas1
	#tag Event
		Sub DoubleClick(X As Integer, Y As Integer)
		  // Collapse, remembering the window size
		  If Self.Height > 30 Then
		    Self.OrigHeight = Self.Height
		    Self.Top = Self.OrigTop
		    Self.Height = 14
		  Else
		    Self.Height = Self.OrigHeight
		    
		    // Bump top up if off screen
		    If Self.Height + Self.Top > Screen(0).AvailableHeight Then
		      Dim nKeep As Integer
		      nKeep = Self.OrigTop
		      Self.Top = Screen(0).AvailableHeight - Self.Height
		      WaitSeconds 1
		      Self.OrigTop = nKeep
		    End If
		  End If
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events txtLog
	#tag Event
		Sub KeyUp(Key As String)
		  // Support copy, cut & paste
		  #If TargetMacOS Then
		    If Keyboard.CommandKey Then
		      Dim c As New Clipboard
		      If Key = "x" Or Key = "c" Then
		        c.SetText Me.Text.Mid(Me.SelStart + 1, Me.SelLength)
		        c.Close
		        If Not Me.ReadOnly And Key = "x" Then
		          Dim nStart As Integer = Me.SelStart
		          Me.Text = Me.Text.Mid(0, Me.SelStart + 1) + Me.Text.Mid(Me.SelStart + Me.SelLength + 1,Me.Text.Len())
		          Me.SelStart = nStart
		          Me.SelLength = 0
		        End If
		      End If
		      If Not Me.ReadOnly And Key = "v" Then
		        If c.TextAvailable() Then
		          Dim nStart As Integer = Me.SelStart
		          Me.Text = Me.Text.Mid(0, Me.SelStart + 1) + c.Text + Me.Text.Mid(Me.SelStart + Me.SelLength + 1,Me.Text.Len())
		          Me.SelStart = nStart + c.Text.Len()
		          Me.SelLength = 0
		        End If
		      End If
		    End If
		  #EndIf
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events txtFilter
	#tag Event
		Sub KeyUp(Key As String)
		  // Support copy, cut & paste
		  #If TargetMacOS Then
		    If Keyboard.CommandKey Then
		      Dim c As New Clipboard
		      If Key = "x" Or Key = "c" Then
		        c.SetText Me.Text.Mid(Me.SelStart + 1, Me.SelLength)
		        c.Close
		        If Not Me.ReadOnly And Key = "x" Then
		          Dim nStart As Integer = Me.SelStart
		          Me.Text = Me.Text.Mid(0, Me.SelStart + 1) + Me.Text.Mid(Me.SelStart + Me.SelLength + 1,Me.Text.Len())
		          Me.SelStart = nStart
		          Me.SelLength = 0
		        End If
		      End If
		      If Not Me.ReadOnly And Key = "v" Then
		        If c.TextAvailable() Then
		          Dim nStart As Integer = Me.SelStart
		          Me.Text = Me.Text.Mid(0, Me.SelStart + 1) + c.Text + Me.Text.Mid(Me.SelStart + Me.SelLength + 1,Me.Text.Len())
		          Me.SelStart = nStart + c.Text.Len()
		          Me.SelLength = 0
		        End If
		      End If
		    End If
		  #EndIf
		End Sub
	#tag EndEvent
	#tag Event
		Sub TextChange()
		  tmrUpdate.Mode = Timer.ModeSingle
		  tmrUpdate.Reset
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events btnClear
	#tag Event
		Sub Action()
		  // Clear the display
		  ReDim winTrace.sMessage(-1)
		  ReDim winTrace.sTStamp(-1)
		  txtLog.Text = ""
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events tmrUpdate
	#tag Event
		Sub Action()
		  // Sync our message queue with the interface
		  Dim sFilter As String
		  Dim sText As String
		  For n As Integer = 0 to UBound(winTrace.sTStamp)
		    
		    // Filter out list
		    Dim bFilter As Boolean = False
		    sFilter = txtFilter.Text + ","
		    While sFilter.InStr(",") > 0
		      If winTrace.sMessage(n).InStr(sFilter.GetLeftMost(",").Trim()) > 0 Then
		        bFilter = True
		        Exit
		      End If
		      sFilter = sFilter.DelLeftMost(",")
		    Wend
		    If Not bFilter Then
		      sText = sText + winTrace.sTStamp(n) + " " + winTrace.sMessage(n) + Chr(13)
		    End If
		  Next n
		  txtLog.Text = sText
		  
		  // Implement scroll to bottom behavior
		  #If TargetMacOS
		    txtLog.ScrollPosition = txtLog.LineNumAtCharPos(txtLog.Text.Len())
		  #EndIf
		  txtLog.SelStart = txtLog.Text.Len()
		  txtLog.SelLength = 0
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag ViewBehavior
	#tag ViewProperty
		Name="BackColor"
		Visible=true
		Group="Appearance"
		InitialValue="&hFFFFFF"
		Type="Color"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Backdrop"
		Visible=true
		Group="Appearance"
		Type="Picture"
		EditorType="Picture"
	#tag EndViewProperty
	#tag ViewProperty
		Name="CloseButton"
		Visible=true
		Group="Appearance"
		InitialValue="True"
		Type="Boolean"
		EditorType="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Composite"
		Visible=true
		Group="Appearance"
		InitialValue="False"
		Type="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Frame"
		Visible=true
		Group="Appearance"
		InitialValue="0"
		Type="Integer"
		EditorType="Enum"
		#tag EnumValues
			"0 - Document"
			"1 - Movable Modal"
			"2 - Modal Dialog"
			"3 - Floating Window"
			"4 - Plain Box"
			"5 - Shadowed Box"
			"6 - Rounded Window"
			"7 - Global Floating Window"
			"8 - Sheet Window"
			"9 - Metal Window"
			"11 - Modeless Dialog"
		#tag EndEnumValues
	#tag EndViewProperty
	#tag ViewProperty
		Name="FullScreen"
		Visible=true
		Group="Appearance"
		InitialValue="False"
		Type="Boolean"
		EditorType="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="FullScreenButton"
		Visible=true
		Group="Frame"
		InitialValue="False"
		Type="Boolean"
		EditorType="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="HasBackColor"
		Visible=true
		Group="Appearance"
		InitialValue="False"
		Type="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Height"
		Visible=true
		Group="Position"
		InitialValue="400"
		Type="Integer"
	#tag EndViewProperty
	#tag ViewProperty
		Name="ImplicitInstance"
		Visible=true
		Group="Appearance"
		InitialValue="True"
		Type="Boolean"
		EditorType="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Interfaces"
		Visible=true
		Group="ID"
		Type="String"
		EditorType="String"
	#tag EndViewProperty
	#tag ViewProperty
		Name="LiveResize"
		Visible=true
		Group="Appearance"
		InitialValue="True"
		Type="Boolean"
		EditorType="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="MacProcID"
		Visible=true
		Group="Appearance"
		InitialValue="0"
		Type="Integer"
	#tag EndViewProperty
	#tag ViewProperty
		Name="MaxHeight"
		Visible=true
		Group="Position"
		InitialValue="32000"
		Type="Integer"
	#tag EndViewProperty
	#tag ViewProperty
		Name="MaximizeButton"
		Visible=true
		Group="Appearance"
		InitialValue="False"
		Type="Boolean"
		EditorType="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="MaxWidth"
		Visible=true
		Group="Position"
		InitialValue="32000"
		Type="Integer"
	#tag EndViewProperty
	#tag ViewProperty
		Name="MenuBar"
		Visible=true
		Group="Appearance"
		Type="MenuBar"
		EditorType="MenuBar"
	#tag EndViewProperty
	#tag ViewProperty
		Name="MenuBarVisible"
		Visible=true
		Group="Appearance"
		InitialValue="True"
		Type="Boolean"
		EditorType="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="MinHeight"
		Visible=true
		Group="Position"
		InitialValue="64"
		Type="Integer"
	#tag EndViewProperty
	#tag ViewProperty
		Name="MinimizeButton"
		Visible=true
		Group="Appearance"
		InitialValue="True"
		Type="Boolean"
		EditorType="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="MinWidth"
		Visible=true
		Group="Position"
		InitialValue="64"
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
		Name="OrigHeight"
		Group="Behavior"
		Type="Integer"
	#tag EndViewProperty
	#tag ViewProperty
		Name="OrigTop"
		Group="Behavior"
		Type="Integer"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Placement"
		Visible=true
		Group="Position"
		InitialValue="0"
		Type="Integer"
		EditorType="Enum"
		#tag EnumValues
			"0 - Default"
			"1 - Parent Window"
			"2 - Main Screen"
			"3 - Parent Window Screen"
			"4 - Stagger"
		#tag EndEnumValues
	#tag EndViewProperty
	#tag ViewProperty
		Name="Resizeable"
		Visible=true
		Group="Appearance"
		InitialValue="True"
		Type="Boolean"
		EditorType="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Super"
		Visible=true
		Group="ID"
		Type="String"
		EditorType="String"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Title"
		Visible=true
		Group="Appearance"
		InitialValue="Untitled"
		Type="String"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Visible"
		Visible=true
		Group="Appearance"
		InitialValue="True"
		Type="Boolean"
		EditorType="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Width"
		Visible=true
		Group="Position"
		InitialValue="600"
		Type="Integer"
	#tag EndViewProperty
#tag EndViewBehavior
