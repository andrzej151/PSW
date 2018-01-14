<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>
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
    
        <h2>The website</h2>
        <p>This website contains a lot of things from the previous PHP-backed page BUT! now it's magically set in ASP.NET environment.
            <br /><strong>Neat!</strong>
        </p>
    
    </div>
    </form>

    <ctrl:Footer ID="Footer" runat="server" />
</body>
</html>
