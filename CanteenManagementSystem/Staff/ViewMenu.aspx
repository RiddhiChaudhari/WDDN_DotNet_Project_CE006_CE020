<%@ Page Title="View Menu" Language="C#" MasterPageFile="~/Staff/Site1.Master" AutoEventWireup="true" CodeBehind="ViewMenu.aspx.cs" Inherits="CanteenManagementSystem.Staff.ViewMenu" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
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
                <asp:TextBox runat="server" ID="txtMenuName" CssClass="form-control" Height="30px" Width="300px" Text="" ReadOnly="true"/>
            </div>
        </div>
        <%-- PRICE --%>
        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="txtMenuPrice" CssClass="col-md-2 control-label">Price : </asp:Label>
            <div class="col-md-5">
                <asp:TextBox runat="server" ID="txtMenuPrice" CssClass="form-control" Height="30px" Width="300px" Text="" ReadOnly="true" />
            </div>
        </div>
        <%-- AVAILBILITY --%>
        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="txtMenuAvailbility" CssClass="col-md-2 control-label">Availbility : </asp:Label>
            <div class="col-md-5">
                <asp:TextBox runat="server" ID="txtMenuAvailbility" CssClass="form-control" Height="30px" Width="300px" Text="" ReadOnly="true" />
            </div>
        </div>
        <%-- TYPE --%>
        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="txtMenuType" CssClass="col-md-2 control-label">Type : </asp:Label>
            <div class="col-md-5">
                <asp:TextBox runat="server" ID="txtMenuType" CssClass="form-control" Height="30px" Width="300px" Text="" ReadOnly="true" />
            </div>
        </div>
        <%-- VEG OR NONVEG --%>
        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="txtVegOrNonveg" CssClass="col-md-2 control-label">Veg or Nonveg : </asp:Label>
            <div class="col-md-5">
                <asp:TextBox runat="server" ID="txtVegOrNonveg" CssClass="form-control" Height="30px" Width="300px" Text="" ReadOnly="true" />
            </div>
        </div>
        <%-- COUSINES --%>
        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="txtMenuCousines" CssClass="col-md-2 control-label">Cousines Type : </asp:Label>
            <div class="col-md-5">
                <asp:TextBox runat="server" ID="txtMenuCousines" CssClass="form-control" Height="30px" Width="300px" Text="" ReadOnly="true" />
            </div>
        </div>
        <%-- IMAGE --%>
        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="ImgMenuImage" CssClass="col-md-2 control-label">Image : </asp:Label>
            <div class="col-md-5">
                <asp:Image ID="ImgMenuImage" runat="server" CssClass="auto-style1" Width="280px" />                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               
            </div>
        </div>
        <%-- BUTTON --%>
        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="btnBack" CssClass="col-md-2 control-label"></asp:Label>
            <div class="col-md-5">
                <asp:Button ID="btnBack" runat="server" CssClass="btn btn-default" Text="Back" OnClick="btnBack_Click" />
            </div>
        </div>
    </div>
</asp:Content>
