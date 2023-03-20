<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div>
    
        <table class="nav-justified" style="width: 98%; height: 279px">
            <tr>
                <td>&nbsp;</td>
                <td style="width: 192px">&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td style="height: 42px"></td>
                <td style="width: 192px; height: 42px;">
                    <asp:Label ID="Label1" runat="server" Text="Roll" ForeColor="#003366"></asp:Label>
                </td>
                <td style="height: 42px">
                    <asp:TextBox ID="txtroll" runat="server" Width="209px"></asp:TextBox>
&nbsp;&nbsp;&nbsp;&nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtroll" ErrorMessage="Roll number required" Font-Bold="True" Font-Size="Large" ForeColor="Red">*</asp:RequiredFieldValidator>
                    &nbsp;&nbsp;
                    <asp:Button ID="Btn_find" runat="server" Text="Find" BackColor="#B7DBFF" BorderColor="#B7DBFF" OnClick="Btn_find_Click" Width="104px" />
                </td>
                <td style="height: 42px"></td>
            </tr>
            <tr>
                <td style="height: 34px"></td>
                <td style="width: 192px; height: 34px">
                    <asp:Label ID="Label2" runat="server" Text="Name"></asp:Label>
                </td>
                <td style="height: 34px">
                    <asp:TextBox ID="txtname" runat="server" Height="22px" Width="410px"></asp:TextBox>
                </td>
                <td style="height: 34px"></td>
            </tr>
            <tr>
                <td style="height: 37px"></td>
                <td style="width: 192px; height: 37px;">
                    <asp:Label ID="Label3" runat="server" Text="Class"></asp:Label>
                </td>
                <td style="height: 37px">
                    <asp:DropDownList ID="txtclass" runat="server" Height="35px" Width="143px">
                        <asp:ListItem>BSC</asp:ListItem>
                        <asp:ListItem>BA</asp:ListItem>
                        <asp:ListItem>BCOM</asp:ListItem>
                        <asp:ListItem></asp:ListItem>
                    </asp:DropDownList>
                </td>
                <td style="height: 37px"></td>
            </tr>
            <tr>
                <td style="height: 42px"></td>
                <td style="width: 192px; height: 42px;">
                    <asp:Label ID="Label4" runat="server" Text="Fees"></asp:Label>
                </td>
                <td style="height: 42px">
                    <asp:TextBox ID="txtfees" runat="server" Width="218px"></asp:TextBox>
                </td>
                <td style="height: 42px"></td>
            </tr>
            <tr>
                <td style="height: 39px"></td>
                <td style="width: 192px; height: 39px;">
                    <asp:Label ID="Label5" runat="server" Text="Email"></asp:Label>
                </td>
                <td style="height: 39px">
                    <asp:TextBox ID="txtemail" runat="server" Width="223px"></asp:TextBox>
                </td>
                <td style="height: 39px"></td>
            </tr>
            <tr>
                <td>&nbsp;</td>
                <td style="width: 192px">&nbsp;</td>
                <td>
                    <asp:Button ID="Btn_add" runat="server" Text="Add" OnClick="Btn_add_Click" Width="97px" BackColor="#B7DBFF"  />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:Button ID="button_edit" runat="server" Text="Edit" Width="102px" OnClick="button_edit_Click" BackColor="#B7DBFF" />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:Button ID="Btn_delete" runat="server" Text="Delete" Width="125px" BackColor="#B7DBFF" OnClick="Btn_delete_Click" />
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td>&nbsp;</td>
                <td style="width: 192px">&nbsp;</td>
                <td>
                    &nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td>&nbsp;</td>
                <td style="width: 192px">&nbsp;</td>
                <td>
                    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="roll" DataSourceID="SqlDataSource1" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" Width="644px">
                        <AlternatingRowStyle Font-Size="Medium" />
                        <Columns>
                            <asp:CommandField ShowSelectButton="True" />
                            <asp:BoundField DataField="roll" HeaderText="roll" ReadOnly="True" SortExpression="roll" />
                            <asp:BoundField DataField="name" HeaderText="name" SortExpression="name" />
                            <asp:BoundField DataField="class" HeaderText="class" SortExpression="class" />
                            <asp:BoundField DataField="fees" HeaderText="fees" SortExpression="fees" />
                            <asp:BoundField DataField="email" HeaderText="email" SortExpression="email" />
                        </Columns>
                    </asp:GridView>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:dbcrudsConnectionString %>" ProviderName="<%$ ConnectionStrings:dbcrudsConnectionString.ProviderName %>" SelectCommand="SELECT [roll], [name], [class], [fees], [email] FROM [stud_master]"></asp:SqlDataSource>
                </td>
                <td>&nbsp;</td>
            </tr>
        </table>
    
    </div>
</asp:Content>
