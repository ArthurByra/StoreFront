<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="StoreFront._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <link href="Site.css" rel="stylesheet" type="text/css" />

    <div class="Row">
        <h1>StoreFront</h1>
        <p></p>
        <p>This is the main administrator page. Only users with admin properties can view this page. From here you are able to modify the customer and product database.</p>
    </div>
    <div class="MainContent">
        <h1 class="Headerh1">Customers</h1>
        <p></p>
        <p>Click <a runat="server" href="~/CustomersAdmin.aspx">here</a> to view the customer database.</p>
        <p>Here you can: </p>
        <ul>
            <li>View existing customers</li>
            <li>Add a new customer</li>
            <li>Update a customer's information</li>
            <li>Delete a customer from our database</li>
        </ul>
    </div>

    <div class="MainContent2">
        <h1 class="Headerh1">Products</h1>
        <p></p>
        <p>Click <a runat="server" href="~/ProductsAdmin.aspx">here</a> to view the product database.</p>
        <p>From here, you can:</p>
        <ul>
            <li>View all the products available whether published or not</li>
            <li>Add a new product to become available for purchase</li>
            <li>Update an existing product</li>
            <li>Delete a product from our catalog</li>
        </ul>
    </div>

</asp:Content>
