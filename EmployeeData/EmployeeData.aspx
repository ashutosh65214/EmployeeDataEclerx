<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="EmployeeData.aspx.cs" Inherits="EmployeeData.EmployeeData" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .modalBackground{
            background-color: Black;
        filter: alpha(opacity=40);
        opacity: 0.4;
        }
   
     
        .auto-style1 {
            width: 100%;
        }
        .auto-style2 {
            width: 156px;
            background-color: #FFCC00;
        }
        .auto-style3 {
            width: 243px;
            background-color: #FFCC00;
        }
        .auto-style4 {
            width: 163px;
            background-color: #FFCC00;
        }
        .auto-style5 {
            width: 156px;
            height: 40px;
            background-color: #FFCC00;
        }
        .auto-style6 {
            width: 243px;
            height: 40px;
            background-color: #FFCC00;
        }
        .auto-style7 {
            width: 163px;
            height: 40px;
            background-color: #FFCC00;
        }
        .auto-style8 {
            height: 40px;
            background-color: #FFCC00;
        }
        .auto-style9 {
            height: 30px;
            background-color: #FFCC00;
        }
        .auto-style10 {
            background-color: #FFCC00;
        }
        .auto-style11 {
            height: 23px;
        }
        .auto-style12 {
            width: 175px;
        }
        .auto-style13 {
            height: 23px;
            width: 175px;
        }
        .auto-style14 {
            width: 212px;
        }
        .auto-style15 {
            height: 23px;
            width: 212px;
        }
        .auto-style16 {
            width: 100%;
            background-color: #FFCC00;
        }
        .auto-style17 {
            width: 216px;
        }
        .auto-style18 {
            height: 23px;
            width: 216px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Label ID="LblData" runat="server" Text="Data"></asp:Label>
            <asp:Button ID="BtnCreate" runat="server" Text="Create" OnClick="BtnCreate_Click" />
            <asp:ScriptManager ID="ScriptManager1" runat="server">
            </asp:ScriptManager>
            <br />
            <asp:GridView ID="GridEmployee" runat="server" AutoGenerateColumns="False" DataKeyNames="ID" DataSourceID="SqlDataSource1" OnSelectedIndexChanged="GridEmployee_SelectedIndexChanged" CellPadding="4" ForeColor="#333333" GridLines="None">
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:BoundField DataField="ID" HeaderText="ID" ReadOnly="True" SortExpression="ID" />
                    <asp:BoundField DataField="PCIDSSUSERNAME" HeaderText="PCIDSS USERNAME" SortExpression="PCIDSSUSERNAME" />
                    <asp:BoundField DataField="ECLERXUSERNAME" HeaderText="ECLERX USERNAME" SortExpression="ECLERXUSERNAME" />
                    <asp:BoundField DataField="EMAIL" HeaderText="EMAIL" SortExpression="EMAIL" />
                    <asp:BoundField DataField="PUBLICROLES" HeaderText="PUBLIC ROLES" SortExpression="PUBLICROLES" />
                    <asp:BoundField DataField="ADMINROLES" HeaderText="ADMIN ROLES" SortExpression="ADMINROLES" />
                    <asp:BoundField DataField="STATUS" HeaderText="STATUS" SortExpression="STATUS" />
                    <asp:CommandField SelectText="Edit" ShowSelectButton="True" />
                </Columns>
                <EditRowStyle BackColor="#2461BF" />
                <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                <RowStyle BackColor="#EFF3FB" />
                <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                <SortedAscendingCellStyle BackColor="#F5F7FB" />
                <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                <SortedDescendingCellStyle BackColor="#E9EBEF" />
                <SortedDescendingHeaderStyle BackColor="#4870BE" />
            </asp:GridView>
             <asp:LinkButton ID="LinkButton1" runat="server"></asp:LinkButton>

            <br />
            <asp:LinkButton ID="LinkButton2" runat="server"></asp:LinkButton>

            <br />
            <asp:Panel ID="PanelUpdate" runat="server" Height="152px" Width="906px" Style="display: none"  >
                <table class="auto-style1">
                    <tr>
                        <td class="auto-style2">ID</td>
                        <td class="auto-style3">
                            <asp:TextBox ID="TxtId" runat="server" Height="24px" Width="234px"></asp:TextBox>
                        </td>
                        <td class="auto-style4">PCIDSS USERNAME</td>
                        <td class="auto-style10">
                            <asp:TextBox ID="TxtPcidssUserName" runat="server" Height="26px" Width="313px"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style2">ECLERX USERNAME</td>
                        <td class="auto-style3">
                            <asp:TextBox ID="TxtUserName" runat="server" Height="27px" Width="235px"></asp:TextBox>
                        </td>
                        <td class="auto-style4">EMAIL</td>
                        <td class="auto-style10">
                            <asp:TextBox ID="TxtEmail" runat="server" Height="27px" Width="315px"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style5">PUBLIC&nbsp; ROLES</td>
                        <td class="auto-style6">
                            <asp:TextBox ID="TxtPublicRoles" runat="server" TextMode="MultiLine" Width="235px"></asp:TextBox>
                        </td>
                        <td class="auto-style7">ADMIN ROLES</td>
                        <td class="auto-style8">
                            <asp:TextBox ID="TxtAdminRoles" runat="server" TextMode="MultiLine" Width="316px"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="4" class="auto-style9">
                            <asp:Button ID="BtnUpdate" runat="server" Text="Update" Width="95px" OnClick="BtnUpdate_Click"/>
                            <asp:Button ID="BtnClose" runat="server" Text="Close" Width="100px"/>
                        </td>
                    </tr>
                </table>
            </asp:Panel>
            <br />
            <asp:Panel ID="PanelCreate" runat="server" Height="186px" Width="910px" Style="display: none" >
                <table class="auto-style16">
                    <tr>
                        <td class="auto-style12">ID</td>
                        <td class="auto-style17">
                            <asp:TextBox ID="TxtInId" runat="server" Height="20px" Width="214px"></asp:TextBox>
                        </td>
                        <td class="auto-style14">PCIDSS USERNAME</td>
                        <td>
                            <asp:TextBox ID="TxtInPUserName" runat="server" Height="18px" Width="271px"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style13">ECLERX USERNAME</td>
                        <td class="auto-style18">
                            <asp:TextBox ID="TxtInExUserName" runat="server" Height="20px" Width="215px"></asp:TextBox>
                        </td>
                        <td class="auto-style15">EMAIL</td>
                        <td class="auto-style11">
                            <asp:TextBox ID="TxtInEmail" runat="server" Height="18px" Width="269px"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style12">PUBLIC&nbsp; ROLES</td>
                        <td class="auto-style17">
                            <asp:TextBox ID="TxtInPublicRoles" runat="server" Height="43px" TextMode="MultiLine" Width="215px"></asp:TextBox>
                        </td>
                        <td class="auto-style14">ADMIN ROLES</td>
                        <td>
                            <asp:TextBox ID="TxtInAdminRoles" runat="server" Height="47px" TextMode="MultiLine" Width="266px"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style13">STATUS</td>
                        <td class="auto-style18">
                            <asp:DropDownList ID="DdlStatus" runat="server" Height="19px" Width="214px">
                                <asp:ListItem>Active</asp:ListItem>
                                <asp:ListItem>Deactive</asp:ListItem>
                            </asp:DropDownList>
                        </td>
                        <td class="auto-style11" colspan="2"></td>
                    </tr>
                    <tr>
                        <td colspan="4">
                            <asp:Button ID="BtnInsert" runat="server" Text="Insert" Width="99px" OnClick="BtnInsert_Click" />
                            <asp:Button ID="BtnExit" runat="server" Text="Close" Width="95px"/>
                        </td>
                    </tr>
                </table>
            </asp:Panel>
            <br />
            <br />
            <br />
            <br />
            <ajaxToolkit:ModalPopupExtender ID="ModalPopupExtender1" TargetControlID="LinkButton1" PopupControlID="PanelUpdate" CancelControlID="BtnClose" BackgroundCssClass="modalBackground" runat="server"></ajaxToolkit:ModalPopupExtender>
            <ajaxToolkit:ModalPopupExtender ID="ModalPopupExtender2" TargetControlID="LinkButton2" PopupControlID="PanelCreate" CancelControlID="BtnExit" BackgroundCssClass="modalBackground" runat="server"></ajaxToolkit:ModalPopupExtender>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:EclerxConnectionString %>" SelectCommand="SELECT * FROM [EmployeeData]"></asp:SqlDataSource>
           
            <br />
        </div>
    </form>
</body>
</html>
