Imports System.Data.SqlClient
Partial Class AddDonor
    Inherits System.Web.UI.Page

    Private Sub btnAddDonor_Click(sender As Object, e As EventArgs) Handles btnAddDonor.Click
        Dim cmdAddDonor As New SqlCommand
        Dim condonor As New SqlConnection
        Dim strSQL As String
        Try
            condonor.ConnectionString = "Data Source=shucsd.sacredheart.edu\sql2012;Initial Catalog=CS557_FA17_soaresa9;User ID=CS557_FA17_soaresa9;Password=CS557_FA17_soaresa9"
            strSQL = "InsertUser"
            cmdAddDonor.CommandType = Data.CommandType.StoredProcedure
            cmdAddDonor.CommandText = strSQL
            cmdAddDonor.Parameters.Add("@donoruser", Data.SqlDbType.VarChar).Value = txtUsername.Text
            cmdAddDonor.Parameters.Add("@donorpwd", Data.SqlDbType.VarChar).Value = txtPassword.Text
            cmdAddDonor.Parameters.Add("@donorlevel", Data.SqlDbType.Int).Value = ddlLevel.SelectedValue
            cmdAddDonor.Parameters.Add("@donorlname", Data.SqlDbType.VarChar).Value = txtLastName.Text
            cmdAddDonor.Parameters.Add("@donorfname", Data.SqlDbType.VarChar).Value = txtFirstName.Text
            cmdAddDonor.Parameters.Add("@affiliation", Data.SqlDbType.VarChar).Value = ddlAffiliation.SelectedValue

            condonor.Open()
            cmdAddDonor.Connection = condonor
            lblError.Text = cmdAddDonor.ExecuteNonQuery().ToString & " records added!"
            condonor.Close()
            txtUsername.Text = ""
            txtPassword.Text = ""
            txtLastName.Text = ""
            txtFirstName.Text = ""
            ddlLevel.SelectedIndex = -1
            ddlAffiliation.SelectedIndex = -1

        Catch ex As Exception
            lblError.Text = ex.Message
        End Try

    End Sub

    Private Sub AddDonor_Load(sender As Object, e As EventArgs) Handles Me.Load
        Try
            If Session("user") = "" Then
                Response.Redirect("first_login.aspx")
            Else
                If Session("level") = 1 Then
                    Me.Master.AdminMenu = True
                    Me.Master.UserMenu = False
                Else
                    Me.Master.AdminMenu = False
                    Me.Master.UserMenu = True
                End If
            End If
        Catch ex As Exception
            Me.Master.StatusLabel.Text = ex.Message
        End Try
    End Sub
End Class
