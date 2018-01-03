Imports System.Data.SqlClient
Partial Class first_login
    Inherits System.Web.UI.Page

    Private Sub btnRegister_Click(sender As Object, e As EventArgs) Handles btnRegister.Click
        Response.Redirect("~/register.aspx")
    End Sub

    Private Sub btnLogin_Click(sender As Object, e As EventArgs) Handles btnLogin.Click
        Dim conDonor As New SqlConnection
        Dim cmdUser As New SqlCommand
        Dim strSQL As String
        Dim dtrUser As SqlDataReader

        Try
            conDonor.ConnectionString = "Data Source=shucsd.sacredheart.edu\sql2012;Initial Catalog=CS557_FA17_soaresa9;User ID=CS557_FA17_soaresa9;Password=CS557_FA17_soaresa9"
            strSQL = "select * from donor_user where donorname=@user and donorpassword=@pwd"
            cmdUser.CommandType = Data.CommandType.Text
            cmdUser.CommandText = strSQL
            cmdUser.Parameters.Add("@user", Data.SqlDbType.VarChar).Value = txtUsername.Text
            cmdUser.Parameters.Add("@pwd", Data.SqlDbType.VarChar).Value = txtPassword.Text

            conDonor.Open()
            cmdUser.Connection = conDonor
            dtrUser = cmdUser.ExecuteReader()
            If dtrUser.HasRows Then
                dtrUser.Read()
                Session("user") = dtrUser("donorname")
                Session("level") = dtrUser("donorlevel")
                Session("did") = dtrUser("donorid_fk")
                Response.Redirect("default.aspx")
            Else
                Me.Master.StatusLabel.Text = "Not a user"
            End If
            dtrUser.Close()
            conDonor.Close()

        Catch ex As Exception
            Me.Master.StatusLabel.Text = ex.Message
        End Try


    End Sub
End Class
