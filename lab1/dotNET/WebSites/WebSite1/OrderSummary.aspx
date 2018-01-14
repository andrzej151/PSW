<%@ Page Language="C#" AutoEventWireup="true" CodeFile="OrderSummary.aspx.cs" Inherits="OrderSummary" %>

<%@ Register src="~/Header.ascx" tagname="Header" tagprefix="ctrl" %>
<%@ Register src="~/Footer.ascx" tagname="Footer" tagprefix="ctrl" %>

<!DOCTYPE html>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Podsumowanie</title>
    <link rel="Stylesheet" href="css/styles.css" type="text/css" />
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
</head>
<body>
    <form id="form1" runat="server">
    <div id="header">
        <ctrl:Header ID="Header" runat="server" />
    </div> 
    <div>
        <h1>Podsumowanie zamówienia</h1>
        <span>Dziękujemy za złożenie zamówienia!</span>
        <h2>Produkty</h2>
        <asp:Label ID="labelPodsumowanie" runat="server" Text=""></asp:Label>
        </br>
        <h2>Dostawa</h2>
        <asp:Label ID="labelDostawa" runat="server" Text=""></asp:Label>
        </br>
        <h2>Całkowity koszt</h2>
        <asp:Label ID="labelTotal" runat="server" Text=""></asp:Label>

    </div>
    </form>

    <ctrl:Footer ID="Footer" runat="server" />
</body>
</html>
