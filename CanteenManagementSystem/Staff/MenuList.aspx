<%@ Page Title="Menu List" Language="C#" MasterPageFile="~/Staff/Site1.Master" AutoEventWireup="true" CodeBehind="MenuList.aspx.cs" Inherits="CanteenManagementSystem.Staff.MenuList" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="form-horizontal">
        <p class="text-danger">
            <asp:Literal runat="server" ID="ErrorMessage" />
        </p>
        <asp:ValidationSummary runat="server" CssClass="text-danger" />
        <div class="shadowBox">
            <div class="page-container">
                <div class="d-flex">
                    <div class="container">
                        <div class="jumbotron">  
                            <h2  class="text-danger"><%: Title %>.</h2>
                            <br />
                            <asp:Table ID="Table1" runat="server" Width="100%">
                                <asp:TableRow>
                                    <asp:TableCell Width="40%">
                                        <p>Add Update & Delete menu</p>
                                    </asp:TableCell>
                                    <asp:TableCell  width="15%">
                                        Available?: 
                                        <div class="text-right">
                                            <asp:DropDownList ID="ddlAvailableOrNot" CssClass="form-control rounded" runat="server" Width="100%" aria-label="Search" aria-describedby="search-addon" ValidationGroup="rgstr">
                                                <asp:ListItem Value="yes">Yes</asp:ListItem>
                                                <asp:ListItem Value="no">No</asp:ListItem>
                                            </asp:DropDownList>
                                            <asp:Button type="button" CssClass="btn btn-outline-primary" ID="btnMenuAvailableOrNot" runat="server" Text="Search" OnClick="btnMenuAvailableOrNot_Click" />
                                        </div>
                                    </asp:TableCell>
                                    <asp:TableCell  width="15%">
                                        Cousines: 
                                        <div class="text-right">
                                            <asp:DropDownList ID="ddlSelectCousines" CssClass="form-control rounded" runat="server" Width="100%" aria-label="Search" aria-describedby="search-addon" ValidationGroup="rgstr">
                                                <asp:ListItem Value="indian">Indian</asp:ListItem>
                                                <asp:ListItem Value="gujarati">Gujarati</asp:ListItem>
                                                <asp:ListItem Value="panjabi">Panjabi</asp:ListItem>
                                                <asp:ListItem Value="southindian">South Indian</asp:ListItem>
                                                <asp:ListItem Value="northindian">North Indian</asp:ListItem>
                                                <asp:ListItem Value="rajasthani">Rajsthani</asp:ListItem>
                                                <asp:ListItem Value="chinese">Chinese</asp:ListItem>
                                                <asp:ListItem Value="italian">Italian</asp:ListItem>
                                            </asp:DropDownList>
                                            <asp:Button type="button" CssClass="btn btn-outline-primary" ID="btnSelectCousines" runat="server" Text="Search" OnClick="btnSelectCousines_Click" />
                                        </div>
                                    </asp:TableCell>
                                    <asp:TableCell  width="15%">
                                        Type : 
                                        <div class="text-right">
                                            <asp:DropDownList ID="ddlSelectType" CssClass="form-control rounded" runat="server" Width="100%" aria-label="Search" aria-describedby="search-addon" ValidationGroup="rgstr">
                                                <asp:ListItem Value="fastFood">Fast Food</asp:ListItem>
                                                <asp:ListItem Value="bakery">Bakery</asp:ListItem>
                                                <asp:ListItem Value="fullThali">Full Thali</asp:ListItem>
                                                <asp:ListItem Value="colddrink">Cold Drinks</asp:ListItem>
                                                <asp:ListItem Value="dessert">Dessert</asp:ListItem>
                                                <asp:ListItem Value="teacoffee">Tea and Coffee</asp:ListItem>
                                                <asp:ListItem Value="icecream">Ice Cream</asp:ListItem>
                                            </asp:DropDownList>
                                            <asp:Button type="button" CssClass="btn btn-outline-primary" ID="btnSelectType" runat="server" Text="Search" OnClick="btnSelectType_Click" />
                                        </div>
                                    </asp:TableCell>
                                    <asp:TableCell width="15%">
                                        Search by Name : 
                                        <div class="text-right">
                                            <asp:TextBox ID="txtSearchMenu" runat="server" type="search" class="form-control rounded" placeholder="Name" aria-label="Search" aria-describedby="search-addon" width="100%"/>       
                                            <asp:Button type="button" CssClass="btn btn-outline-primary" ID="srchSearchMenu" runat="server" Text="Search" OnClick="SearchMenu_Click" />
                                        </div>
                                    </asp:TableCell>
                                </asp:TableRow>
                            </asp:Table>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-lg-12 ">
                            <div class="table-responsive">
                                <asp:GridView ID="menuList" Width="100%" PaperStyle-CssClass="paging" CssClass="table table-striped table-bordered table-hover" PageSize="10" runat="server" AutoGenerateColumns="False"  EmptyDataText="There are no data records to display.">
                                    <Columns>
                                        <asp:TemplateField HeaderText="Details" HeaderStyle-Width="30%">
                                            <ItemTemplate>
                                                Name : <asp:Label ID="menuName" runat="server" Text='<%# Eval("menuName") %>' />
                                                    <br />
                                                Price : <asp:Label runat="server" id="menuPrice" Text='<%# Eval("menuPrice") %>' />
                                                    <br />
                                                Menu Availbility : <asp:Label ID="menuAvailbility" runat="server" Text='<%# Eval("menuAvailbility") %>' />
                                                    <br />
                                                Menu Type : <asp:Label runat="server" id="staffJoinDate" Text='<%# Eval("menuType") %>' />
                                                    <br />
                                                Veg or NonVeg : <asp:Label ID="vegOrNonVeg" runat="server" Text='<%# Eval("vegOrNonVeg") %>' />
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                    </Columns>
                                    <Columns>
                                        <asp:ImageField ReadOnly="true" HeaderText="Image" DataImageUrlField="menuImage" ControlStyle-Height="100" >
                                            <ControlStyle Height="100px" ></ControlStyle>
                                        </asp:ImageField>
                                    </Columns>
                                    <Columns>
                                        <asp:HyperLinkField HeaderText="View" ControlStyle-CssClass="btn btn-primary" Text="View" DataNavigateUrlFields="Id" DataNavigateUrlFormatString="ViewMenu.aspx?Id={0}" />
                                    </Columns>
                                    <Columns>
                                        <asp:HyperLinkField HeaderText="Update" ControlStyle-CssClass="btn btn-primary" Text="Update" DataNavigateUrlFields="Id" DataNavigateUrlFormatString="UpdateMenu.aspx?Id={0}" />
                                    </Columns>
                                    <Columns>
                                        <asp:HyperLinkField HeaderText="Delete" ControlStyle-CssClass="btn btn-danger" Text="Delete" DataNavigateUrlFields="Id" DataNavigateUrlFormatString="DeleteMenu.aspx?Id={0}" />
                                    </Columns>
                                </asp:GridView>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
