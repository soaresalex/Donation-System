
Partial Class Donation
    Inherits System.Web.UI.MasterPage
    Public Property StatusLabel() As Label
        Get
            Return lblStatus
        End Get
        Set(ByVal value As Label)
            lblStatus = value
        End Set
    End Property

    Private Sub Donation_Load(sender As Object, e As EventArgs) Handles Me.Load
        Dim iDaysUntil As Integer = DaysUntilFoundersDay()
        If iDaysUntil = 0 Then
            lblMessage.Text = "Happy Founder's Day!"
        ElseIf iDaysUntil = 1 Then
            lblMessage.Text = "Tomorrow is Founder's Day!"
        Else
            lblMessage.Text = "There are only " & iDaysUntil _
                & " days left until Founder's Day!"
        End If
    End Sub

    Private Sub btnLogout_Click(sender As Object, e As EventArgs) Handles btnLogout.Click
        Session.RemoveAll()
        Response.Redirect("first_login.aspx")
    End Sub

    Private Function DaysUntilFoundersDay() As Integer
        Dim dtmFoundersDay As Date = New DateTime(DateTime.Today.Year, 3, 19)
        If DateTime.Today > dtmFoundersDay Then
            dtmFoundersDay = dtmFoundersDay.AddYears(1)
        End If
        Dim tsTimeUntil As TimeSpan = dtmFoundersDay - DateTime.Today
        Return tsTimeUntil.Days
    End Function

    Public WriteOnly Property AdminMenu() As Boolean
        Set(ByVal value As Boolean)
            mnuAdmin.Visible = value
        End Set
    End Property

    Public WriteOnly Property UserMenu() As Boolean
        Set(ByVal value As Boolean)
            mnuUser.Visible = value
        End Set
    End Property

End Class

