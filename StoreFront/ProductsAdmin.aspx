<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site.Master" CodeBehind="ProductsAdmin.aspx.cs" Inherits="StoreFront.ProductsAdmin" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <link href="Site.css" rel="stylesheet" type="text/css" />

    <asp:SqlDataSource ID="SqlProduct" runat="server" ConnectionString="<%$ ConnectionStrings:StoreFrontConnectionString %>" InsertCommand="spAddProduct" InsertCommandType="StoredProcedure" SelectCommand="spGetProducts" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
    <div class="container">
        <div class="row">
            <div class="col-lg-6">
                <h1>Product Database</h1>
                <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" BackColor="#DEBA84" BorderColor="#DEBA84" BorderStyle="Solid" BorderWidth="1px" CellPadding="3" CellSpacing="2" DataKeyNames="ProductID" DataSourceID="SqlProduct" PageSize="50" Width="500px">
                    <Columns>
                        <asp:BoundField DataField="Description" HeaderText="Description" SortExpression="Description" Visible="False" />
                        <asp:HyperLinkField DataNavigateUrlFields="ProductID" DataNavigateUrlFormatString="ProductsAdminDetails.aspx?ProductID={0}" Text="Edit" />
                        <asp:BoundField DataField="ProductID" HeaderText="ProductID" ReadOnly="True" SortExpression="ProductID" InsertVisible="False" />
                        <asp:BoundField DataField="ProductName" HeaderText="ProductName" SortExpression="ProductName" />
                        <asp:CheckBoxField DataField="IsPublished" HeaderText="IsPublished" SortExpression="IsPublished" />
                        <asp:BoundField DataField="Quantity" HeaderText="Quantity" SortExpression="Quantity" Visible="False" />
                        <asp:BoundField DataField="Price" HeaderText="Price" SortExpression="Price" DataFormatString="{0:C2}" />
                        <asp:BoundField DataField="ImageFile" HeaderText="ImageFile" SortExpression="ImageFile" Visible="False" />
                        <asp:BoundField DataField="DateCreated" HeaderText="DateCreated" SortExpression="DateCreated" Visible="False" />
                        <asp:BoundField DataField="CreatedBy" HeaderText="CreatedBy" SortExpression="CreatedBy" Visible="False" />
                        <asp:BoundField DataField="DateModified" HeaderText="DateModified" SortExpression="DateModified" Visible="False" />
                        <asp:BoundField DataField="ModifiedBy" HeaderText="ModifiedBy" SortExpression="ModifiedBy" Visible="False" />
                    </Columns>
                    <FooterStyle BackColor="#F7DFB5" ForeColor="#8C4510" />
                    <HeaderStyle BackColor="#A55129" Font-Bold="True" ForeColor="White" />
                    <PagerSettings FirstPageText="First" LastPageText="Last" NextPageText="Next" PreviousPageText="Previous" Mode="NextPreviousFirstLast" />
                    <PagerStyle ForeColor="#8C4510" HorizontalAlign="Center" />
                    <RowStyle BackColor="#FFF7E7" ForeColor="#8C4510" />
                    <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="White" />
                    <SortedAscendingCellStyle BackColor="#FFF1D4" />
                    <SortedAscendingHeaderStyle BackColor="#B95C30" />
                    <SortedDescendingCellStyle BackColor="#F1E5CE" />
                    <SortedDescendingHeaderStyle BackColor="#93451F" />
                </asp:GridView>
            </div>
            <div class="col-med-6">
                <asp:DetailsView ID="ProductDetailsReview" runat="server" AutoGenerateRows="False" BackColor="#DEBA84" BorderColor="#DEBA84" BorderStyle="Solid" BorderWidth="1px" CellPadding="3" CellSpacing="2" DataKeyNames="ProductID" DataSourceID="SqlProduct" DefaultMode="Insert" HeaderText="Add Product" Height="50px" Width="125px" OnItemInserted="ProductDetailsReview_ItemInserted">
                    <EditRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="White" />
                    <Fields>
                        <asp:BoundField DataField="ProductID" HeaderText="ProductID" ReadOnly="True" SortExpression="ProductID" Visible="False" InsertVisible="False" />
                        <asp:TemplateField HeaderText="ProductName" SortExpression="ProductName">
                            <InsertItemTemplate>
                                <asp:TextBox ID="tbProductName" runat="server" Text='<%# Bind("ProductName") %>'></asp:TextBox>
                                <asp:RequiredFieldValidator ID="ValidateProductName" runat="server" ErrorMessage="ProductName is a required field" Text="*" ForeColor="Red" ControlToValidate="tbProductName"></asp:RequiredFieldValidator>
                            </InsertItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label1" runat="server" Text='<%# Bind("ProductName") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Description" SortExpression="Description">
                            <InsertItemTemplate>
                                <asp:TextBox ID="tbDescription" runat="server" Text='<%# Bind("Description") %>'></asp:TextBox>
                                <asp:RequiredFieldValidator ID="ValidateDescription" runat="server" ErrorMessage="Description is a required field" Text="*" ForeColor="Red" ControlToValidate="tbDescription"></asp:RequiredFieldValidator>
                            </InsertItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label2" runat="server" Text='<%# Bind("Description") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="IsPublished" SortExpression="IsPublished">
                            <InsertItemTemplate>
                                <asp:CheckBox ID="IsPublishedCheckbox" runat="server" Text='<%# Bind("IsPublished") %>'></asp:CheckBox>
                            </InsertItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label3" runat="server" Text='<%# Bind("IsPublished") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="Quantity" HeaderText="Quantity" SortExpression="Quantity" Visible="False" />
                        <asp:TemplateField HeaderText="Price" SortExpression="Price">
                            <InsertItemTemplate>
                                <asp:TextBox ID="tbPrice" runat="server" Text='<%# Bind("Price") %>'></asp:TextBox>
                                <asp:RequiredFieldValidator ID="ValidatePrice" runat="server" ErrorMessage="Price is a required field" Text="*" ForeColor="Red" ControlToValidate="tbPrice"></asp:RequiredFieldValidator>
                            </InsertItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label4" runat="server" Text='<%# Bind("Price") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="ImageFile" HeaderText="ImageFile" SortExpression="ImageFile" Visible="False" />
                        <asp:BoundField DataField="DateCreated" HeaderText="DateCreated" SortExpression="DateCreated" Visible="False" />
                        <asp:BoundField DataField="CreatedBy" HeaderText="CreatedBy" SortExpression="CreatedBy" Visible="False" />
                        <asp:BoundField DataField="DateModified" HeaderText="DateModified" SortExpression="DateModified" Visible="False" />
                        <asp:BoundField DataField="ModifiedBy" HeaderText="ModifiedBy" SortExpression="ModifiedBy" Visible="False" />
                        <asp:CommandField ShowInsertButton="True" />
                    </Fields>
                    <FooterStyle BackColor="#F7DFB5" ForeColor="#8C4510" />
                    <HeaderStyle BackColor="#A55129" Font-Bold="True" ForeColor="White" />
                    <PagerStyle ForeColor="#8C4510" HorizontalAlign="Center" />
                    <RowStyle BackColor="#FFF7E7" ForeColor="#8C4510" />
                </asp:DetailsView>
                <asp:ValidationSummary runat="server" ForeColor="Red"></asp:ValidationSummary>
                <asp:Button ID="BackButton" runat="server" Text="Back" OnClick="BackButton_Click" CssClass="Button" ValidationGroup="ValGroup1" />
            </div>
        </div>
    </div>
</asp:Content>
