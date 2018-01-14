<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Checkout.aspx.cs" Inherits="Checkout" %>

<%@ Register src="~/Header.ascx" tagname="Header" tagprefix="ctrl" %>
<%@ Register src="~/Footer.ascx" tagname="Footer" tagprefix="ctrl" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>All about hedgehogs</title>
    <link rel="Stylesheet" href="css/styles.css" type="text/css" />
</head>
<body>
    <div id="header">
        <ctrl:Header ID="Header" runat="server" />
    </div> 
    <div>
        <h2>Checkout</h2>
        <asp:Label ID="labelProdukty" runat="server" Text="Koszyk jest pusty..."></asp:Label>
        </br> </br>
        <asp:Label ID="labelZaProdukty" runat="server" Text=""></asp:Label>
        <form id="form1" runat="server">
            <asp:RadioButtonList ID="RadioButtonListDostawa" runat="server" AutoPostBack="True" onselectedindexchanged="RadioButtonListDostawa_SelectedIndexChanged">
            <asp:ListItem Text="List ekonomiczny: 3,50" Value="ekonomiczny"></asp:ListItem>
            <asp:ListItem Text="List polecony: 5,50" Value="polecony"></asp:ListItem>
            <asp:ListItem Text="Kurier: 15,00" Value="kurier"></asp:ListItem>
            </asp:RadioButtonList>
            </br>
            <asp:Label ID="labelPodsumowanie" runat="server" Text=""></asp:Label>
            </br></br>
            <asp:Button ID="backToProductsButton" runat="server" Text="Back to products" OnClick="backToProductsButton_add" />
            <asp:Button ID="confirmButton" runat="server" Enabled="false" Text="Confirm order" OnClick="confirmButton_add" />
            </br>
            <asp:Button ID="clearCartButton" runat="server" Text="Clear cart" OnClick="clearCartButton_add" />
        </form>
    </div>

    <ctrl:Footer ID="Footer" runat="server" />
</body>
</html>
