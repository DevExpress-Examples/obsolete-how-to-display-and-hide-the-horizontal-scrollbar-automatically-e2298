<%@ Page Language="C#" AutoEventWireup="true"  CodeFile="Default.aspx.cs" Inherits="_Default" %>

<%@ Register Assembly="DevExpress.Web.ASPxPivotGrid.v10.1, Version=10.1.0.0, Culture=neutral, PublicKeyToken=79868b8147b5eae4"
    Namespace="DevExpress.Web.ASPxPivotGrid" TagPrefix="dx" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Untitled Page</title>
    <script type="text/javascript">
        function getShowScrollBar(pivot) {            
            var pivotScrollCommand = document.getElementById('PivotScrollCommand');
            var mainElem = _aspxGetElementById(pivot.name);
            if(pivotScrollCommand.value == "SHOW") {
                if(pivot.GetHorzScrollContentDiv().offsetWidth < mainElem.offsetWidth)
                    return false;
                return true;
            } else 
                return mainElem.offsetWidth >= 800;
        }
        function updatePivotScrollbar(pivot) {
            var showScrollBar = getShowScrollBar(pivot);
            var pivotScrollCommand = document.getElementById('PivotScrollCommand');
            if(showScrollBar != (pivotScrollCommand.value == "SHOW")) {                
                pivotScrollCommand.value = showScrollBar ? "SHOW" : "HIDE";
                var form1 = document.getElementById('form1');
                form1.submit();
                return;
            }
        }
    </script>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <dx:ASPxPivotGrid ID="ASPxPivotGrid1" runat="server" DataSourceID="AccessDataSource1" ClientInstanceName="ASPxPivotGrid1" OnCustomJsProperties="ASPxPivotGrid1_CustomJsProperties">
            <Fields>
                <dx:PivotGridField ID="fieldCategoryName" Area="RowArea" AreaIndex="0" FieldName="CategoryName">
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldProductName" Area="RowArea" AreaIndex="1" FieldName="ProductName">
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldProductSales" Area="DataArea" AreaIndex="0" FieldName="ProductSales">
                </dx:PivotGridField>
                <dx:PivotGridField ID="fieldShippedDate" Area="ColumnArea" AreaIndex="0" FieldName="ShippedDate"
                    GroupInterval="DateYear" UnboundFieldName="fieldShippedDate">
                </dx:PivotGridField>
            </Fields>
            <ClientSideEvents Init="function(s, e) {
	setTimeout('updatePivotScrollbar(ASPxPivotGrid1);', 100);
}" />
        </dx:ASPxPivotGrid>
        <asp:AccessDataSource ID="AccessDataSource1" runat="server" DataFile="~/App_Data/nwind.mdb"
            SelectCommand="SELECT * FROM [ProductReports]"></asp:AccessDataSource>        
        <input id="PivotScrollCommand" type="hidden" runat="server" enableviewstate="true" value="HIDE" /></div>
    </form>
</body>
</html>
