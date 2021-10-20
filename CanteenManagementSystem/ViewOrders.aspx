<%@ Page Title="View Orders" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ViewOrders.aspx.cs" Inherits="CanteenManagementSystem.ViewOrders" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="shadowBox">
            <div class="page-container">
                <div class="container">
                    <div class="jumbotron">
                        <h2 class="text-danger"><%: Title %>.</h2>
                        <p>Upcoming Orders by perticular user will be displayed here( including previous ones )</p>
                    </div>
                    <hr />
                    <div>
                        <h3>Upcoming Orders : </h3>
                    </div>
                    <div class="row">
                        <div class="col-lg-12 ">
                            <div class="table-responsive">
                                <asp:GridView ID="gvUpcomingOrderStatus" runat="server" Width="100%" PaperStyle-CssClass="paging"  CssClass="table table-striped table-bordered table-hover" AutoGenerateColumns="False" DataKeyNames="Id" EmptyDataText="There are no data records to display." OnRowCommand="gvUpcomingOrderStatus_RowCommand">  
                                    <Columns>
                                        <asp:BoundField DataField="Id" HeaderText="Id" ReadOnly="True" SortExpression="Id" />  <%--Visible="false"--%>
                                        <asp:BoundField DataField="customerName" HeaderText="Customer Name"  HeaderStyle-CssClass="visible-md" ItemStyle-CssClass="visible-md" />  
                                        <asp:BoundField DataField="menuName" HeaderText="Menu Name"  ItemStyle-CssClass="visible-md" HeaderStyle-CssClass="visible-md" />  
                                        <asp:BoundField DataField="orderPrice" HeaderText="Menu Price"  HeaderStyle-CssClass="visible-md" ItemStyle-CssClass="visible-md" />  
                                        <asp:BoundField DataField="CODorOnlinePay" HeaderText="COD or Online"  ItemStyle-CssClass="visible-md" HeaderStyle-CssClass="visible-md" />  
                                        <asp:BoundField DataField="PaymentDoneOrNot" HeaderText="Payment Done?"  ItemStyle-CssClass="visible-md" HeaderStyle-CssClass="visible-md" />  
                                        <asp:BoundField DataField="orderDate" HeaderText="Order Date"  HeaderStyle-CssClass="visible-md" ItemStyle-CssClass="visible-md" DataFormatString="{0:dd/MM/yyyy}" />
                                    </Columns>
                                    <%--
                                    <Columns>
                                        <asp:ButtonField HeaderText="Print Reciept" ButtonType="Button" Text="Print" CommandName="printOrderId" />
                                    </Columns>
                                        --%>
                                </asp:GridView>  
                            </div>  
                        </div>  
                    </div>
                    <hr />
                    <div>
                        <h3>Previous Orders : </h3>
                    </div>
                    <div class="row">
                        <div class="col-lg-12 ">
                            <div class="table-responsive">
                                <asp:GridView ID="gvPreviousOrderStatus" runat="server" Width="100%" PaperStyle-CssClass="paging" CssClass="table table-striped table-bordered table-hover" AutoGenerateColumns="False" DataKeyNames="Id" EmptyDataText="There are no data records to display.">  
                                    <Columns>
                                        <%--<asp:BoundField DataField="Id" HeaderText="Id" ReadOnly="True" SortExpression="Id" />--%>  
                                        <asp:BoundField DataField="customerName" HeaderText="Customer Name"  HeaderStyle-CssClass="visible-md" ItemStyle-CssClass="visible-md" />  
                                        <asp:BoundField DataField="menuName" HeaderText="Menu Name"  ItemStyle-CssClass="visible-md" HeaderStyle-CssClass="visible-md" />  
                                        <asp:BoundField DataField="orderPrice" HeaderText="Menu Price"  HeaderStyle-CssClass="visible-md" ItemStyle-CssClass="visible-md" />  
                                        <asp:BoundField DataField="CODorOnlinePay" HeaderText="COD or Online"  ItemStyle-CssClass="visible-md" HeaderStyle-CssClass="visible-md" />  
                                        <asp:BoundField DataField="PaymentDoneOrNot" HeaderText="Payment Done?"  ItemStyle-CssClass="visible-md" HeaderStyle-CssClass="visible-md" />  
                                        <asp:BoundField DataField="orderDate" HeaderText="Order Date"  HeaderStyle-CssClass="visible-md" ItemStyle-CssClass="visible-md" DataFormatString="{0:dd/MM/yyyy}" />
                                    </Columns>  
                                </asp:GridView>  
                            </div>  
                        </div>  
                    </div>
                    <div>
                        <h3>Missed Orders : </h3>
                    </div>
                    <div class="row">
                        <div class="col-lg-12 ">
                            <div class="table-responsive">
                                <asp:GridView ID="gvMissedOrderStatus" runat="server" Width="100%" PaperStyle-CssClass="paging" CssClass="table table-striped table-bordered table-hover" AutoGenerateColumns="False" DataKeyNames="Id" EmptyDataText="There are no data records to display.">  
                                    <Columns>
                                        <%--<asp:BoundField DataField="Id" HeaderText="Id" ReadOnly="True" SortExpression="Id" />--%>  
                                        <asp:BoundField DataField="customerName" HeaderText="Customer Name"  HeaderStyle-CssClass="visible-md" ItemStyle-CssClass="visible-md" />  
                                        <asp:BoundField DataField="menuName" HeaderText="Menu Name"  ItemStyle-CssClass="visible-md" HeaderStyle-CssClass="visible-md" />  
                                        <asp:BoundField DataField="orderPrice" HeaderText="Menu Price"  HeaderStyle-CssClass="visible-md" ItemStyle-CssClass="visible-md" />  
                                        <asp:BoundField DataField="CODorOnlinePay" HeaderText="COD or Online"  ItemStyle-CssClass="visible-md" HeaderStyle-CssClass="visible-md" />  
                                        <asp:BoundField DataField="PaymentDoneOrNot" HeaderText="Payment Done?"  ItemStyle-CssClass="visible-md" HeaderStyle-CssClass="visible-md" />  
                                        <asp:BoundField DataField="orderDate" HeaderText="Order Date"  HeaderStyle-CssClass="visible-md" ItemStyle-CssClass="visible-md" DataFormatString="{0:dd/MM/yyyy}" />
                                    </Columns>  
                                </asp:GridView>  
                            </div>  
                        </div>  
                    </div>
                </div>  
            </div>  
        </div>
</asp:Content>
