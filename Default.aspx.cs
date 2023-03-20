using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
//
using System.Data;


public partial class _Default : Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
	public void cleartextboxes()
	{
		txtroll.Text = "";
		txtname.Text = "";
		txtfees.Text = "";
		txtclass.Text = "";
		txtemail.Text = "";
	}
	protected void Btn_add_Click(object sender, EventArgs e)
	{
	SqlConnection con = new SqlConnection( 
        @"Data Source=SACH-IN\SQLEXPRESS;Initial Catalog=dbcruds;Integrated Security=True");
	int rollx=int.Parse(txtroll.Text.ToString());
	string namex=txtname.Text.ToString();
	string classx=txtclass.Text.ToString();
	float feesx=float.Parse(txtfees.Text.ToString());
	string emailx=txtemail.Text.ToString();

		SqlCommand cmd = new SqlCommand("sp_stud_master_CRUD", con);
		cmd.CommandType = CommandType.StoredProcedure;
		cmd.Parameters.AddWithValue("@event_flag", "INSERT");
		cmd.Parameters.AddWithValue("@roll", rollx);
		cmd.Parameters.AddWithValue("@name", namex);
		cmd.Parameters.AddWithValue("@class", classx);
		cmd.Parameters.AddWithValue("@fees", feesx);
		cmd.Parameters.AddWithValue("@email", emailx);

		// Execute the SQL command
		con.Open();
		cmd.ExecuteNonQuery();
		con.Close();
		Response.Write("<script>alert('data saved successfully !!!');</script>");
		cleartextboxes();
		GridView1.DataBind();
	}

	protected void button_edit_Click(object sender, EventArgs e)
	{
		SqlConnection con = new SqlConnection(
		@"Data Source=SACH-IN\SQLEXPRESS;Initial Catalog=dbcruds;Integrated Security=True");
		int rollx = int.Parse(txtroll.Text.ToString());
		string namex = txtname.Text.ToString();
		string classx = txtclass.Text.ToString();
		float feesx = float.Parse(txtfees.Text.ToString());
		string emailx = txtemail.Text.ToString();

		SqlCommand cmd = new SqlCommand("sp_stud_master_CRUD", con);
		cmd.CommandType = CommandType.StoredProcedure;
		cmd.Parameters.AddWithValue("@event_flag", "UPDATE");
		cmd.Parameters.AddWithValue("@roll", rollx);
		cmd.Parameters.AddWithValue("@name", namex);
		cmd.Parameters.AddWithValue("@class", classx);
		cmd.Parameters.AddWithValue("@fees", feesx);
		cmd.Parameters.AddWithValue("@email", emailx);

		// Execute the SQL command
		con.Open();
		cmd.ExecuteNonQuery();
		con.Close();
		Response.Write("<script>alert('data UPDATED successfully !!!');</script>");


		cleartextboxes();
		GridView1.DataBind();

	}

	protected void Btn_delete_Click(object sender, EventArgs e)
	{
		SqlConnection con = new SqlConnection(
@"Data Source=SACH-IN\SQLEXPRESS;Initial Catalog=dbcruds;Integrated Security=True");
		int rollx = int.Parse(txtroll.Text.ToString());
		SqlCommand cmd = new SqlCommand("sp_stud_master_CRUD", con);
		cmd.CommandType = CommandType.StoredProcedure;
		cmd.Parameters.AddWithValue("@event_flag", "DELETE");
		cmd.Parameters.AddWithValue("@roll", rollx);
		// Execute the SQL command
		con.Open();
		cmd.ExecuteNonQuery();
		con.Close();
		Response.Write("<script>alert('data DELETED successfully !!!');</script>");

		cleartextboxes();
		GridView1.DataBind();
	}

	protected void Btn_find_Click(object sender, EventArgs e)
	{
		SqlConnection con = new SqlConnection(
@"Data Source=SACH-IN\SQLEXPRESS;Initial Catalog=dbcruds;Integrated Security=True");
		int rollx = int.Parse(txtroll.Text.ToString());
		SqlCommand cmd = new SqlCommand("sp_stud_master_CRUD", con);
		cmd.CommandType = CommandType.StoredProcedure;
		cmd.Parameters.AddWithValue("@event_flag", "SELECT");
		cmd.Parameters.AddWithValue("@roll", rollx);
		// Execute the SQL command and get the data
		con.Open();
		SqlDataReader reader = cmd.ExecuteReader();
		if (reader.Read())
		{
			//while (reader.Read())   //one time only no need loop to populate textboxes  need  ,loop for gridview
			//{

				// Do something with the data
				txtname.Text = reader["name"].ToString();
				txtclass.Text = reader["class"].ToString();
				txtfees.Text = reader["fees"].ToString();
				txtemail.Text = reader["email"].ToString();





			//}

		}
		else
		{

			Response.Write("<script>alert('not found x !!!');</script>");
		}

		reader.Close();
		con.Close();
	}

	protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
	{

		txtroll.Text = GridView1.SelectedRow.Cells[1].Text;
		txtname.Text = GridView1.SelectedRow.Cells[2].Text;
		txtclass.Text = GridView1.SelectedRow.Cells[3].Text;
		txtfees.Text = GridView1.SelectedRow.Cells[4].Text;
		txtemail.Text = GridView1.SelectedRow.Cells[5].Text;

	}
}