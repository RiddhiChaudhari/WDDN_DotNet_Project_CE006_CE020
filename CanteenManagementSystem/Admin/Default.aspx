<%@ Page Title="Admin" Language="C#" MasterPageFile="~/Admin/Site1.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="CanteenManagementSystem.Admin.Default" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h2><%: Title %>.</h2>
    <p>Defaulp page for Admin(Admin can only reach here, after verification)</p>
    <div>
        <ul>
            <li>Add Staff Member</li>
            <li>Check Staff Details</li>
            <li>Update Staff Details</li>
            <li>Delete Staff Member</li>
            <li>Check Customer Details</li>
            <li>View Canteen Status</li>
            <li>Change Password</li>
        </ul>
    </div>
</asp:Content>
