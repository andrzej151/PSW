<%@ Page Title="Contact" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Formularz.aspx.cs" Inherits="WebApplication8.Contact" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <fieldset>
        <legend>Formularz rejestracyjny</legend>
        <ol>
            <li>
                <asp:Label ID="Label1" runat="server" AssociatedControlID="Name">Imię</asp:Label>
                <asp:TextBox runat="server" ID="Name" />
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="Name" CssClass="field-validation-error" ErrorMessage="Imię jest wymagane." Display="Dynamic" />
                <asp:RegularExpressionValidator ID="NameRegularExpressionValidator" runat="server" ControlToValidate="Name" ValidationExpression="^[a-zA-ZąćęłńóśźżĄĘŁŃÓŚŹŻ']{1,20}$" ErrorMessage="Imię nie może zawierać takich znaków!" CssClass="field-validation-error" Display="Dynamic"></asp:RegularExpressionValidator>
            </li>
            <li>
                <asp:Label ID="Label5" runat="server" AssociatedControlID="Surname">Nazwisko</asp:Label>
                <asp:TextBox runat="server" ID="Surname" />
                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="Surname" CssClass="field-validation-error" ErrorMessage="Nazwisko jest wymagane." Display="Dynamic" />
                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="Surname" ErrorMessage="Nazwisko nie może zawierać takich znaków!" CssClass="field-validation-error" Display="Dynamic" ValidationExpression="[a-zA-z]{3,30}"></asp:RegularExpressionValidator>
            </li>
            <li>
                <asp:Label ID="Label2" runat="server" AssociatedControlID="Email">Adres e-mail</asp:Label>
                <asp:TextBox runat="server" ID="Email" TextMode="Email" />
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="Email" CssClass="field-validation-error" ErrorMessage="Adres e-mail jest wymagany." Display="Dynamic" />
                <asp:RegularExpressionValidator ID="emailRegularExpressionValidator" runat="server" ControlToValidate="Email" ErrorMessage="Wpisz portpawny adres email w formacie przykład@domena.pl" ForeColor="Red" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" CssClass="field-validation-error" Display="Dynamic"></asp:RegularExpressionValidator>
            </li>
            <li>
                <asp:Label ID="Label6" runat="server" AssociatedControlID="Phone">Telefon</asp:Label>
                <asp:TextBox runat="server" ID="Phone" />
                <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="Phone" CssClass="field-validation-error" ErrorMessage="Telefon jest wymagany." Display="Dynamic" />
                <asp:RegularExpressionValidator ID="PhoneRegularExpressionValidator" runat="server" ControlToValidate="Phone" ValidationExpression="\d{3}-\d{3}-\d{3}" ErrorMessage="Format numeru telefonu to xxx-xxx-xxx" CssClass="field-validation-error"></asp:RegularExpressionValidator>
            </li>
            <li>
                <asp:Label ID="Label7" runat="server" AssociatedControlID="Age">Wiek</asp:Label>
                <asp:TextBox runat="server" ID="Age" />
                <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="Age" CssClass="field-validation-error" ErrorMessage="Wiek jest wymagany." Display="Dynamic" />
                <asp:RangeValidator ID="NumberRangeValidator" runat="server" ErrorMessage="Musisz być pełnoletni" MinimumValue="18" MaximumValue="100" Type="Integer" ControlToValidate="Age" Display="Dynamic" CssClass="field-validation-error"></asp:RangeValidator>
            </li>
          
        </ol>
        <asp:Button ID="Submit" runat="server" Text="Prześlij dane" />
    </fieldset>

    <p class="message-info">
        <asp:Label ID="FormData" Visible="False" runat="server"></asp:Label>
    </p>
</asp:Content>
