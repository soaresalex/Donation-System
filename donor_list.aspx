<%@ Page Title="" Language="VB" MasterPageFile="~/Donation.master" AutoEventWireup="false" CodeFile="donor_list.aspx.vb" Inherits="donor_list" %>

<%@ MasterType VirtualPath="~/donation.master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphMain" runat="Server">
    <asp:Label ID="lblAffiliation" runat="server" Text="Please select a donor group:" Font-Size="Large" />
    <asp:DropDownList
        ID="ddlAffiliation"
        runat="server"
        AutoPostBack="true"
        DataSourceID="sdsAffiliation"
        DataTextField="affiliation_desc"
        DataValueField="affiliation">
    </asp:DropDownList>
    <asp:SqlDataSource
        runat="server"
        ID="sdsAffiliation"
        ConnectionString='<%$ ConnectionStrings:CS557_FA17_soaresa9ConnectionString %>'
        SelectCommand="SELECT [affiliation], [affiliation_desc] FROM [affiliation_code]"></asp:SqlDataSource>
    <br />
    <br />
    <br />
    <asp:DataList ID="dtlDonors" runat="server" DataKeyField="donorid" DataSourceID="sdsDonors" AlternatingItemStyle-BackColor="#E0E0E0">
<AlternatingItemStyle BackColor="#E0E0E0"></AlternatingItemStyle>
        <AlternatingItemTemplate>
            <asp:Label ID="Label1" runat="server" Text='<%# Eval("donorid") %>'></asp:Label>
            <asp:Label ID="Label2" runat="server" Text='<%# Eval("donor_lname") %>'></asp:Label>
            <asp:Label ID="Label3" runat="server" Text='<%# Eval("donor_fname") %>'></asp:Label>
        </AlternatingItemTemplate>
        <ItemTemplate>
            donorid:
            <asp:Label Text='<%# Eval("donorid") %>' runat="server" ID="donoridLabel" /><br />
            donor_lname:
            <asp:Label Text='<%# Eval("donor_lname") %>' runat="server" ID="donor_lnameLabel" /><br />
            donor_fname:
            <asp:Label Text='<%# Eval("donor_fname") %>' runat="server" ID="donor_fnameLabel" /><br />
            <br />
        </ItemTemplate>
        <SeparatorTemplate>
            &lt;hr&gt;
        </SeparatorTemplate>
    </asp:DataList>
    <asp:SqlDataSource
        runat="server"
        ID="sdsDonors"
        ConnectionString='<%$ ConnectionStrings:CS557_FA17_soaresa9ConnectionString %>'
        SelectCommand="SELECT [donorid], [donor_lname], [donor_fname] FROM [donor] WHERE ([affiliation] = @affiliation)">
        <SelectParameters>
            <asp:ControlParameter
                ControlID="ddlAffiliation"
                PropertyName="SelectedValue"
                Name="affiliation"
                Type="String"></asp:ControlParameter>
        </SelectParameters>
    </asp:SqlDataSource>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
</asp:Content>

