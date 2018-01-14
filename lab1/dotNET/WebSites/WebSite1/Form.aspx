<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Form.aspx.cs" Inherits="Form" %>
<%@ Register src="~/Header.ascx" tagname="Header" tagprefix="ctrl" %>
<%@ Register src="~/Footer.ascx" tagname="Footer" tagprefix="ctrl" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Forms test</title>
    <link rel="Stylesheet" href="css/styles.css" type="text/css" />
</head>
<body>    
    <div id="header">
        <ctrl:Header ID="Header" runat="server" />
    </div> 
    <div>
        <asp:Label runat="server" ID="label1"></asp:Label>
    </div>

        <h3>Register</h3>

        <form id="plainform" runat="server" autocomplete="on" method="post" action="">
      <div class="plain-form">

        <div class="plain-row">
          <fieldset>
            <label class="label">First Name</label>
            <div class="userinput">
              <input type="text" name="name" autofocus placeholder="Jan"/>
            </div>
          </fieldset>
        </div>

        <div class="plain-row">
          <fieldset>
            <label class="label">Surname</label>
            <div class="userinput">
              <input type="text" name="surname" placeholder="Kowalski" />
            </div>
          </fieldset>
        </div>

        <div class="plain-row">
          <fieldset>
            <label class="label">E-mail</label>
            <div class="userinput">
                <asp:Textbox placeholder="example@example.com" id="email" runat="server"></asp:Textbox>
                <asp:RequiredFieldValidator id="RequiredFieldValidator_email" runat="server"
                    ControlToValidate="email"
                    ErrorMessage="Email is a required field."
                    ForeColor="Red">
                </asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator runat="server" ErrorMessage="It isn't e-mail address!" ControlToValidate="email" ValidationExpression="\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
            </div>
          </fieldset>
        </div>

        <div class="plain-row">
          <fieldset>
            <label class="label">Preferred color</label>
            <div class="userinput">
              <input type="color" name="color" value="#ff0000">
            </div>
          </fieldset>
        </div>

        <div class="plain-row">
          <fieldset>
            <label class="label">Street</label>
            <div class="userinput">
                <asp:Textbox placeholder="Washington St" id="street" runat="server"></asp:Textbox>
                <asp:RequiredFieldValidator id="RequiredFieldValidator_street" runat="server"
                    ControlToValidate="street"
                    ErrorMessage="Street is a required field."
                    ForeColor="Red">
                </asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator runat="server" ErrorMessage="Letters Only!" ControlToValidate="street" ValidationExpression="^[^\W\d_]+$"></asp:RegularExpressionValidator>
            </div>
          </fieldset>
        </div>

        <div class="plain-row">
          <fieldset>
            <label class="label">Number</label>
            <div class="userinput">
              <asp:Textbox placeholder="15/9a" id="number" runat="server"></asp:Textbox>
                <asp:RequiredFieldValidator id="RequiredFieldValidator_number" runat="server"
                    ControlToValidate="number"
                    ErrorMessage="Number is a required field."
                    ForeColor="Red">
                </asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator runat="server" ErrorMessage="Digits, letters and '/' Only!" ControlToValidate="number" ValidationExpression="^[0-9/a-zA-z]+$"></asp:RegularExpressionValidator>
            
            </div>
          </fieldset>
        </div>

        <div class="plain-row">
          <fieldset>
            <label class="label">Date (AD 2017)</label>
            <div class="userinput">
                <asp:TextBox id="date_txt" runat="server"/>
                <asp:RangeValidator id="date_range"
                    ControlToValidate="date_txt"
                    Type="Date"
                    minimumvalue="01-01-2017" maximumvalue="31-12-2017" errormessage="Please enter a valid date within 2017!"
                    runat="server"/>
            </div>
          </fieldset>
        </div>

        <div class="plain-row">
          <fieldset>
            <label class="label">URL</label>
            <div class="userinput">
              <input name="url" type="url">
            </div>
          </fieldset>
        </div>

        <div class="plain-row">
          <fieldset>
            <label class="label">Search</label>
            <div class="userinput">
              <input name="search" type="search">
            </div>
          </fieldset>
        </div>

        <div class="plain-row">
          <fieldset>
            <label class="label">Select</label>
            <input type="checkbox" name="chb[]" value="cow"/>Cow<br>
            <input type="checkbox" name="chb[]" value="pig"/>Pig<br>
            <input type="checkbox" name="chb[]" value="duck"/>Duck<br>
            <input type="checkbox" name="chb[]" value="hedgehog"/>Hedgehog<br>
            <input type="checkbox" name="chb[]" value="elephant"/>Elephant
          </fieldset>
        </div>

          <div class="plain-row">
              <fieldset>
                  <label class="label">Kapcia</label>
                  <asp:TextBox ID="captcha" runat="server" />
                  <asp:TextBox ID="captcha_1" runat="server" Enabled="false" text="abc123" />
                  <asp:CompareValidator id="Compare_captcha" 
                    ControlToValidate="captcha" 
                    ControlToCompare="captcha_1" 
                    Type="String"
                    Text="Failed Captcha!" 
                    runat="server"/>
              </fieldset>
          </div>

        <div class="contact-reset">
          <button name="reset" type="reset" class="button">Reset</button>
        </div>

        <div class="contact-submit">
          <button name="submit" type="submit" class="button">Submit</button>
        </div>

      </div>
    </form>

    <ctrl:Footer ID="Footer" runat="server" />

</body>
</html>
