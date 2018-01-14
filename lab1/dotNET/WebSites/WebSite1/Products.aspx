<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Products.aspx.cs" Inherits="Products" %>

<%@ Register src="~/Header.ascx" tagname="Header" tagprefix="ctrl" %>
<%@ Register src="~/Footer.ascx" tagname="Footer" tagprefix="ctrl" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>All about hedgehogs</title>
    <link rel="Stylesheet" href="css/styles.css" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
    <div id="header">
        <ctrl:Header ID="Header" runat="server" />
        <asp:Label ID="labelCart" runat="server" Text="Products in Cart: 0"></asp:Label>
    </div> 
    <div>
    
        <h2>Categories</h2>
        <asp:RadioButtonList ID="RadioButtonList1" runat="server" AutoPostBack="True" onselectedindexchanged="RadioButtonList1_SelectedIndexChanged">
            <asp:ListItem Text="Hedgehogs" Value="hedgehogs"></asp:ListItem>
            <asp:ListItem Text="Smartphones" Value="smartphones"></asp:ListItem>
            <asp:ListItem Text="Food" Value="food"></asp:ListItem>
            </asp:RadioButtonList>
        <div id="productsDiv" runat="server" visible="false">
            <h2>Products</h2>
            <asp:CheckBoxList ID="CheckBoxList1" runat="server" >
        </asp:CheckBoxList>
        <asp:Button ID="addToCartButton" runat="server" Text="Add to Cart" OnClick="addToCartButton_add" />
        </div>
        <asp:Button ID="checkoutButton" runat="server" Text="Checkout" OnClick="checkoutButton_run" />
    </div>    </form>

    <ctrl:Footer ID="Footer" runat="server" />
</body>
</html>
