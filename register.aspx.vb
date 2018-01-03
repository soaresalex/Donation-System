﻿
Partial Class register
    Inherits System.Web.UI.Page

    Private Sub register_Load(sender As Object, e As EventArgs) Handles Me.Load
        Me.Master.StatusLabel.Text = "You are trying to register"
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
