<%@ Page Title="Change Admin Password" Language="C#" MasterPageFile="~/Admin/Site1.Master" AutoEventWireup="true" CodeBehind="ChangePassword.aspx.cs" Inherits="CanteenManagementSystem.Admin.ChangePassword" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
        <div class="shadowBox">
            <div class="page-container">
                <div class="container">
                    <div class="jumbotron">
                        <h2 class="text-danger"><%: Title %>.</h2>
                        <h4>Create a new account</h4>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="form-horizontal">
        <hr />
        <p class="text-danger">
            <asp:Literal runat="server" ID="ErrorMessage" />
        </p>
        <asp:ValidationSummary runat="server" CssClass="text-danger" />
        <%-- OLD PASSWORD --%>
        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="txtOldPassword" CssClass="col-md-2 control-label"> old Password : </asp:Label>
            <div class="col-md-5">
                <asp:TextBox runat="server" ID="txtOldPassword" TextMode="Password" CssClass="form-control" Height="30px" Width="300px" ValidationGroup="rgstr" />
                <asp:RequiredFieldValidator runat="server" ControlToValidate="txtOldPassword" CssClass="text-danger" ErrorMessage="The password field is required." ValidationGroup="rgstr" />
            </div>
        </div>
        <%-- NEW PASSWORD --%>
        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="txtNEWPassword" CssClass="col-md-2 control-label">New Password : </asp:Label>
            <div class="col-md-5">
                <asp:TextBox runat="server" ID="txtNEWPassword" TextMode="Password" CssClass="form-control" Height="30px" Width="300px" ValidationGroup="rgstr" />
                <asp:RequiredFieldValidator runat="server" ControlToValidate="txtNEWPassword" CssClass="text-danger" ErrorMessage="The password field is required." ValidationGroup="rgstr" />
            </div>
        </div>
        <%-- CONFIRM PASSWORD --%>
        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="txtNewConfPassword" CssClass="col-md-2 control-label">Confirm password : </asp:Label>
            <div class="col-md-5">
                <asp:TextBox runat="server" ID="txtNewConfPassword" TextMode="Password" CssClass="form-control" Height="30px" Width="300px" ValidationGroup="rgstr" />
                <asp:CompareValidator runat="server" ControlToCompare="txtNEWPassword" ControlToValidate="txtNewConfPassword" CssClass="text-danger" Display="Dynamic" ErrorMessage="The password and confirmation password do not match." ValidationGroup="rgstr" />
                <asp:RegularExpressionValidator runat="server" ControlToValidate="txtNEWPassword" ValidationExpression="^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$" CssClass="text-danger" ErrorMessage="Password must contain: Minimum 8 characters atleast 1 Alphabet and 1 Number" />                
            </div>
        </div>
        <%-- BUTTON --%>
        <div class="form-group">
            <div class="col-md-offset-2 col-md-5">
                <asp:Button runat="server" ID="btnUpdatePassword" Text="Update" CssClass="btn btn-default" OnClick="btnUpdatePassword_Click" ValidationGroup="rgstr" />
                &nbsp;
                <asp:Button ID="btnReset" runat="server" CssClass="btn btn-default" Text="Reset" OnClick="btnReset_Click" />
                &nbsp;
                <asp:Label ID="temp" runat="server" Text=""></asp:Label>
            </div>
        </div>
    </div>
</asp:Content>
