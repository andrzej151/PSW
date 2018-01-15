<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Laboratorium_10._Default" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
    <head id="Head1" runat="server">
        <title>Zakupy online</title>
    </head>
    <body>
        <h2>Zakupy online</h2>

        <form runat="server">
            <asp:Label runat="server">Wybierz kategorię produktów:</asp:Label>
            <br />
            <asp:RadioButtonList runat="server" ID="Categories" OnSelectedIndexChanged="Refresh" AutoPostBack="True">
                <asp:ListItem Selected="True" Value="Fruits">Owoce</asp:ListItem>
                <asp:ListItem Value="Vegetables">Warzywa</asp:ListItem>
                <asp:ListItem Value="Bread">Pieczywo</asp:ListItem>
                <asp:ListItem Value="Milk">Nabiał</asp:ListItem>
            </asp:RadioButtonList>
            <br />
            <asp:Label ID="Label8" runat="server">Wybierz produkty:</asp:Label>
            <br />
            <asp:CheckBoxList runat="server" Visible="False" ID="Fruits" AutoPostBack="True">
                <asp:ListItem Value="2,49">Jabłka (2,49 zł/kg)</asp:ListItem>
                <asp:ListItem Value="4,29">Banany (4,29 zł/kg)</asp:ListItem>
                <asp:ListItem Value="3,33">Pomarańcze (3,33 zł/kg)</asp:ListItem>
                <asp:ListItem Value="4,79">Mandarynki (4,79 zł/kg)</asp:ListItem>
                <asp:ListItem Value="6,69">Kiwi (6,69 zł/kg)</asp:ListItem>
            </asp:CheckBoxList>
            <asp:CheckBoxList runat="server" Visible="False" ID="Vegetables" AutoPostBack="True">
                <asp:ListItem Value="5,49">Pomidor (5,49 zł/kg)</asp:ListItem>
                <asp:ListItem Value="1,69">Cebula (1,69 zł/kg)</asp:ListItem>
                <asp:ListItem Value="1,39">Marchewka (1,39 zł/kg)</asp:ListItem>
            </asp:CheckBoxList>
            <asp:CheckBoxList runat="server" Visible="False" ID="Bread" AutoPostBack="True">
                <asp:ListItem Value="3,33">Chleb pszenno-żytni (3,33 zł/kg)</asp:ListItem>
                <asp:ListItem Value="11,66">Chleb słowiański (11,66 zł/kg)</asp:ListItem>
                <asp:ListItem Value="6,36">Bagietka (6,36 zł/kg)</asp:ListItem>
                <asp:ListItem Value="5,28">Bułka kajzerka (5,28 zł/kg)</asp:ListItem>
            </asp:CheckBoxList>
            <asp:CheckBoxList runat="server" Visible="False" ID="Milk" AutoPostBack="True">
                <asp:ListItem Value="2,69">Mlekovita Polskie Mleko spożywcze 2,0% (2,69 zł/kg)</asp:ListItem>
                <asp:ListItem Value="6,54">FigAND Śmietana cream 12 % (6,54 zł/kg)</asp:ListItem>
                <asp:ListItem Value="7,27">Bakoma Jogurt naturalny (7,27 zł/kg)</asp:ListItem>
                <asp:ListItem Value="14,36">Bieluch Twaróg chudy (14,36 zł/kg)</asp:ListItem>
            </asp:CheckBoxList>
            <asp:Button ID="Submit" runat="server" Text="Dodaj do koszyka." OnClick="Buy" />
            <br /><br />
            <asp:HyperLink NavigateUrl="~/Koszyk.aspx" runat="server">Do koszyka</asp:HyperLink>
            <br />
            <br />
            <asp:Label runat="server" ID="SessionInfo" Visible="False"></asp:Label>
            <br />
            <br />
            <asp:Label runat="server" ID="CartInfoCount" Visible="False"></asp:Label>
            <br />
            <br />
            <asp:Label runat="server" ID="CartInfoProducts" Visible="False"></asp:Label>
        </form>
    </body>
</html>
