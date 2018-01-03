<%@ Page Title="" Language="VB" MasterPageFile="~/Donation.master" AutoEventWireup="false" CodeFile="donor_history.aspx.vb" Inherits="donor_history" %>

<%@ MasterType VirtualPath="~/donation.master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphMain" runat="Server">
    <asp:GridView
        ID="GridView1"
        runat="server"
        AutoGenerateColumns="False"
        DataKeyNames="donorid"
        DataSourceID="dsdDonorList">
        <Columns>
            <asp:HyperLinkField
                DataNavigateUrlFields="donorid"
                DataNavigateUrlFormatString="~/donation_list.aspx?did={0}"
                DataTextField="fullname"></asp:HyperLinkField>

        </Columns>
    </asp:GridView>
    <asp:SqlDataSource
        runat="server"
        ID="dsdDonorList"
        ConnectionString='<%$ ConnectionStrings:CS557_FA17_soaresa9ConnectionString %>'
        SelectCommand="select donor_lname+', '+donor_fname fullname, donorid from donor"></asp:SqlDataSource>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
</asp:Content>

