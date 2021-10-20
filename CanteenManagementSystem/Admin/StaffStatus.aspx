<%@ Page Title="Staff Details" Language="C#" MasterPageFile="~/Admin/Site1.Master" AutoEventWireup="true" CodeBehind="StaffStatus.aspx.cs" Inherits="CanteenManagementSystem.Admin.StaffStatus" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <br />
    <div id="mainContainer" class="container">
        <div class="shadowBox">
            <div class="page-container">
                <div class="d-flex">
                    <div class="container">
                        <div class="jumbotron">  
                            <h2  class="text-danger"><%: Title %>.</h2>
                            <br />
                            <asp:Table ID="Table1" runat="server" Width="100%">
                                <asp:TableRow>
                                    <asp:TableCell Width="50%"><p>Staff member's details here</p></asp:TableCell>
                                    <asp:TableCell  width="20%">
                                        Search by Role : 
                                        <div class="text-right">
                                            <asp:DropDownList ID="ddlSelectRole" CssClass="form-control rounded" runat="server" Width="100%" aria-label="Search" aria-describedby="search-addon" ValidationGroup="rgstr">
                                                <asp:ListItem Value="Staff">Staff</asp:ListItem>
                                                <asp:ListItem  Value="Admin">Admin</asp:ListItem>
                                            </asp:DropDownList>
                                            <asp:Button type="button" CssClass="btn btn-outline-primary" ID="btnSelectRole" runat="server" Text="Search" OnClick="btnSelectRole_Click" />
                                        </div>
                                    </asp:TableCell>
                                    <asp:TableCell width="20%">
                                        Search by Name : 
                                        <div class="text-right">
                                            <asp:TextBox ID="txtSearchStaff" runat="server" type="search" class="form-control rounded" placeholder="Name" aria-label="Search" aria-describedby="search-addon" width="100%"/>       
                                            <asp:Button type="button" CssClass="btn btn-outline-primary" ID="btnSearchStaff" runat="server" Text="Search" OnClick="btnSearchStaff_Click" />
                                        </div>
                                    </asp:TableCell>
                                </asp:TableRow>
                            </asp:Table>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-lg-12 ">
                            <div class="table-responsive">
                                <asp:GridView ID="staffStatus" Width="100%" PaperStyle-CssClass="paging" CssClass="table table-striped table-bordered table-hover" PageSize="10" runat="server" AutoGenerateColumns="False"  EmptyDataText="There are no data records to display.">
                                    <Columns>
                                        <asp:TemplateField HeaderText="Details" HeaderStyle-Width="40%">
                                            <ItemTemplate>
                                                Id: <asp:Label runat="server" id="staffId" Text='<%# Eval("Id") %>' />
                                                <br />
                                                Name : <asp:Label ID="staffName" runat="server" Text='<%# Eval("staffName") %>' /> <asp:Label runat="server" id="staffSurname" Text='<%# Eval("staffSurname") %>' /> (<asp:Label runat="server" id="staffGender" Text='<%# Eval("staffGender") %>' />) <br />Email : <asp:Label ID="staffEmail" runat="server" Text='<%# Eval("staffEmail") %>' />
                                                <br />
                                                Phone No. : <asp:Label ID="staffPhoneNo" runat="server" Text='<%# Eval("staffPhoneNo") %>' />
                                                <br />
                                                Joining Date: <asp:Label runat="server" id="staffJoinDate" Text='<%# Eval("staffJoinDate") %>' />
                                                <br />
                                                Role : <asp:Label ID="Role" runat="server" Text='<%# Eval("Role") %>' />
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:ImageField ReadOnly="true" HeaderText="Image" DataImageUrlField="staffImage" ControlStyle-Height="120" >
                                            <ControlStyle Height="120px" ></ControlStyle>
                                        </asp:ImageField>
                                        <asp:HyperLinkField HeaderText="Update" ControlStyle-CssClass="btn btn-primary" Text="Update" DataNavigateUrlFields="Id" DataNavigateUrlFormatString="UpdateStaff.aspx?Id={0}" />
                                        <asp:HyperLinkField HeaderText="Delete" ControlStyle-CssClass="btn btn-danger" Text="Delete" DataNavigateUrlFields="Id" DataNavigateUrlFormatString="DeleteStaff.aspx?Id={0}" />
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
