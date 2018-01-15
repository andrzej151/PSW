<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Koszyk.aspx.cs" Inherits="Laboratorium_10._Koszyk" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
    <head id="Head1" runat="server">
        <title>Koszyk</title>
    </head>
    <body>
        <h2>Zakupy online</h2>
        <h3>Twój koszyk</h3>

        <form id="Form1" runat="server">
            <asp:Label ID="CartInfo" Visible="False" runat="server">Zawartość koszyka:</asp:Label>
            <br />
            <asp:CheckBoxList runat="server" Visible="False" ID="Cart" AutoPostBack="True" OnSelectedIndexChanged="Cart_SelectedIndexChanged">
            </asp:CheckBoxList>
            <br />
            <asp:Label ID="Total" runat="server">Zawartość koszyka:</asp:Label>
            <br />
            <asp:Button ID="Remove" runat="server" Text="Skasuj produkty" Visible="False" OnClick="RemoveProducts" />
            <br />
            <br />
            <asp:HyperLink ID="HyperLink1" NavigateUrl="~/Default.aspx" runat="server">Powrót</asp:HyperLink>
        </form>
    </body>
</html>
