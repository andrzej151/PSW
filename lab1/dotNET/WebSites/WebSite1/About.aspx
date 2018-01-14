<%@ Page Language="C#" AutoEventWireup="true" CodeFile="About.aspx.cs" Inherits="About" %>
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
    <form id="form1" runat="server">
    <div>
    
        <h2>About</h2>
        <p>Unfortunatelly I have nothing to say.</p>
    
    </div>
    </form>

    <ctrl:Footer ID="Footer" runat="server" />
</body>
</html>
