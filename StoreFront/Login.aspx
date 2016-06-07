<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="StoreFront.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <h1>Login</h1>
        </div>
        <div>
            <p>Username</p>
            <asp:TextBox ID="tbUsername" runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator ID="UsernameValidator" runat="server" ErrorMessage="Field cannot be blank" ControlToValidate="tbUsername" ForeColor="Red" EnableClientScript="False"></asp:RequiredFieldValidator>
        </div>
        <div>
            <p>Password</p>
            <asp:TextBox ID="tbPassword" runat="server" TextMode="Password"></asp:TextBox>
            <asp:RequiredFieldValidator ID="PasswordValidator" runat="server" ErrorMessage="Field cannot be blank" ControlToValidate="tbPassword" ForeColor="Red" EnableClientScript="False"></asp:RequiredFieldValidator>
        </div>
        <div>
            <asp:Button ID="LoginButton" runat="server" Text="Register" OnClick="LoginButton_Click" Style="height: 26px" />
        </div>
        <div>
            <asp:Label ID="StatusLabel" runat="server"></asp:Label>
        </div>
    </form>
</body>
</html>
