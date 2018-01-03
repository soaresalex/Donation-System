<%@ Page Title="" Language="VB" MasterPageFile="~/Donation.master" AutoEventWireup="false" CodeFile="success.aspx.vb" Inherits="success" %>

<%@ MasterType VirtualPath="~/donation.master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphMain" runat="Server">
    <table>
        <tr>
            <td>Username</td>
            <td>
                <asp:Label ID="lblUser" runat="server" Text="" /></td>
        </tr>
        <tr>
            <td>Password</td>
            <td>
                <asp:Label ID="lblPass" runat="server" Text="" /></td>
        </tr>
        <tr>
            <td>SessionID</td>
            <td>
                <asp:Label ID="lblSessionID" runat="server" Text="" /></td>
        </tr>
        <tr>
            <td></td>
            <td></td>
        </tr>
    </table>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
</asp:Content>

