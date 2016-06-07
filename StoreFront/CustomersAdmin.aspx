<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CustomersAdmin.aspx.cs" MasterPageFile="~/Site.Master" Inherits="StoreFront.CustomersAdmin" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <link href="Site.css" rel="stylesheet" type="text/css" />

     <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:StoreFrontConnectionString %>" InsertCommand="spAddUser" InsertCommandType="StoredProcedure" SelectCommand="spGetUsers" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
    
    <div class="wrapper">
        <div class="GridView">
            <h1>Customer Database</h1>
            <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" BackColor="#DEBA84" BorderColor="#DEBA84" BorderStyle="Solid" BorderWidth="1px" CellPadding="3" CellSpacing="2" DataKeyNames="UserID" DataSourceID="SqlDataSource1" Height="362px" PageSize="50" Width="500px" >
                <Columns>
                    <asp:CheckBoxField DataField="IsAdmin" HeaderText="IsAdmin" SortExpression="IsAdmin" Visible="False" />
                    <asp:BoundField DataField="DateCreated" HeaderText="DateCreated" SortExpression="DateCreated" Visible="False" />
                    <asp:HyperLinkField DataNavigateUrlFields="UserID" DataNavigateUrlFormatString="CustomerAdminDetails.aspx?UserID={0}" Text="Edit" />
                    <asp:BoundField DataField="UserID" HeaderText="UserID" InsertVisible="False" ReadOnly="True" SortExpression="UserID" />
                    <asp:BoundField DataField="UserName" HeaderText="UserName" SortExpression="UserName" />
                    <asp:BoundField DataField="EmailAddress" HeaderText="EmailAddress" SortExpression="EmailAddress" />
                    <asp:BoundField DataField="CreatedBy" HeaderText="CreatedBy" SortExpression="CreatedBy" Visible="False" />
                    <asp:BoundField DataField="DateModified" HeaderText="DateModified" SortExpression="DateModified" Visible="False" />
                    <asp:BoundField DataField="ModifiedBy" HeaderText="ModifiedBy" SortExpression="ModifiedBy" Visible="False" />
                </Columns>
                <FooterStyle BackColor="#F7DFB5" ForeColor="#8C4510" />
                <HeaderStyle BackColor="#A55129" Font-Bold="True" ForeColor="White" />
                <PagerSettings FirstPageText="First" LastPageText="Last" Mode="NextPreviousFirstLast" NextPageText="Next" PageButtonCount="7" PreviousPageText="Prev" />
                <PagerStyle ForeColor="#8C4510" HorizontalAlign="Center" />
                <RowStyle BackColor="#FFF7E7" ForeColor="#8C4510" />
                <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="White" />
                <SortedAscendingCellStyle BackColor="#FFF1D4" />
                <SortedAscendingHeaderStyle BackColor="#B95C30" />
                <SortedDescendingCellStyle BackColor="#F1E5CE" />
                <SortedDescendingHeaderStyle BackColor="#93451F" />
            </asp:GridView>  
        </div>
        <div class="DetailsView">
            <asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateRows="False" BackColor="#DEBA84" BorderColor="#DEBA84" BorderStyle="Solid" BorderWidth="1px" CellPadding="3" CellSpacing="2" DataKeyNames="UserID" DataSourceID="SqlDataSource1" HeaderText="Add User" DefaultMode="Insert" Height="50px" Width="125px" OnItemInserted="DetailsView1_ItemInserted" >
                <EditRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="White" />
                <Fields>
                    <asp:BoundField DataField="UserID" HeaderText="UserID" InsertVisible="False" ReadOnly="True" SortExpression="UserID" Visible="False" />
                    <asp:TemplateField HeaderText="UserName" SortExpression="UserName">
                        <InsertItemTemplate>
                            <asp:TextBox ID="tbUserName" runat="server" Text='<%# Bind("UserName") %>'></asp:TextBox>
                            <asp:RequiredFieldValidator ID="ValidateUserName" runat="server" ErrorMessage="UserName is a required field" Text="*" ForeColor="Red" ControlToValidate="tbUserName"></asp:RequiredFieldValidator>
                        </InsertItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label1" runat="server" Text='<%# Bind("UserName") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="EmailAddress" SortExpression="EmailAddress">
                        <InsertItemTemplate>
                            <asp:TextBox ID="tbEmailAddress" runat="server" Text='<%# Bind("EmailAddress") %>'></asp:TextBox>
                            <asp:RequiredFieldValidator ID="ValidateEmail" runat="server" Text="*" ErrorMessage="EmailAddress is a required field" ForeColor="Red" ControlToValidate="tbEmailAddress"></asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="EmailValidation" runat="server" Text="*" ErrorMessage="Enter a valid e-mail address, e.g., John.Smith@example.com" ControlToValidate="tbEmailAddress" ForeColor="Red" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ></asp:RegularExpressionValidator>
                        </InsertItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label2" runat="server" Text='<%# Bind("EmailAddress") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:CheckBoxField DataField="IsAdmin" HeaderText="IsAdmin" SortExpression="IsAdmin" />
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
            <asp:ValidationSummary runat="server" ForeColor="Red" Height="72px" Width="241px"></asp:ValidationSummary>
            <asp:Button ID="BackButton" runat="server" Text="Back" OnClick="BackButton_Click" CssClass="Button"/>
        </div>
    </div>
    </asp:Content>