using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using DevExpress.Web.ASPxPivotGrid;

public partial class _Default : System.Web.UI.Page {
    protected void Page_Load(object sender, EventArgs e) {
        if(PivotScrollCommand.Value == "SHOW") {
            ASPxPivotGrid1.OptionsView.ShowHorizontalScrollBar = true;
            ASPxPivotGrid1.Width = new Unit(800, UnitType.Pixel);
        } else {
            ASPxPivotGrid1.OptionsView.ShowHorizontalScrollBar = false;
            ASPxPivotGrid1.Width = Unit.Empty;
        }
    }
    protected void ASPxPivotGrid1_CustomJsProperties(object sender, DevExpress.Web.ASPxClasses.CustomJSPropertiesEventArgs e) {
        e.Properties.Add("cpScrollBarVisible", ASPxPivotGrid1.OptionsView.ShowHorizontalScrollBar);
    }
}
