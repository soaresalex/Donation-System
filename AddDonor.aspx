<%@ Page Title="" Language="VB" MasterPageFile="~/Donation.master" AutoEventWireup="false" CodeFile="AddDonor.aspx.vb" Inherits="AddDonor" %>

<%@ MasterType VirtualPath="~/donation.master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style type="text/css">
        .auto-style1 {
            width: 88px;
        }

        .auto-style2 {
            width: 100px;
        }

        .auto-style3 {
            width: 341px;
            height: 253px;
            margin-right: 0px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphMain" runat="Server">
    <table class="auto-style3">
        <tr>
            <td class="auto-style2">First Name</td>
            <td>
                <asp:TextBox ID="txtFirstName" runat="server" Text="" /></td>
        </tr>
        <tr>
            <td class="auto-style2">Last Name</td>
            <td>
                <asp:TextBox ID="txtLastName" runat="server" Text="" /></td>
        </tr>
        <tr>
            <td class="auto-style2">Affiliation</td>
            <td>
                <asp:DropDownList ID="ddlAffiliation" runat="server">
                    <asp:ListItem Value="NA">Please select an Affiliation</asp:ListItem>
                    <asp:ListItem Value="AL">Alumni</asp:ListItem>
                    <asp:ListItem Value="FR">Friend</asp:ListItem>
                    <asp:ListItem Value="PR">Parent</asp:ListItem>
                </asp:DropDownList></td>
        </tr>
        <tr>
            <td class="auto-style2">Username</td>
            <td>
                <asp:TextBox ID="txtUsername" runat="server" Text="" /></td>
        </tr>
        <tr>
            <td class="auto-style2">Password</td>
            <td>
                <asp:TextBox ID="txtPassword" runat="server" Text="" /></td>
        </tr>
        <tr>
            <td class="auto-style2">User Level</td>
            <td>
                <asp:DropDownList ID="ddlLevel" runat="server">
                    <asp:ListItem Value="0">Please select a level</asp:ListItem>
                    <asp:ListItem Value="1">Administrator</asp:ListItem>
                    <asp:ListItem Value="4">End User</asp:ListItem>
                </asp:DropDownList></td>
        </tr>
        <tr>
            <td class="auto-style2"></td>
            <td>
                <asp:Button ID="btnAddDonor" runat="server" Text="Add Donor" /></td>
        </tr>
    </table>
    <asp:Label ID="lblError" runat="server" Text="" />
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
</asp:Content>

