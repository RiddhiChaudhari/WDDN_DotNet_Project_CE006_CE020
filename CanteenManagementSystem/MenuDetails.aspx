<%@ Page Title="Menu Details" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="MenuDetails.aspx.cs" Inherits="CanteenManagementSystem.MenuDetails" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <h2><%: Title %>.</h2>
    <p>When User will click on particular item on Menu will be redirected here with menu id as parameter</p>
    <p>Detailed view of dish will be displayed here</p>
    <p>with another 2 mode of payment(selects from check box)</p>
    <p>If selects COD and press Procceed order will be confirmed and PDF will be downloaded</p>
    <p>If selects ONLINE and press Procceed will be sent to another page where user clicks on button and payment will be considered as successfull and PDF will be downloaded</p>
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
        <%-- COUSINES --%>
        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="txtMenuCousines" CssClass="col-md-2 control-label">Cousines Type : </asp:Label>
            <div class="col-md-5">
                <asp:TextBox runat="server" ID="txtMenuCousines" CssClass="form-control" Height="30px" Width="300px" Text="" ReadOnly="true" />
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
        <%-- IMAGE --%>
        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="ImgMenuImage" CssClass="col-md-2 control-label">Image : </asp:Label>
            <div class="col-md-5">
                <asp:Image ID="ImgMenuImage" runat="server" CssClass="auto-style1" Width="280px" />                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               
            </div>
        </div>
        <%-- SELECT PAYMENT MODE --%>
        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="btnBack" CssClass="col-md-2 control-label">Payment Mode :</asp:Label>
            <div class="col-md-5">
                <asp:DropDownList ID="ddlSelectPaymentMode" runat="server" CssClass="form-control" Width="280px" >
                    <asp:ListItem Value="cod">Cash On Delivery</asp:ListItem>
                    <asp:ListItem Value="online" disabled="disabled">Pay Online</asp:ListItem>
                </asp:DropDownList>
            </div>
        </div>
        <%-- BUTTON --%>
        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="btnBack" CssClass="col-md-2 control-label"></asp:Label>
            <div class="col-md-5">
                <asp:Button ID="btnCheckOut" runat="server" CssClass="btn btn-default" Text="Check Out" OnClick="btnCheckOut_Click" OnClientClick="return confirm('This will Confirm Order!, Are you sure?')" />
                &nbsp;&nbsp;
                <asp:Button ID="btnBack" runat="server" CssClass="btn btn-default" Text="Back" OnClick="btnBack_Click" />                
            </div>
        </div>
       
    </div>
</asp:Content>
