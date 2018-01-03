<%@ Page Title="" Language="VB" MasterPageFile="~/Donation.master" AutoEventWireup="false" CodeFile="gift_history.aspx.vb" Inherits="gift_history" %>

<%@ MasterType VirtualPath="~/donation.master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphMain" Runat="Server">
    <asp:DetailsView ID="dtvGift"
        runat="server"
        Height="50px"
        Width="125px"
        AutoGenerateRows="False"
        DataSourceID="sdsGift"
        AllowPaging="true">
        <Fields>
            <asp:BoundField DataField="giftdate" HeaderText="giftdate" SortExpression="giftdate"></asp:BoundField>
            <asp:BoundField DataField="giftamount" HeaderText="giftamount" SortExpression="giftamount"></asp:BoundField>
            <asp:BoundField DataField="campaignname" HeaderText="campaignname" SortExpression="campaignname"></asp:BoundField>
        </Fields>
    </asp:DetailsView>
    <asp:SqlDataSource runat="server" ID="sdsGift" ConnectionString='<%$ ConnectionStrings:CS557_FA17_soaresa9ConnectionString %>' SelectCommand="select giftdate,giftamount,campaignname from donorgift, campaign where campaignid=cid and did = @did">
        <SelectParameters>
            <asp:SessionParameter SessionField="did" Name="did" Type="Int32"></asp:SessionParameter>
        </SelectParameters>
    </asp:SqlDataSource>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
</asp:Content>

