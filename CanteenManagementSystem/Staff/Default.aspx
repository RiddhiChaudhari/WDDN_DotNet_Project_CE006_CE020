﻿<%@ Page Title="Default Page" Language="C#" MasterPageFile="~/Staff/Site1.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="CanteenManagementSystem.Staff.Default" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h2><%: Title %>.</h2>
    <p>Show current Menu (Same as Customer sees but for staff members)</p>
    <div>
        <ul>
            <li>Add Menu</li>
            <li>Check Menu</li>
            <li>Update Menu</li>
            <li>Delete Menu</li>
            <li>Order List</li>
            <li>Change Password</li>
        </ul>
    </div>
</asp:Content>
