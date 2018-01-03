
Partial Class campaigns
    Inherits System.Web.UI.Page

    Private Sub btnAddCampaign_Click(sender As Object, e As EventArgs) Handles btnAddCampaign.Click
        sdsCampaign.InsertParameters("campaignname").DefaultValue = txtCampaign.Text
        sdsCampaign.InsertParameters("goal").DefaultValue = txtGoal.Text
        sdsCampaign.InsertParameters("startdate").DefaultValue = txtStart.Text
        sdsCampaign.InsertParameters("enddate").DefaultValue = txtEnd.Text

        Try
            sdsCampaign.Insert()
            txtCampaign.Text = ""
            txtGoal.Text = ""
            txtEnd.Text = ""
            txtStart.Text = ""

        Catch ex As Exception
            lblError.Text = ex.Message
        End Try
    End Sub

    Private Sub dgvCampaign_RowUpdated(sender As Object, e As GridViewUpdatedEventArgs) Handles dgvCampaign.RowUpdated
        If e.Exception IsNot Nothing Then
            lblError.Text = e.Exception.Message
            e.ExceptionHandled = True
            e.KeepInEditMode = True
        End If
    End Sub

    Private Sub campaigns_Load(sender As Object, e As EventArgs) Handles Me.Load
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
