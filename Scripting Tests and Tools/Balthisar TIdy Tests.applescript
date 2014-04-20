--	Balthisar Tidy Test Suite
--
--	Simple tests for Balthisar Tidy's AppleScript implementation.
--
--	Created by: Jim Derry
--	Created on: 04/19/14 09:47:16
--
--	Copyright © 2014 Jim Derry
--	All Rights Reserved
--

global scriptPath
global theSampleFile

----------------------------------------------------------------
--	run
----------------------------------------------------------------
on run
	-- configure these
	set theSampleFileName to "Sample Dirty Document.html"
	-- end user configuration
	
	tell application "Finder"
		set scriptPath to (container of file (path to me)) as string
		set theSampleFile to (scriptPath & theSampleFileName) as string
	end tell
	
	set theChoice to display dialog "Please choose a test." buttons {"Standard Suite", "Developer Suite", "Quit"} default button "Quit"
	if button returned of theChoice is "Developer Suite" then
		test_developer_suite()
	else if button returned of theChoice is "Standard Suite" then
		test_standard_suite(theSampleFileName, scriptPath, theSampleFile)
	else
		return
	end if
end run

----------------------------------------------------------------
--	test_standard_suite
----------------------------------------------------------------
on test_standard_suite(theSampleFileName, scriptPath, theSampleFile)
	
	----------------------------------------------
	-- Setup some stuff.
	--	We will use these filenames later.
	----------------------------------------------
	local fileNameBase
	local fileNameExtension
	local saveAsFilename
	local theOpenDocument
	local theNewDocument
	
	set text item delimiters to "."
	
	set fileNameBase to (text items 1 through -2 of theSampleFileName) as text
	set fileNameExtension to (text item 2 of theSampleFileName) as text
	set saveAsFilename to fileNameBase & "-test save as." & fileNameExtension
	set saveWhenClosingFilename to fileNameBase & "-test save when closing." & fileNameExtension
	
	
	----------------------------------------------
	-- Run through the suite
	----------------------------------------------
	
	okDialog("Balthisar Tidy will open and `activate`.")
	tell application "Balthisar Tidy" to activate
	
	okDialog("Balthisar Tidy will `open` the sample document '" & theSampleFileName & ".'")
	tell application "Balthisar Tidy" to set theOpenDocument to (open theSampleFile)
	
	okDialog("Balthisar Tidy will `save` the sample document as '" & saveAsFilename & ".'")
	tell application "Balthisar Tidy" to save theOpenDocument in (scriptPath & saveAsFilename)
	
	okDialog("Balthisar Tidy will `make` a new document.")
	tell application "Balthisar Tidy" to set theNewDocument to (make new document)
	
	tell application "Balthisar Tidy" to count documents
	okDialog("The `count` of all documents is now " & result & ".")
	
	okDialog("Balthisar Tidy will `delete` the new document that was recently made.")
	tell application "Balthisar Tidy" to delete theNewDocument
	
	tell application "Balthisar Tidy" to count documents
	okDialog("Now the `count` of all documents is " & result & ".")
	
	tell application "Balthisar Tidy" to exists theOpenDocument
	okDialog("By the way, let's test whether the test document still `exists`: " & (result as text))
	
	okDialog("Balthisar Tidy will attempt to `print` the testing document.")
	tell application "Balthisar Tidy"
		try
			print theOpenDocument print dialog yes
		end try
	end tell
	
	okDialog("Balthisar Tidy will attempt to `close` the testing document saving it as.")
	tell application "Balthisar Tidy" to close theOpenDocument saving yes saving in (scriptPath & saveWhenClosingFilename)
	
	okDialog("Balthisar Tidy will `quit` without saving.")
	tell application "Balthisar Tidy" to quit saving no
	
end test_standard_suite



----------------------------------------------------------------
--	test_developer_suite()
----------------------------------------------------------------
on test_developer_suite()
	
	tell application "Balthisar Tidy" to set windowStatus to preferencesWindowIsVisible
	
	if (windowStatus) then
		okDialog("Balthisar Tidy's preference window is already open.")
	else
		okDialog("Balthisar Tidy will open the preferences window.")
		tell application "Balthisar Tidy" to set preferencesWindowIsVisible to yes
	end if
	
	tell application "Balthisar Tidy" to set panelCount to (countOfPrefsWindowPanels as text)
	okDialog("Balthisar Tidy has " & panelCount & " preferences panels. I will cycle through them all.")
	
	tell application "Balthisar Tidy"
		repeat with i from 1 to panelCount
			set indexOfVisiblePrefsWindowPanel to i
			delay 3
		end repeat
		set indexOfVisiblePrefsWindowPanel to 1
	end tell
	
	okDialog("Balthisar Tidy will close the preferences window.")
	tell application "Balthisar Tidy" to set preferencesWindowIsVisible to no
	
end test_developer_suite


----------------------------------------------------------------
--	okDialog
----------------------------------------------------------------
on okDialog(theMessage)
	
	return display dialog (theMessage as text) buttons {"OK"} default button "OK"
	
end okDialog
