Imports Microsoft.VisualBasic
Imports System
Imports System.Data
Imports System.Configuration
Imports System.Web
Imports System.Web.Security
Imports System.Web.UI
Imports System.Web.UI.WebControls
Imports System.Web.UI.WebControls.WebParts
Imports System.Web.UI.HtmlControls
Imports DevExpress.Web.ASPxPivotGrid

Partial Public Class _Default
	Inherits System.Web.UI.Page
	Protected Sub Page_Load(ByVal sender As Object, ByVal e As EventArgs)
		If PivotScrollCommand.Value = "SHOW" Then
			ASPxPivotGrid1.OptionsView.ShowHorizontalScrollBar = True
			ASPxPivotGrid1.Width = New Unit(800, UnitType.Pixel)
		Else
			ASPxPivotGrid1.OptionsView.ShowHorizontalScrollBar = False
			ASPxPivotGrid1.Width = Unit.Empty
		End If
	End Sub
	Protected Sub ASPxPivotGrid1_CustomJsProperties(ByVal sender As Object, ByVal e As DevExpress.Web.ASPxClasses.CustomJSPropertiesEventArgs)
		e.Properties.Add("cpScrollBarVisible", ASPxPivotGrid1.OptionsView.ShowHorizontalScrollBar)
	End Sub
End Class
