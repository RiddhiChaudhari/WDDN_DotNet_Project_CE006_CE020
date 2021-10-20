<%@ Page Title="Update Staff" Language="C#" MasterPageFile="~/Admin/Site1.Master" AutoEventWireup="true" CodeBehind="UpdateStaff.aspx.cs" Inherits="CanteenManagementSystem.Admin.updateStaff" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
        <div class="shadowBox">
            <div class="page-container">
                <div class="container">
                    <div class="jumbotron">
                        <h2 class="text-danger"><%: Title %>.</h2>
                        <h4>Update staff Details</h4>
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
        <%-- ID --%>
        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="txtId" CssClass="col-md-2 control-label">Id : </asp:Label>
            <div class="col-md-5">
                <asp:TextBox runat="server" ID="txtId" CssClass="form-control" Height="30px" Width="300px" Text="" ReadOnly="true"/>
            </div>
        </div>
        <%-- NAME --%>
        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="txtName" CssClass="col-md-2 control-label">Name : </asp:Label>
            <div class="col-md-5">
                <asp:TextBox runat="server" ID="txtName" CssClass="form-control" Height="30px" Width="300px" Text="" ReadOnly="true"/>
            </div>
        </div>
        <%-- SURNAME --%>
        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="txtSurname" CssClass="col-md-2 control-label">Surame : </asp:Label>
            <div class="col-md-5">
                <asp:TextBox runat="server" ID="txtSurname" CssClass="form-control" Height="30px" Width="300px" Text="" ReadOnly="true" />
            </div>
        </div>
        <%-- EMAIL --%>
        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="txtEmail" CssClass="col-md-2 control-label">Email : </asp:Label>
            <div class="col-md-5">
                <asp:TextBox runat="server" ID="txtEmail" CssClass="form-control" TextMode="Email" Height="30px" Width="300px" ValidationGroup="rgstr" />
                <asp:RegularExpressionValidator runat="server" ControlToValidate="txtEmail" CssClass="text-danger" ErrorMessage="Wrong Format input" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ValidationGroup="rgstr" />
                <asp:RequiredFieldValidator runat="server" ControlToValidate="txtEmail" CssClass="text-danger" ErrorMessage="Required Field" ValidationGroup="rgstr"></asp:RequiredFieldValidator>
            </div>
        </div>
        <%-- GENDER --%>
        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="ddlGender" CssClass="col-md-2 control-label">Gender : </asp:Label>
            <div class="col-md-5">
                <asp:TextBox runat="server" ID="ddlGender" CssClass="form-control" Height="30px" Width="300px"  Text="" ReadOnly="true" />
            </div>
        </div>
        <%-- PHONE NO --%>
        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="txtPhone" CssClass="col-md-2 control-label">Phone No. : </asp:Label>
            <div class="col-md-5">
                <asp:TextBox runat="server" ID="txtPhone" CssClass="form-control" Height="30px" Width="300px" ValidationGroup="rgstr" />
                <asp:RegularExpressionValidator runat="server" ControlToValidate="txtPhone" CssClass="text-danger" ErrorMessage="Wrong Format input." ValidationExpression="^[6-9][0-9]{9}$" ValidationGroup="rgstr" />
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtPhone" CssClass="text-danger" ErrorMessage="Required Field" ValidationGroup="rgstr"></asp:RequiredFieldValidator>
            </div>
        </div>
        <%-- ROLE --%>
        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="ddlRole" CssClass="col-md-2 control-label">Role : </asp:Label>
            <div class="col-md-5">
                <asp:DropDownList ID="ddlRole" CssClass="form-control" runat="server" Width="280px" Height="30px" ValidationGroup="rgstr">
                    <asp:ListItem>Staff</asp:ListItem>
                    <asp:ListItem>Admin</asp:ListItem>
                </asp:DropDownList>
            </div>
        </div>
        <%-- IMAGE --%>
        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="staffImage" CssClass="col-md-2 control-label">Image : </asp:Label>
            <div class="col-md-5">
                <asp:ImageButton ID="sImage" runat="server" CssClass="auto-style1" OnClick="staffImage_Click" Width="280px" />
                <asp:FileUpload ID="staffImage" runat="server" CssClass="auto-style1" Width="280px" />                              
                <asp:RegularExpressionValidator runat="server" ControlToValidate="staffImage" CssClass="text-danger" ErrorMessage="Only Image files are allowed"  ValidationExpression="^(([a-zA-Z]:)|(\\{2}\w+)\$?)(\\(\w[\w].*))+(.jpg|.JPG|.gif|.GIF|.png|.PNG|.bmp|.BMP)$" ValidationGroup="rgstr" />                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        
            </div>
        </div>
        <%-- BUTTON --%>
        <div class="form-group">
            <div class="col-md-offset-2 col-md-5">
                <asp:Button runat="server" ID="btnRegister" Text="Update" CssClass="btn btn-default" OnClick="btnUpdate_Click" ValidationGroup="rgstr" />
                &nbsp;
                <asp:Button ID="btnBack" runat="server" CssClass="btn btn-default" Text="Back" OnClick="btnBack_Click" />
                &nbsp;              
                <asp:Label ID="Label1" runat="server" Text=""></asp:Label>
            </div>
        </div>
    </div>
</asp:Content>
