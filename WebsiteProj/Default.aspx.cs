using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Data.Sql;

public partial class _Default : System.Web.UI.Page
{
    string connString = ConfigurationManager.ConnectionStrings["personTableConnectionString"].ToString();

    protected void btnCalender_Click(object sender, EventArgs e)
    {
        SqlConnection conn = new SqlConnection(connString);
        SqlCommand comm = new SqlCommand("ProcInsert", conn);

        comm.CommandType = CommandType.StoredProcedure;
        comm.Parameters.AddWithValue("@Name", txtName.Text);
        comm.Parameters.AddWithValue("@EMail", txtEmail.Text);
        comm.Parameters.AddWithValue("@DateAdded", Calendar1.SelectedDate);

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

    }
}