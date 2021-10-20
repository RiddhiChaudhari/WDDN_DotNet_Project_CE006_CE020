<%@ Page Title="Customer Details" Language="C#" MasterPageFile="~/Admin/Site1.Master" AutoEventWireup="true" CodeBehind="CustomerStatus.aspx.cs" Inherits="CanteenManagementSystem.Admin.CustomerStatus" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div id="mainContainer" class="container">
        <div class="shadowBox">
            <div class="page-container">
                <div class="container">
                    <div class="jumbotron">
                        <h2 class="text-danger"><%: Title %>.</h2>
                    </div>
                    <div class="row">
                        <div class="col-lg-12 ">
                            <div class="table-responsive">
                                <asp:GridView ID="gvCustomerStatus" runat="server" Width="100%" PaperStyle-CssClass="paging" CssClass="table table-striped table-bordered table-hover" PageSize="10" AutoGenerateColumns="False" DataKeyNames="Id" EmptyDataText="There are no data records to display.">  
                                    <Columns>
                                        <asp:BoundField DataField="Id" HeaderText="Id" ReadOnly="True" SortExpression="Id" />  
                                        <asp:BoundField DataField="userName" HeaderText="Name"  HeaderStyle-CssClass="visible-md" ItemStyle-CssClass="visible-md" />  
                                        <asp:BoundField DataField="userSurname" HeaderText="Surname"  ItemStyle-CssClass="visible-md" HeaderStyle-CssClass="visible-md" />  
                                        <asp:BoundField DataField="userEmail" HeaderText="Email"  HeaderStyle-CssClass="visible-md" ItemStyle-CssClass="visible-md" />  
                                        <asp:BoundField DataField="userGender" HeaderText="Gender"  ItemStyle-CssClass="visible-md" HeaderStyle-CssClass="visible-md" />  
                                        <asp:BoundField DataField="userPhoneNo" HeaderText="Phone No"  ItemStyle-CssClass="visible-md" HeaderStyle-CssClass="visible-md" />  
                                        <asp:BoundField DataField="userUserName" HeaderText="User Name"  HeaderStyle-CssClass="visible-md" ItemStyle-CssClass="visible-md" />  
                                        <asp:BoundField DataField="userStream" HeaderText="User Stream"  HeaderStyle-CssClass="visible-md" ItemStyle-CssClass="visible-md" /> 
                                    </Columns>  
                                </asp:GridView>  
                            </div>  
                        </div>  
                    </div>  
                </div>  
            </div>  
        </div>  
    </div>  
    <%--<asp:GridView ID="gvCustomerStatus" runat="server"></asp:GridView>--%>
</asp:Content>
