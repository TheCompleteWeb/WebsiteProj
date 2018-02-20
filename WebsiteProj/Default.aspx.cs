﻿using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

public partial class _Default : System.Web.UI.Page
{
    string connString = ConfigurationManager.ConnectionStrings["personTableConnectionString"].ToString();

    protected void btnCalender_Click(object sender, EventArgs e)
    {
        SqlConnection conn = new SqlConnection(connString);
        SqlCommand comm = new SqlCommand("InsertProc", conn);

        comm.CommandType = CommandType.StoredProcedure;
        comm.Parameters.AddWithValue("@Name", txtName.Text);
        comm.Parameters.AddWithValue("@EMail", txtEmail.Text);
        comm.Parameters.AddWithValue("@DateSaved", Calendar1.SelectedDate);

        try
        {
            conn.Open();
            comm.ExecuteNonQuery();
        }
        catch(Exception ex)
        {
            lblError.Text = ex.Message;
        }
        finally
        {
            conn.Close();
        }
        GridView1.DataBind();
    }

    protected void Calendar1_SelectionChanged(object sender, EventArgs e)
    {
        txtDate.Text = Calendar1.SelectedDate.ToShortDateString();
    }

    protected void CheckBox1_CheckedChanged(object sender, EventArgs e)
    {
        if (CheckBox1.Checked)
        {
            Calendar1.Visible = true;
            CheckBox1.Text = "Uncheck to insert data and hide";
        }
        else
        {
            Calendar1.Visible = false;
            CheckBox1.Text = "Check to show calender";
        }
    }
}