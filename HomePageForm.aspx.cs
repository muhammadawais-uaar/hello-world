using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

namespace webFormspractise
{
    public partial class HomePageForm : System.Web.UI.Page
    {
        private static string connectionString = ConfigurationManager.ConnectionStrings["myConnectionString"].ConnectionString;
        private SqlConnection con = new SqlConnection(connectionString);
        private SqlDataAdapter dataAdapter = null;
        private DataSet dataSet = null;
        private SqlCommand commandBindTable = null;
        private SqlCommand commandDelete = null;
        private SqlCommand commandUpdate = null;
        private string queryUpdate = null;
        private string queryDelete = null;
        private int checkDeletetion = 0;
        private int checkUpdation = 0;
        private SqlCommand commandValidateEmail = null;
        private string validateEmailQuery = null;
        private int checkValidateEmail = 0;


        protected void Page_Load(object sender, EventArgs e)
        {  
            //lbl_loginUser.Text ="Current Signed In User:  "+ Session["NewUser"].ToString();
            lbl_loginUser.Text = "pakarid@yahoo.com";
            if (IsPostBack)
            {
                Bind();
            }
        }

        protected void btn_signOut_Click(object sender, EventArgs e)
        {
            Session["NewUser"] = null;
            Response.Redirect("LoginForm.aspx");
                     
        }


        public void Bind()
        {
            commandBindTable = new SqlCommand("select * from tbl_user", con);
            dataAdapter = new SqlDataAdapter(commandBindTable);

            dataSet = new DataSet();
            dataAdapter.Fill(dataSet, "tbl_user");

            gv1.DataSource = dataSet;
            gv1.DataBind();
        }
        protected void gv1_RowEditing(object sender, GridViewEditEventArgs e)
        {
            gv1.EditIndex = e.NewEditIndex;
            Bind();
        }
        protected void gv1_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            int index = e.RowIndex;

            GridViewRow row = (GridViewRow)gv1.Rows[index];

            Label userId = (Label)row.FindControl("lbl_id");

            TextBox firstName = (TextBox)row.FindControl("txt_firstName");
            TextBox lastName = (TextBox)row.FindControl("txt_lastName");
            TextBox Email = (TextBox)row.FindControl("txt_email");
            TextBox Password = (TextBox)row.FindControl("txt_password");
            try
            {
                con.Open();

                validateEmailQuery = "SELECT count(*) FROM tbl_user WHERE email='" + Email.Text + "' and user_id!='" + userId.Text + "'";
                commandValidateEmail = new SqlCommand(validateEmailQuery, con);
                checkValidateEmail = Convert.ToInt32(commandValidateEmail.ExecuteScalar().ToString());
                if (checkValidateEmail > 0)
                {
                    Response.Write("<script>alert('This email is already used by some other user. Try another one!')</script>");
                }
                else {
                    queryUpdate = "update tbl_user set first_name ='" + firstName.Text + "', last_name ='" + lastName.Text + "', email ='" + Email.Text + "', password ='" + Password.Text + "' where user_id=" + Convert.ToInt32(userId.Text) + "";
                    commandUpdate = new SqlCommand(queryUpdate, con);
                    checkUpdation = commandUpdate.ExecuteNonQuery();
                    Response.Write("<script>alert('User updated successfully!')</script>");
                }
            }
            catch (Exception ee)
            {
                ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('" + ee + "');", true);
            }
            finally {
                con.Close();
            }
            //if (checkUpdation!=0)
            //{
            //    Response.Write("<script>alert('User updated successfully!')</script>");
            //}
            //else
            //{
            //    Response.Write("<script>alert('Error updating user!')</script>");
            //}
            gv1.EditIndex = -1;
            Bind();
        }
        protected void gv1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            gv1.EditIndex = -1;
            Bind();
        }
        protected void gv1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int index = e.RowIndex;

            GridViewRow row = (GridViewRow)gv1.Rows[index];

            Label userId = (Label)row.FindControl("lbl_id");

            try
            {
                con.Open();
                queryDelete = "delete from tbl_user where user_id=" + Convert.ToInt32(userId.Text) + "";
                commandDelete = new SqlCommand(queryDelete, con);
                checkDeletetion = commandDelete.ExecuteNonQuery();
            }
            catch (Exception ee)
            {
                ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('" + ee + "');", true);
            }
            finally {
                con.Close();
            }
            if (checkDeletetion !=0)
            {
                Response.Write("<script>alert('User deleted successfully!')</script>");
            }
            else {
                    Response.Write("<script>alert('Error deleting user!')</script>");
            }
        Bind();
        }
        protected void gv1_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gv1.PageIndex = e.NewPageIndex;
            Bind();
        }   
    
    }
}