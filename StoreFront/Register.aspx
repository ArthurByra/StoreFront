<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="StoreFront.Register" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <h1>Register</h1>
        </div>
        <div>
            <p>Username</p>
            <asp:TextBox ID="tbUsername" runat="server" ></asp:TextBox>
            <asp:RequiredFieldValidator ID="UsernameValidator" runat="server" ErrorMessage="Field cannot be blank" ControlToValidate="tbUsername" ForeColor="Red" EnableClientScript="False"></asp:RequiredFieldValidator>
        </div>
        <div>
            <p>Password</p>
            <asp:TextBox ID="tbPassword" runat="server" TextMode="Password"></asp:TextBox>
            <asp:RequiredFieldValidator ID="PasswordValidator" runat="server" ErrorMessage="Field cannot be blank" ControlToValidate="tbPassword" ForeColor="Red" EnableClientScript="False"></asp:RequiredFieldValidator>
        </div>
        <div>
            <p>Confirm Password</p>
            <asp:TextBox ID="tbConfirmPassword" runat="server" TextMode="Password"></asp:TextBox>
            <asp:CompareValidator ID="CompareValidatorPasswords" runat="server" ErrorMessage="Passwords do not match" ControlToValidate="tbConfirmPassword" ControlToCompare="tbPassword" Operator="Equal" Type="String" ForeColor="Red" EnableClientScript="False"></asp:CompareValidator>
            <asp:RequiredFieldValidator ID="ConfirmPasswordValidator" runat="server" ErrorMessage="Field cannot be blank" ControlToValidate="tbConfirmPassword" ForeColor="Red" EnableClientScript="False"></asp:RequiredFieldValidator>
        </div>
        <div>
            <p>E-mail Address</p>
            <asp:TextBox ID="tbEmail" runat="server"></asp:TextBox>
            <asp:RegularExpressionValidator ID="EmailValidation" runat="server" ErrorMessage="Enter a valid e-mail address, e.g., John.Smith@example.com" ControlToValidate="tbEmail" ForeColor="Red" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" EnableClientScript="False"></asp:RegularExpressionValidator>
            <asp:RequiredFieldValidator ID="EmailValidator" runat="server" ErrorMessage="Field cannot be blank" ControlToValidate="tbEmail" ForeColor="Red" EnableClientScript="False"></asp:RequiredFieldValidator>
        </div>
        <div>
            <asp:Button ID="RegisterButton" runat="server" Text="Register" OnClick="RegisterButton_Click" Style="height: 26px" />
        </div>
        <div>
            <asp:Label ID="StatusLabel" runat="server"></asp:Label>
        </div>
    </form>
</body>
</html>
