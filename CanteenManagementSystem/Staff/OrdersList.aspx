<%@ Page Title="Upcoming Orders" Language="C#" MasterPageFile="~/Staff/Site1.Master" AutoEventWireup="true" CodeBehind="OrdersList.aspx.cs" Inherits="CanteenManagementSystem.Staff.OrdersList" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <div id="mainContainer" class="container">
        <div class="shadowBox">
            <div class="page-container">
                <div class="container">
                    <div class="jumbotron">
                        <h2 class="text-danger"><%: Title %>.</h2>
                        <br />
                        <asp:Table ID="Table1" runat="server" Width="100%">
                            <asp:TableRow>
                                <asp:TableCell Width="50%">
                                    <p>Manage Customer Orders</p>
                                </asp:TableCell>
                                <asp:TableCell  width="15%">
                                    Order Status :
                                    <div class="text-right">
                                        <asp:DropDownList ID="ddlPaidorNot" CssClass="form-control rounded" runat="server" Width="100%" aria-label="Search" aria-describedby="search-addon" ValidationGroup="rgstr">
                                            <asp:ListItem Value="no">Panding</asp:ListItem>
                                            <asp:ListItem Value="yes">Paid</asp:ListItem>
                                            <asp:ListItem Value="missed">Missed Orders</asp:ListItem>
                                            <asp:ListItem Value="all">Display ALL Orders</asp:ListItem>
                                        </asp:DropDownList>
                                        <asp:Button type="button" CssClass="btn btn-outline-primary" ID="btnPaidorNot" runat="server" Text="Search" OnClick="btnPaidorNot_Click" />
                                    </div>
                                </asp:TableCell>
                                <asp:TableCell width="15%">
                                        Search in DB : 
                                        <div class="text-right">
                                            <asp:TextBox ID="txtSearchOrderbyCustomerName" runat="server" type="search" class="form-control rounded" placeholder="Customer Name" aria-label="Search" aria-describedby="search-addon" width="100%"/>       
                                            <asp:Button type="button" CssClass="btn btn-outline-primary" ID="btnSearchOrderbyCustomerName" runat="server" Text="Search" OnClick="btnSearchOrderbyCustomerName_Click" />
                                        </div>
                                    </asp:TableCell>
                            </asp:TableRow>
                        </asp:Table>
                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-12 ">
                        <div class="table-responsive">
                            <asp:GridView ID="gvOrderStatus" runat="server" Width="100%" PaperStyle-CssClass="paging" CssClass="table table-striped table-bordered table-hover" PageSize="10" AutoGenerateColumns="False" DataKeyNames="Id" EmptyDataText="There are no data records to display." OnRowCommand="gvOrderStatus_RowCommand">  
                                <Columns>
                                    <asp:BoundField DataField="Id" HeaderText="Id" ReadOnly="True" SortExpression="Id" />  
                                    <%--<asp:BoundField DataField="customerId" HeaderText="Customer I'd"  HeaderStyle-CssClass="visible-md" ItemStyle-CssClass="visible-md" />--%>
                                    <asp:BoundField DataField="customerName" HeaderText="Customer Name"  ItemStyle-CssClass="visible-md" HeaderStyle-CssClass="visible-md" />  
                                    <%--<asp:BoundField DataField="menuId" HeaderText="Menu I'd"  HeaderStyle-CssClass="visible-md" ItemStyle-CssClass="visible-md" />--%>  
                                    <asp:BoundField DataField="menuName" HeaderText="Menu Name"  ItemStyle-CssClass="visible-md" HeaderStyle-CssClass="visible-md" />  
                                    <asp:BoundField DataField="orderPrice" HeaderText="Order Price"  ItemStyle-CssClass="visible-md" HeaderStyle-CssClass="visible-md" />  
                                    <%--<asp:BoundField DataField="CODorOnlinePay" HeaderText="COD or OnlinePayment"  HeaderStyle-CssClass="visible-md" ItemStyle-CssClass="visible-md" />--%>
                                    <asp:BoundField DataField="orderDate" HeaderText="Order Date"  HeaderStyle-CssClass="visible-md" ItemStyle-CssClass="visible-md" DataFormatString="{0:dd/MM/yyyy}" /> 
                                    <asp:BoundField DataField="PaymentDoneOrNot" HeaderText="Paid ?"  HeaderStyle-CssClass="visible-md" ItemStyle-CssClass="visible-md" />                                     
                                </Columns>
                                <Columns>
                                    <asp:ButtonField HeaderText="Payment Status" ButtonType="Button" Text="Paid" CommandName="orderId" />
                                </Columns>
                            </asp:GridView>  
                        </div>  
                    </div>  
                </div> 
            </div>  
        </div>  
    </div>
</asp:Content>
