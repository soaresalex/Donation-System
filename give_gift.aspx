<%@ Page Title="" Language="VB" MasterPageFile="~/Donation.master" AutoEventWireup="false" CodeFile="give_gift.aspx.vb" Inherits="give_gift" %>

<%@ MasterType VirtualPath="~/donation.master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphMain" Runat="Server">
    <asp:FormView ID="FormView1" runat="server" DataSourceID="SqlDataSource1" AllowPaging="true" DefaultMode="Insert">
        <EditItemTemplate>
            giftdate:
            <asp:TextBox Text='<%# Bind("giftdate") %>' runat="server" ID="txtGiftDate" /><br />
            giftamount:
            <asp:TextBox Text='<%# Bind("giftamount") %>' runat="server" ID="txtGiftAmount" /><br />
            cid:
            <asp:TextBox Text='<%# Bind("cid") %>' runat="server" ID="cidTextBox" /><br />
            campaignname:
            <asp:TextBox Text='<%# Bind("campaignname") %>' runat="server" ID="campaignnameTextBox" /><br />
            <asp:LinkButton runat="server" Text="Update" CommandName="Update" ID="UpdateButton" CausesValidation="True" />&nbsp;<asp:LinkButton runat="server" Text="Cancel" CommandName="Cancel" ID="UpdateCancelButton" CausesValidation="False" />
        </EditItemTemplate>
        <InsertItemTemplate>
            giftdate:
            <asp:TextBox Text='<%# Bind("giftdate") %>' runat="server" ID="txtGiftDate" /><br />
            giftamount:
            <asp:TextBox Text='<%# Bind("giftamount") %>' runat="server" ID="txtGiftAmount" /><br />
            campaignname:
            <br />
            <asp:DropDownList ID="ddlCampaign" runat="server" DataSourceID="sdsCamps" DataTextField="campaignname" DataValueField="campaignid"></asp:DropDownList>
            <asp:SqlDataSource runat="server" ID="sdsCamps" ConnectionString='<%$ ConnectionStrings:CS557_FA17_soaresa9ConnectionString %>' SelectCommand="SELECT [campaignid], [campaignname] FROM [campaign]" InsertCommand="insert into donorgift (giftamount, giftdate, cid, did) values (@amount, @date, @cid, @did)">
                <InsertParameters>
                    <asp:Parameter Name="amount"></asp:Parameter>
                    <asp:Parameter Name="date"></asp:Parameter>
                    <asp:Parameter Name="cid"></asp:Parameter>
                    <asp:Parameter Name="did"></asp:Parameter>
                </InsertParameters>
            </asp:SqlDataSource>
            <asp:LinkButton runat="server" Text="Insert" CommandName="Insert" ID="InsertButton" CausesValidation="True" OnClick="InsertButton_Click" />&nbsp;<asp:LinkButton runat="server" Text="Cancel" CommandName="Cancel" ID="InsertCancelButton" CausesValidation="False" />
        </InsertItemTemplate>
        <ItemTemplate>
            giftdate:
            <asp:Label Text='<%# Bind("giftdate") %>' runat="server" ID="txtGiftDate" /><br />
            giftamount:
            <asp:Label Text='<%# Bind("giftamount") %>' runat="server" ID="txtGiftAmount" /><br />
            cid:
            <asp:Label Text='<%# Bind("cid") %>' runat="server" ID="cidLabel" /><br />
            campaignname:
            <asp:Label Text='<%# Bind("campaignname") %>' runat="server" ID="campaignnameLabel" /><br />

        </ItemTemplate>
    </asp:FormView>
    <asp:SqlDataSource runat="server" ID="SqlDataSource1" ConnectionString='<%$ ConnectionStrings:CS557_FA17_soaresa9ConnectionString %>' SelectCommand="select giftdate,giftamount,cid,campaignname from donorgift join campaign on campaignid=cid where did = @did">
        <SelectParameters>
            <asp:SessionParameter SessionField="did" DefaultValue="did" Name="did"></asp:SessionParameter>
        </SelectParameters>
    </asp:SqlDataSource>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
</asp:Content>

