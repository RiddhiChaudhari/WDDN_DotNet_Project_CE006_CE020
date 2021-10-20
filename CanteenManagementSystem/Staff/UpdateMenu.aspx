<%@ Page Title="Update Menu" Language="C#" MasterPageFile="~/Staff/Site1.Master" AutoEventWireup="true" CodeBehind="UpdateMenu.aspx.cs" Inherits="CanteenManagementSystem.Staff.UpdateMenu" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
        <div class="shadowBox">
            <div class="page-container">
                <div class="container">
                    <div class="jumbotron">
                        <h2 class="text-danger"><%: Title %>.</h2>
                        <h4>Update menu Details</h4>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="form-horizontal">
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
            <asp:Label runat="server" AssociatedControlID="txtMenuName" CssClass="col-md-2 control-label">Name : </asp:Label>
            <div class="col-md-5">
                <asp:TextBox runat="server" ID="txtMenuName" CssClass="form-control" Height="30px" Width="300px" Text=""/>
                <asp:RequiredFieldValidator runat="server" ControlToValidate="txtMenuName" CssClass="text-danger" ErrorMessage="Required Field" ValidationGroup="rgstr" />                
            </div>
        </div>
        <%-- PRICE --%>
        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="txtMenuPrice" CssClass="col-md-2 control-label">Price : </asp:Label>
            <div class="col-md-5">
                <asp:TextBox runat="server" TextMode="Number" ID="txtMenuPrice" CssClass="form-control" Height="30px" Width="280px" Text="" />
                <asp:RequiredFieldValidator runat="server" ControlToValidate="txtMenuPrice" CssClass="text-danger" ErrorMessage="Required Field" ValidationGroup="rgstr" />                
            </div>
        </div>
        <%-- COUSINES --%>
        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="txtMenuCousines" CssClass="col-md-2 control-label">Cousine : </asp:Label>
            <div class="col-md-5">
                <asp:TextBox runat="server" ID="txtMenuCousines" CssClass="form-control" Height="30px" Width="300px" Text="" ReadOnly="true"/>
            </div>
        </div>
        <%-- TYPE --%>
        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="txtMenuType" CssClass="col-md-2 control-label">Type : </asp:Label>
            <div class="col-md-5">
                <asp:TextBox runat="server" ID="txtMenuType" CssClass="form-control" Height="30px" Width="300px" Text="" ReadOnly="true"/>                
            </div>
        </div>
        <%-- AVAILBILITY --%>
        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="ddlMenuAvailbility" CssClass="col-md-2 control-label">Availbility : </asp:Label>
            <div class="col-md-5">
                <asp:DropDownList ID="ddlMenuAvailbility" CssClass="form-control" runat="server" Width="280px" Height="30px" ValidationGroup="rgstr">
                    <asp:ListItem Value="yes">Yes</asp:ListItem>
                    <asp:ListItem Value="no">No</asp:ListItem>
                </asp:DropDownList>
            </div>
        </div>
        <%-- VEG OR NONVEG --%>
        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="ddlVegOrNonVeg" CssClass="col-md-2 control-label">Veg or NonVeg : </asp:Label>
            <div class="col-md-5">
                <asp:DropDownList ID="ddlVegOrNonVeg" CssClass="form-control" runat="server" Width="280px" Height="30px" ValidationGroup="rgstr">
                    <asp:ListItem Value="veg">Vegetarian</asp:ListItem>
                    <asp:ListItem Value="nonVeg">Not Vegetarian</asp:ListItem>
                </asp:DropDownList>
            </div>
        </div>
        <%-- IMAGE --%>
        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="menuImage" CssClass="col-md-2 control-label">Image : </asp:Label>
            <div class="col-md-5">
                <asp:Image ID="mImage" runat="server" CssClass="auto-style1" Width="280px" />
                <asp:FileUpload ID="menuImage" runat="server" CssClass="auto-style1" Width="280px" />                              
                <asp:RegularExpressionValidator runat="server" ControlToValidate="menuImage" CssClass="text-danger" ErrorMessage="Only Image files are allowed"  ValidationExpression="^(([a-zA-Z]:)|(\\{2}\w+)\$?)(\\(\w[\w].*))+(.jpg|.JPG|.gif|.GIF|.png|.PNG|.bmp|.BMP)$" ValidationGroup="rgstr" />                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        
            </div>
        </div>
        <%-- BUTTON --%>
        <div class="form-group">
            <div class="col-md-offset-2 col-md-5">
                <asp:Button runat="server" ID="btnUpdate" Text="Update" CssClass="btn btn-default" OnClick="btnUpdate_Click" ValidationGroup="rgstr" />
                &nbsp;
                <asp:Button ID="btnBack" runat="server" CssClass="btn btn-default" Text="Back" OnClick="btnBack_Click" />
                &nbsp;              
                <asp:Label ID="Label1" runat="server" Text=""></asp:Label>
            </div>
        </div>
    </div>
</asp:Content>
