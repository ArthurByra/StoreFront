<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site.Master" CodeBehind="CustomerAdminDetails.aspx.cs" Inherits="StoreFront.CustomerAdminDetails" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <link href="Site.css" rel="stylesheet" type="text/css" />

        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:StoreFrontConnectionString %>" SelectCommand="spGetUser" SelectCommandType="StoredProcedure" UpdateCommand="spUpdateUser" UpdateCommandType="StoredProcedure" DeleteCommand="spDeleteUser" DeleteCommandType="StoredProcedure" >
            <DeleteParameters>
                <asp:Parameter Name="UserID" Type="Int32" />
            </DeleteParameters>
            <SelectParameters>
                <asp:QueryStringParameter Name="UserID" QueryStringField="UserID" Type="Int32" />
            </SelectParameters>
            <UpdateParameters>
                <asp:Parameter Name="UserID" Type="Int32" />
                <asp:Parameter Name="UserName" Type="String" />
                <asp:Parameter Name="EmailAddress" Type="String" />
            </UpdateParameters>
        </asp:SqlDataSource>
    <div class="wrapper">
    <div class="DetailsView2">
        <h1>Edit Customer</h1>
        <asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateRows="False" BackColor="#DEBA84" BorderColor="#DEBA84" CellPadding="3" CellSpacing="2" DataKeyNames="UserID" DataSourceID="SqlDataSource1" HeaderText="Update User" Height="50px" Width="125px" OnItemDeleted="DetailsView1_ItemDeleted">
            <EditRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="White" />
            <Fields>
                <asp:BoundField DataField="UserID" HeaderText="UserID" InsertVisible="False" ReadOnly="True" SortExpression="UserID" />
                <asp:TemplateField HeaderText="UserName" SortExpression="UserName">
                    <EditItemTemplate>
                        <asp:TextBox ID="tbUserName" runat="server" Text='<%# Bind("UserName") %>'></asp:TextBox>
                        <asp:RequiredFieldValidator ID="ValidateUserName" runat="server" ErrorMessage="UserName is a required field" Text="*" ForeColor="Red" ControlToValidate="tbUserName"></asp:RequiredFieldValidator>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("UserName") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="EmailAddress" SortExpression="EmailAddress">
                    <EditItemTemplate>
                        <asp:TextBox ID="tbEmailAddress" runat="server" Text='<%# Bind("EmailAddress") %>'></asp:TextBox>
                        <asp:RequiredFieldValidator ID="ValidateEmail" runat="server" Text="*" ErrorMessage="EmailAddress is a required field" ForeColor="Red" ControlToValidate="tbEmailAddress"></asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="EmailValidation" runat="server" Text="*" ErrorMessage="Enter a valid e-mail address, e.g., John.Smith@example.com" ControlToValidate="tbEmailAddress" ForeColor="Red" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ></asp:RegularExpressionValidator>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label2" runat="server" Text='<%# Bind("EmailAddress") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="IsAdmin" SortExpression="IsAdmin">
                    <EditItemTemplate>
                        <asp:CheckBox ID="CheckBox1" runat="server" Checked='<%# Bind("IsAdmin") %>' />
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:CheckBox ID="CheckBox1" runat="server" Checked='<%# Bind("IsAdmin") %>' Enabled="false" />
                    </ItemTemplate>
                </asp:TemplateField>
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
    <div class="GridView2">
        <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AutoGenerateColumns="False" BackColor="#DEBA84" BorderColor="#DEBA84" BorderStyle="None" BorderWidth="1px" CellPadding="3" CellSpacing="2" DataKeyNames="AddressID" DataSourceID="SqlDataSource2" EnableSortingAndPagingCallbacks="True" >
            <Columns>
                <asp:BoundField DataField="AddressID" HeaderText="AddressID" ReadOnly="True" SortExpression="AddressID" />
                <asp:BoundField DataField="Address1" HeaderText="Address1" SortExpression="Address1" />
                <asp:BoundField DataField="Address2" HeaderText="Address2" SortExpression="Address2" />
                <asp:BoundField DataField="Address3" HeaderText="Address3" SortExpression="Address3" />
                <asp:BoundField DataField="City" HeaderText="City" SortExpression="City" />
                <asp:BoundField DataField="StateName" HeaderText="StateName" SortExpression="StateName" />
                <asp:BoundField DataField="ZipCode" HeaderText="ZipCode" SortExpression="ZipCode" />
                <asp:CheckBoxField DataField="IsBilling" HeaderText="IsBilling" SortExpression="IsBilling" />
                <asp:CheckBoxField DataField="IsShipping" HeaderText="IsShipping" SortExpression="IsShipping" />
            </Columns>
            <FooterStyle BackColor="#F7DFB5" ForeColor="#8C4510" />
            <HeaderStyle BackColor="#A55129" Font-Bold="True" ForeColor="White" />
            <PagerStyle ForeColor="#8C4510" HorizontalAlign="Center" />
            <RowStyle BackColor="#FFF7E7" ForeColor="#8C4510" />
            <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="White" />
            <SortedAscendingCellStyle BackColor="#FFF1D4" />
            <SortedAscendingHeaderStyle BackColor="#B95C30" />
            <SortedDescendingCellStyle BackColor="#F1E5CE" />
            <SortedDescendingHeaderStyle BackColor="#93451F" />
        </asp:GridView>
        </div>
    </div>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:StoreFrontConnectionString %>" OnSelecting="SqlDataSource2_Selecting" SelectCommand="spGetUserAddresses" SelectCommandType="StoredProcedure">
            <SelectParameters>
                <asp:QueryStringParameter Name="UserID" QueryStringField="UserID" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>
        <br />
</asp:Content>