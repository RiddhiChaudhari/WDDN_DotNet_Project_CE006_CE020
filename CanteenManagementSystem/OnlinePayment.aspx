<%@ Page Title="Online Payment" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="OnlinePayment.aspx.cs" Inherits="CanteenManagementSystem.OnlinePayment" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <h2><%: Title %>.</h2>
    <asp:Button ID="btnPaymentStatus" CssClass="btn btn-default" runat="server" Text="Payment Done" OnClick="btnPaymentStatus_Click" />
</asp:Content>
