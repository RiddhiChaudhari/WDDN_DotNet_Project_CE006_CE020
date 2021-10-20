<%@ Page Title="Delete Staff" Language="C#" MasterPageFile="~/Admin/Site1.Master" AutoEventWireup="true" CodeBehind="DeleteStaff.aspx.cs" Inherits="CanteenManagementSystem.Admin.DeleteStaff" %>
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
        <%-- ID --%>
        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="txtId" CssClass="col-md-2 control-label">Id : </asp:Label>
            <div class="col-md-5">
                <asp:TextBox runat="server" ID="txtId" CssClass="form-control" Height="30px" Width="300px" Text="" ReadOnly="true"/>
            </div>
        </div>
        <%-- NAME --%>
        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="txtStaffName" CssClass="col-md-2 control-label">Name : </asp:Label>
            <div class="col-md-5">
                <asp:TextBox runat="server" ID="txtStaffName" CssClass="form-control" Height="30px" Width="300px" Text="" ReadOnly="true"/>
            </div>
        </div>
        <%-- EMAIL --%>
        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="txtStaffEmail" CssClass="col-md-2 control-label">Email : </asp:Label>
            <div class="col-md-5">
                <asp:TextBox runat="server" ID="txtStaffEmail" CssClass="form-control" Height="30px" Width="300px" Text="" ReadOnly="true" />
            </div>
        </div>
        <%-- GENDER --%>
        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="txtStaffGender" CssClass="col-md-2 control-label">Gender : </asp:Label>
            <div class="col-md-5">
                <asp:TextBox runat="server" ID="txtStaffGender" CssClass="form-control" Height="30px" Width="300px" Text="" ReadOnly="true" />
            </div>
        </div>
        <%-- PHONE NO --%>
        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="txtStaffPhoneNo" CssClass="col-md-2 control-label">Phone no. : </asp:Label>
            <div class="col-md-5">
                <asp:TextBox runat="server" ID="txtStaffPhoneNo" CssClass="form-control" Height="30px" Width="300px" Text="" ReadOnly="true" />
            </div>
        </div>
        <%-- JOIN DATE --%>
        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="txtStaffJoinDate" CssClass="col-md-2 control-label">Veg or Nonveg : </asp:Label>
            <div class="col-md-5">
                <asp:TextBox runat="server" ID="txtStaffJoinDate" CssClass="form-control" Height="30px" Width="300px" Text="" ReadOnly="true" />
            </div>
        </div>
        <%-- ROLE --%>
        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="txtStaffRole" CssClass="col-md-2 control-label">Cousines Type : </asp:Label>
            <div class="col-md-5">
                <asp:TextBox runat="server" ID="txtStaffRole" CssClass="form-control" Height="30px" Width="300px" Text="" ReadOnly="true" />
            </div>
        </div>
        <%-- IMAGE --%>
        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="ImgStaffImage" CssClass="col-md-2 control-label">Image : </asp:Label>
            <div class="col-md-5">
                <asp:Image ID="ImgStaffImage" runat="server" CssClass="auto-style1" Width="280px" />                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               
            </div>
        </div>
    </div>
    Are you sure you want to delete this member?
    <asp:Button ID="btnDelete" runat="server" CssClass="btn btn-danger" Text="Delete" OnClick="btnDelete_Click" OnClientClick="return confirm('Are you sure?')" />
    <asp:Button ID="btnBack" runat="server" CssClass="btn btn-default" Text="Back" OnClick="btnBack_Click" />
    <asp:Label ID="Label1" runat="server" Text=""></asp:Label>
</asp:Content>
