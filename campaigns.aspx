<%@ Page Title="" Language="VB" MasterPageFile="~/Donation.master" AutoEventWireup="false" CodeFile="campaigns.aspx.vb" Inherits="campaigns" %>

<%@ MasterType VirtualPath="~/donation.master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphMain" runat="Server">
    <asp:GridView
        ID="dgvCampaign"
        runat="server"
        AutoGenerateColumns="False"
        DataKeyNames="campaignid"
        DataSourceID="sdsCampaign"
        AllowPaging="true"
        AllowSorting="true"
        AlternatingRowStyle-BackColor="Silver">
        <Columns>
            <asp:BoundField DataField="campaignname" HeaderText="Name" SortExpression="campaignname"></asp:BoundField>
            <asp:BoundField DataField="goal" HeaderText="Goal" SortExpression="goal" DataFormatString="{0:c}"></asp:BoundField>
            <asp:BoundField DataField="startdate" HeaderText="Start Date" SortExpression="startdate"></asp:BoundField>
            <asp:BoundField DataField="enddate" HeaderText="End Date" SortExpression="enddate"></asp:BoundField>
            <asp:CommandField ShowEditButton="True" ButtonType="Button"></asp:CommandField>
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource
        runat="server"
        ID="sdsCampaign"
        ConnectionString='<%$ ConnectionStrings:CS557_FA17_soaresa9ConnectionString %>'
        SelectCommand="SELECT * FROM [campaign]" DeleteCommand="DELETE FROM [campaign] WHERE [campaignid] = @campaignid" InsertCommand="INSERT INTO [campaign] ([campaignname], [goal], [startdate], [enddate]) VALUES (@campaignname, @goal, @startdate, @enddate)" UpdateCommand="UPDATE [campaign] SET [campaignname] = @campaignname, [goal] = @goal, [startdate] = @startdate, [enddate] = @enddate WHERE [campaignid] = @campaignid">
        <DeleteParameters>
            <asp:Parameter Name="campaignid" Type="Int32"></asp:Parameter>
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="campaignname" Type="String"></asp:Parameter>
            <asp:Parameter Name="goal" Type="Int32"></asp:Parameter>
            <asp:Parameter Name="startdate" Type="DateTime"></asp:Parameter>
            <asp:Parameter Name="enddate" Type="DateTime"></asp:Parameter>
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="campaignname" Type="String"></asp:Parameter>
            <asp:Parameter Name="goal" Type="Int32"></asp:Parameter>
            <asp:Parameter Name="startdate" Type="DateTime"></asp:Parameter>
            <asp:Parameter Name="enddate" Type="DateTime"></asp:Parameter>
            <asp:Parameter Name="campaignid" Type="Int32"></asp:Parameter>
        </UpdateParameters>
    </asp:SqlDataSource>
    <br />
    <br />
    To create a new campaign, enter the information and click Add New Campaign.
    <br />
    <br />
    Campaign Name <asp:TextBox ID="txtCampaign" runat="server" Text="" /><br />
    Goal <asp:TextBox ID="txtGoal" runat="server" Text="" /><br />
    Start <asp:TextBox ID="txtStart" runat="server" Text="" /><br />
    End <asp:TextBox ID="txtEnd" runat="server" Text="" /><br />
    <asp:Button ID="btnAddCampaign" runat="server" Text="Add New Campaign" /><br />
    <asp:Label ID="lblError" runat="server" Text="" />
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
</asp:Content>

