<%@ Page Title="Contact" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Contact.aspx.cs" Inherits="StoreFront.Contact" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <link href="Site.css" rel="stylesheet" type="text/css" />

    <h2><%: Title %></h2>
    <div class="contact">
        <address>
            16 StoreFront Way<br />
            Woahthere, PA 12732-8326<br />
            <abbr title="Phone">P:</abbr>
            321.846.3926
        </address>

        <address>
            <strong>Support:</strong>   <a href="mailto:Arthur_Byra@compaid.com">Arthur_Byra@compaid.com</a><br />
        </address>
    </div>
</asp:Content>
