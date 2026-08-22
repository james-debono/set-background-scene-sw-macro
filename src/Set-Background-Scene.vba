'==============================================================================
' Set Background - Scene
'
' Returns the SOLIDWORKS graphics area to the document's own scene background,
' which is the standard SOLIDWORKS appearance.
'
' This is a system option rather than a document property. It applies to every
' document you open and persists between sessions until it is changed again, and
' nothing is saved into any part, assembly or drawing.
'
' The plain background colour is deliberately left untouched, so running
' "Background - Light" or "Background - Dark" afterwards brings back whichever
' colour you last used rather than a default.
'
' Only the graphics area changes. The surrounding interface - CommandManager,
' FeatureManager, menus and task pane - is controlled separately by the
' "UI - Dark" and "UI - Light" macros, so the two can be combined freely.
'
' To use, run the macro. A document does not need to be open.
'
'   Version   0.2.0
'   Date      2026-08-21
'   Author    James Debono
'   Licence   MIT - full text below
'   Source    https://github.com/james-debono/set-background-scene-sw-macro
'
'------------------------------------------------------------------------------
' CHANGELOG (summary - see CHANGELOG.md for the full history)
'
'   0.2.0   Renamed from "Background - Scene". Now has its own repository.
'   0.1.1   Source URL updated for the repository rename.
'   0.1.0   First numbered release.
'
'------------------------------------------------------------------------------
' MIT Licence
' SPDX-License-Identifier: MIT
'
' Copyright (c) 2026 James Debono
'
' Permission is hereby granted, free of charge, to any person obtaining a copy
' of this software and associated documentation files (the "Software"), to deal
' in the Software without restriction, including without limitation the rights
' to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
' copies of the Software, and to permit persons to whom the Software is
' furnished to do so, subject to the following conditions:
'
' The above copyright notice and this permission notice shall be included in all
' copies or substantial portions of the Software.
'
' THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
' IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
' FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
' AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
' LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
' OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
' SOFTWARE.
'==============================================================================

Option Explicit

Sub main()

    Dim swApp As SldWorks.SldWorks

try_:
    On Error GoTo catch_

    Set swApp = Application.SldWorks

    'Background appearance -> Use document scene background (recommended)
    swApp.SetUserPreferenceIntegerValue _
        swUserPreferenceIntegerValue_e.swColorsBackgroundAppearance, _
        swColorsBackgroundAppearance_e.swColorsBackgroundAppearance_DocumentScene

    RedrawActiveDoc swApp

    GoTo finally_

catch_:
    Debug.Print "Set Background - Scene error: " & Err.Number & " - " & Err.Description
    If Not swApp Is Nothing Then
        swApp.SendMsgToUser2 "Set Background - Scene failed: " & Err.Description, _
            swMessageBoxIcon_e.swMbWarning, swMessageBoxBtn_e.swMbOk
    End If

finally_:

End Sub

'Nudges the graphics area so the new background is visible straight away.
'Silently does nothing when no document is open.
Private Sub RedrawActiveDoc(swApp As SldWorks.SldWorks)

    On Error Resume Next

    Dim swModel As SldWorks.ModelDoc2
    Set swModel = swApp.ActiveDoc

    If Not swModel Is Nothing Then swModel.GraphicsRedraw2

End Sub
