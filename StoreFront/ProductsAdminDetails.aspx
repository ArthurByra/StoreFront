<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site.Master" CodeBehind="ProductsAdminDetails.aspx.cs" Inherits="StoreFront.ProductsAdminDetails" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <link href="Site.css" rel="stylesheet" type="text/css" />

        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:StoreFrontConnectionString %>" SelectCommand="spGetProduct" SelectCommandType="StoredProcedure" UpdateCommand="spUpdateProduct" UpdateCommandType="StoredProcedure" DeleteCommand="spDeleteProduct" DeleteCommandType="StoredProcedure" OnSelecting="SqlDataSource1_Selecting">
            <SelectParameters>
                <asp:QueryStringParameter Name="ProductID" QueryStringField="ProductID" Type="Int32" />
            </SelectParameters>
            <DeleteParameters>
                    <asp:Parameter Name="ProductID" Type="Int32" />
            </DeleteParameters>
            <UpdateParameters>
                <asp:Parameter Name="ProductID" Type="Int32" />
                <asp:Parameter Name="Description" Type="String" />
                <asp:Parameter Name="IsPublished" Type="String" />
                <asp:Parameter Name="Price" Type="Decimal" />
            </UpdateParameters>
        </asp:SqlDataSource>
    <div class="wrapper">
    <div class="DetailsView2">
        <h1>Edit Customer</h1>
        <asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateRows="False" BackColor="#DEBA84" BorderColor="#DEBA84" BorderStyle="Solid" BorderWidth="1px" CellPadding="3" CellSpacing="2" DataKeyNames="ProductID" DataSourceID="SqlDataSource1" Height="50px" Width="125px" HeaderText="Update Product" OnItemDeleted="DetailsView1_ItemDeleted" >
            <EditRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="White" />
<EmptyDataRowStyle BackColor="White" BorderStyle="None"></EmptyDataRowStyle>
            <Fields>
                <asp:BoundField DataField="ProductID" HeaderText="ProductID" InsertVisible="False" ReadOnly="True" SortExpression="ProductID" />
                <asp:TemplateField HeaderText="ProductName" SortExpression="ProductName">
                    <EditItemTemplate>
                        <asp:TextBox ID="tbProductName" runat="server" Text='<%# Bind("ProductName") %>'></asp:TextBox>
                        <asp:RequiredFieldValidator ID="ValidateProductName" runat="server" ErrorMessage="ProductName is a required field" Text="*" ForeColor="Red" ControlToValidate="tbProductName"></asp:RequiredFieldValidator>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("ProductName") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Description" SortExpression="Description">
                    <EditItemTemplate>
                        <asp:TextBox ID="tbDescription" runat="server" Text='<%# Bind("Description") %>'></asp:TextBox>
                        <asp:RequiredFieldValidator ID="ValidateDescription" runat="server" ErrorMessage="Description is a required field" Text="*" ForeColor="Red" ControlToValidate="tbDescription"></asp:RequiredFieldValidator>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label2" runat="server" Text='<%# Bind("Description") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="IsPublished" SortExpression="IsPublished">
                    <EditItemTemplate>
                        <asp:CheckBox ID="tbIsPublished" runat="server" Checked='<%# Bind("IsPublished") %>' />
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:CheckBox ID="CheckBox1" runat="server" Checked='<%# Bind("IsPublished") %>' Enabled="false" />
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="Quantity" HeaderText="Quantity" SortExpression="Quantity" ReadOnly="True" />
                <asp:TemplateField HeaderText="Price" SortExpression="Price">
                    <EditItemTemplate>
                        <asp:TextBox ID="tbPrice" runat="server" Text='<%# Bind("Price") %>'></asp:TextBox>
                        <asp:RequiredFieldValidator ID="ValidatePrice" runat="server" ErrorMessage="Price is a required field" Text="*" ForeColor="Red" ControlToValidate="tbPrice"></asp:RequiredFieldValidator>
                        <asp:CompareValidator ID="ComparePriceValidator" runat="server" ErrorMessage="Price must be in number format" Text="*" ForeColor="Red" Operator="DataTypeCheck" ControlToValidate="tbPrice" Type="Currency"></asp:CompareValidator>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label3" runat="server" DataFormatString="{0:C2}" Text='<%# Bind("Price") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="ImageFile" HeaderText="ImageFile" SortExpression="ImageFile" ReadOnly="True" />
                <asp:BoundField DataField="DateCreated" HeaderText="DateCreated" SortExpression="DateCreated" ReadOnly="True" />
                <asp:BoundField DataField="CreatedBy" HeaderText="CreatedBy" SortExpression="CreatedBy" ReadOnly="True" />
                <asp:BoundField DataField="DateModified" HeaderText="DateModified" SortExpression="DateModified" ReadOnly="True" />
                <asp:BoundField DataField="ModifiedBy" HeaderText="ModifiedBy" SortExpression="ModifiedBy" ReadOnly="True" />
                <asp:CommandField ShowEditButton="True" HeaderText="Update" ShowDeleteButton="True" />
            </Fields>
            <FooterStyle BackColor="#F7DFB5" ForeColor="#8C4510" />
            <HeaderStyle BackColor="#A55129" Font-Bold="True" ForeColor="White" />
            <PagerStyle ForeColor="#8C4510" HorizontalAlign="Center" />
            <RowStyle BackColor="#FFF7E7" ForeColor="#8C4510" />
        </asp:DetailsView>
        <asp:ValidationSummary runat="server" ForeColor="Red" Height="78px" Width="231px"></asp:ValidationSummary>
        <asp:Button ID="BackButton" runat="server" Text="Back" OnClick="BackButton_Click" CssClass="Button" />
        </div>
    </div>
    </asp:Content>