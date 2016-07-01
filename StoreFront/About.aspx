<%@ Page Title="About" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="About.aspx.cs" Inherits="StoreFront.About" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <link href="Site.css" rel="stylesheet" type="text/css" />

    <h2><%: Title %></h2>
        <div class="about">
            <p>StoreFront is a web application that allows customer to login or register, browse through a wide database of products, and order all in the same place. </p>
            <p>As a user with administrative properties, you can manipulate the products in the database, as well as customer records. </p>
        </div>
</asp:Content>
