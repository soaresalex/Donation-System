<%@ Page Title="" Language="VB" MasterPageFile="~/Donation.master" AutoEventWireup="false" CodeFile="donation_list.aspx.vb" Inherits="donation_list" %>

<%@ MasterType VirtualPath="~/donation.master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphMain" Runat="Server">
    <asp:DataList ID="DataList1" runat="server" DataSourceID="sdsDonations">
        <ItemTemplate>
            giftamount:
            <asp:Label Text='<%# Eval("giftamount") %>' runat="server" ID="giftamountLabel" /><br />
            giftdate:
            <asp:Label Text='<%# Eval("giftdate") %>' runat="server" ID="giftdateLabel" /><br />
            cid:
            <asp:Label Text='<%# Eval("cid") %>' runat="server" ID="cidLabel" /><br />
            did:
            <asp:Label Text='<%# Eval("did") %>' runat="server" ID="didLabel" /><br />
            <br />
        </ItemTemplate>
    </asp:DataList>
    <asp:SqlDataSource runat="server" ID="sdsDonations" ConnectionString='<%$ ConnectionStrings:CS557_FA17_soaresa9ConnectionString %>' SelectCommand="SELECT [giftamount], [giftdate], [cid], [did] FROM [donorgift] WHERE ([did] = @did)">
        <SelectParameters>
            <asp:QueryStringParameter QueryStringField="did" Name="did" Type="Int32"></asp:QueryStringParameter>
        </SelectParameters>
    </asp:SqlDataSource>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
</asp:Content>

