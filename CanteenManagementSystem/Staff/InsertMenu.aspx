<%@ Page Title="Insert Menu" Language="C#" MasterPageFile="~/Staff/Site1.Master" AutoEventWireup="true" CodeBehind="InsertMenu.aspx.cs" Inherits="CanteenManagementSystem.Staff.InsertMenu" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style1 {
            display: block;
            padding: 6px 12px;
            font-size: 14px;
            line-height: 1.42857143;
            color: #555555;
            background-color: #fff;
            background-image: none;
            border: 1px solid #ccc;
            border-radius: 4px;
            -webkit-box-shadow: inset 0 1px 1px rgba(0, 0, 0, 0.075);
            box-shadow: inset 0 1px 1px rgba(0, 0, 0, 0.075);
            -webkit-transition: border-color ease-in-out .15s, box-shadow ease-in-out .15s;
            -o-transition: border-color ease-in-out .15s, box-shadow ease-in-out .15s;
            -webkit-transition: border-color ease-in-out .15s, -webkit-box-shadow ease-in-out .15s;
            transition: border-color ease-in-out .15s, -webkit-box-shadow ease-in-out .15s;
            transition: border-color ease-in-out .15s, box-shadow ease-in-out .15s;
            transition: border-color ease-in-out .15s, box-shadow ease-in-out .15s, -webkit-box-shadow ease-in-out .15s;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
        <div class="shadowBox">
            <div class="page-container">
                <div class="container">
                    <div class="jumbotron">
                        <h2 class="text-danger"><%: Title %>.</h2>
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
        <%-- NAME --%>
        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="txtName" CssClass="col-md-2 control-label">Menu Name : </asp:Label>
            <div class="col-md-5">
                <asp:TextBox runat="server" ID="txtName" CssClass="form-control" Height="30px" Width="300px" ValidationGroup="rgstr" />
                <asp:RequiredFieldValidator runat="server" ControlToValidate="txtName" CssClass="text-danger" ErrorMessage="The Name field is required." ValidationGroup="rgstr" />
            </div>
        </div>
        <%-- Price --%>
        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="txtPrice" CssClass="col-md-2 control-label">Price : </asp:Label>
            <div class="col-md-5">
                <asp:TextBox TextMode="Number" runat="server" ID="txtPrice" CssClass="auto-style1" Height="30px" Width="280px" ValidationGroup="rgstr" />
                <asp:RequiredFieldValidator runat="server" ControlToValidate="txtPrice" CssClass="text-danger" ErrorMessage="The Price field is required." ValidationGroup="rgstr" />
            </div>
        </div>
        <%-- AVAILBILITY --%>
        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="ddlAvailbility" CssClass="col-md-2 control-label">Availbility : </asp:Label>
            <div class="col-md-5">
                <asp:DropDownList ID="ddlAvailbility" CssClass="form-control" runat="server" Width="280px" Height="30px" ValidationGroup="rgstr">
                    <asp:ListItem Value="yes">Yes</asp:ListItem>
                    <asp:ListItem Value="no">No</asp:ListItem>
                </asp:DropDownList>
                <asp:RequiredFieldValidator runat="server" ControlToValidate="ddlAvailbility" CssClass="text-danger" ErrorMessage="The Price field is required." ValidationGroup="rgstr" />
            </div>
        </div>
        <%-- MENU COUSINS --%>
        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="ddlCousins" CssClass="col-md-2 control-label">Menu Type : </asp:Label>
            <div class="col-md-5">
                <asp:DropDownList ID="ddlCousins" CssClass="form-control" runat="server" Width="280px" Height="30px" ValidationGroup="rgstr">
                    <asp:ListItem Value="indian">Indian</asp:ListItem>
                    <asp:ListItem Value="gujarati">Gujarati</asp:ListItem>
                    <asp:ListItem Value="panjabi">Panjabi</asp:ListItem>
                    <asp:ListItem Value="southindian">South Indian</asp:ListItem>
                    <asp:ListItem Value="northindian">North Indian</asp:ListItem>
                    <asp:ListItem Value="rajasthani">Rajsthani</asp:ListItem>
                    <asp:ListItem Value="chinese">Chinese</asp:ListItem>
                    <asp:ListItem Value="italian">Italian</asp:ListItem>
                </asp:DropDownList>
                <asp:RequiredFieldValidator runat="server" ControlToValidate="ddlCousins" CssClass="text-danger" ErrorMessage="The Gender field is required." ValidationGroup="rgstr" />
            </div>
        </div>
        <%-- MENU TYPE --%>
        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="ddlType" CssClass="col-md-2 control-label">Menu Type : </asp:Label>
            <div class="col-md-5">
                <asp:DropDownList ID="ddlType" CssClass="form-control" runat="server" Width="280px" Height="30px" ValidationGroup="rgstr">
                    <asp:ListItem Value="fastFood">Fast Food</asp:ListItem>
                    <asp:ListItem Value="bakery">Bakery</asp:ListItem>
                    <asp:ListItem Value="fullThali">Full Thali</asp:ListItem>
                    <asp:ListItem Value="colddrink">Cold Drinks</asp:ListItem>
                    <asp:ListItem Value="dessert">Dessert</asp:ListItem>
                    <asp:ListItem Value="teacoffee">Tea and Coffee</asp:ListItem>
                    <asp:ListItem Value="icecream">Ice Cream</asp:ListItem>
                </asp:DropDownList>
                <asp:RequiredFieldValidator runat="server" ControlToValidate="ddlType" CssClass="text-danger" ErrorMessage="The Gender field is required." ValidationGroup="rgstr" />
            </div>
        </div>
        <%-- VEG OR NONVEG --%>
        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="dllVegOrNonVeg" CssClass="col-md-2 control-label">Veg or NonVeg : </asp:Label>
            <div class="col-md-5">
                <asp:DropDownList ID="dllVegOrNonVeg" CssClass="form-control" runat="server" Width="280px" Height="30px" ValidationGroup="rgstr">
                    <asp:ListItem Value="veg">Vegetarian</asp:ListItem>
                    <asp:ListItem Value="nonVeg">Not Vegetarian</asp:ListItem>
                </asp:DropDownList>
                <asp:RequiredFieldValidator runat="server" ControlToValidate="dllVegOrNonVeg" CssClass="text-danger" ErrorMessage="The Gender field is required." ValidationGroup="rgstr" />
            </div>
        </div>
        <%-- IMAGE --%>
        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="menuImage" CssClass="col-md-2 control-label">Image : </asp:Label>
            <div class="col-md-5">
                <asp:FileUpload ID="menuImage" runat="server" CssClass="auto-style1" Width="280px" />
                <asp:RequiredFieldValidator runat="server" ControlToValidate="menuImage" CssClass="text-danger" ErrorMessage="Image field is required." ValidationGroup="rgstr" />                                
                <asp:RegularExpressionValidator runat="server" ControlToValidate="menuImage" CssClass="text-danger" ErrorMessage="Only Image files are allowed"  ValidationExpression="^(([a-zA-Z]:)|(\\{2}\w+)\$?)(\\(\w[\w].*))+(.jpg|.JPG|.gif|.GIF|.png|.PNG|.bmp|.BMP)$" ValidationGroup="rgstr" />                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        
            </div>
        </div>
        <%-- BUTTON --%>
        <div class="form-group">
            <div class="col-md-offset-2 col-md-5">
                <asp:Button runat="server" ID="btnInsert" Text="Insert" CssClass="btn btn-default" OnClick="btnInsert_Click" ValidationGroup="rgstr" />
                &nbsp;
                <asp:Button ID="btnReset" runat="server" CssClass="btn btn-default" Text="Reset" OnClick="btnReset_Click" />
                &nbsp;
                <asp:Label ID="temp" runat="server" Text=""></asp:Label>
            </div>
        </div>
    </div>
</asp:Content>
