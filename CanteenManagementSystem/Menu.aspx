<%@ Page Title="Menu List for Today" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Menu.aspx.cs" Inherits="CanteenManagementSystem.Menu" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
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
                                        <p>Search by : </p>
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
                                            <asp:Button type="button" CssClass="btn btn-outline-primary" ID="srchSearchMenu" runat="server" Text="Search" OnClick="srchSearchMenu_Click" />
                                        </div>
                                    </asp:TableCell>
                                </asp:TableRow>
                            </asp:Table>
                        </div>
                    </div>
                    <div>
                        <asp:DataList ID="dlShowMenu" runat="server" RepeatColumns="3" RepeatDirection="Horizontal" Width="" BorderStyle="Inset" CellPadding="10" CssClass="text-center" GridLines="Both" BorderWidth="4px" CellSpacing="10">
                            <ItemTemplate>
                                <div class="my-8  shadow-lg inline-block">
                                    <div>
                                        <h3><asp:Label ID="menuName" runat="server" Text='<%# Bind("menuName") %>'></asp:Label> - &#8377;<asp:Label ID="Label1" runat="server" Text='<%# Bind("menuPrice") %>'></asp:Label></h3>
                                    </div>
                                    <div style="padding-left:30px; padding-right:30px;">
                                        <div style="padding:4px; border:1px solid #ddd; border-radius:4px;">
                                            <asp:Image ID="menuImage" runat="server" Height="100%" Width="100%" ImageUrl='<%# Bind("menuImage") %>' />
                                        </div>
                                    </div>
                                    <div style="padding-bottom:15px; padding:4px">
                                        <asp:HyperLink runat="server" CssClass="btn btn-default" NavigateUrl='<%# Eval("Id", "~/MenuDetails.aspx?Id={0}") %>'>Order Now</asp:HyperLink>
                                    </div>
                                </div>
                            </ItemTemplate>
                        </asp:DataList>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
