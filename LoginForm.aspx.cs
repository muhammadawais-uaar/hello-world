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
    public partial class LoginForm : System.Web.UI.Page
    {
        private string connectionString = ConfigurationManager.ConnectionStrings["myConnectionString"].ConnectionString;
        private SqlConnection con = null;
        private SqlCommand commandValidateEmail = null;
        private SqlCommand commandValidatePassword = null;
        private string validateEmailQuery = null;
        private string validatePasswordQuery = null;
        private int checkValidateEmail = 0;
        private int checkValidatePassword = 0;

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void cleartextBoxes()
        {
            txt_email.Text = null;
            txt_password.Text = null;
        }
        protected void btn_login_Click(object sender, EventArgs e)
        {
            try
            {
                using (con = new SqlConnection(connectionString))
                {
                    con.Open();
                    validateEmailQuery = "SELECT count(*) FROM tbl_user WHERE email='" + txt_email.Text + "'";
                    commandValidateEmail = new SqlCommand(validateEmailQuery, con);
                    checkValidateEmail = Convert.ToInt32(commandValidateEmail.ExecuteScalar().ToString());
                    if (checkValidateEmail > 0)
                    {
                        validatePasswordQuery = "SELECT count(*) FROM tbl_user WHERE password='" + txt_password.Text + "'";
                        commandValidatePassword = new SqlCommand(validatePasswordQuery, con);
                        checkValidatePassword = Convert.ToInt32(commandValidatePassword.ExecuteScalar().ToString());
                        if (checkValidatePassword > 0)
                        {
                            Session["NewUser"] = txt_email.Text;
                            Response.Redirect("HomePageForm.aspx");
                        }
                        else
                        {
                            ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('" + "Password you entered is incorrect!" + "');", true);
                        }
                    }
                    else
                    {
                        ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('" + "User does not exists." + "');", true);
                    }

                }
            }
            catch (Exception ee)
            {
                ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('" + ee + "');", true);
            }
            //finally
            //{
            //    con.Close();
            //}

        }
    }
}