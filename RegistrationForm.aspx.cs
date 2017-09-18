using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace webFormspractise
{
    public partial class RegistraionForm : System.Web.UI.Page
    {
        private string connectionString = ConfigurationManager.ConnectionStrings["myConnectionString"].ConnectionString;
        private SqlConnection con = null;
        private SqlCommand commandValidation = null;
        private SqlCommand commandRegistraion = null;
        private string validationQuery = null;
        private string registraionQuery = null;
        private int checkValidation = 0;
        private int checkRegistration = 0;
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void cleartextBoxes()
        {
            txt_firstName.Text = null;
            txt_lastName.Text = null;
            txt_email.Text = null;
            txt_password.Text = null;
            txt_confrimPassword.Text = null;
        }
      
        protected void btn_signUp_Click(object sender, EventArgs e)
        {
            try
            {
                using (con = new SqlConnection(connectionString))
                {
                    con.Open();
                    validationQuery = "SELECT count(*) FROM tbl_user WHERE email='" + txt_email.Text + "'";
                    commandValidation = new SqlCommand(validationQuery, con);
                    checkValidation = Convert.ToInt32(commandValidation.ExecuteScalar().ToString());

                    if (checkValidation > 0 )
                    {
                        ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('" + "A user against this Email is already registered. Please try another one." + "');", true);
                    }
                    else
                    {
                        registraionQuery = "INSERT into tbl_user(first_name ,last_name ,email ,password) values ('" + txt_firstName.Text + "','" + txt_lastName.Text + "','" + txt_email.Text + "','" + txt_password.Text + "')";
                        commandRegistraion = new SqlCommand(registraionQuery, con);
                        checkRegistration = commandRegistraion.ExecuteNonQuery();
                    }
                    if (checkRegistration != 0)
                    {
                        ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('" + "User registered successfully!" + "');", true);
                        cleartextBoxes();
                    }
                    else
                    {
                        ClientScript.RegisterStartupScript(this.GetType(), "myalert", "alert('" + "Error registering user." + "');", true);
                        //Response.Write("<script LANGUAGE='JavaScript' >alert('Login Successful')</script>");
                        //Response.Write("<script>alert('login succsesful')</script>");

                    }


                    //command = new SqlCommand("spRegisterUser", con);
                    //command.CommandType = CommandType.StoredProcedure;

                    //SqlParameter paramfirstName = new SqlParameter();
                    //paramfirstName.ParameterName = "@First_name";
                    //paramfirstName.Value = txt_firstName.Text.ToString();
                    //command.Parameters.Add(paramfirstName);

                    //SqlParameter paramlastName = new SqlParameter();
                    //paramlastName.ParameterName = "@Last_name";
                    //paramlastName.Value = txt_lastName.Text.ToString();
                    //command.Parameters.Add(paramlastName);

                    //SqlParameter paramemail = new SqlParameter();
                    //paramemail.ParameterName = "@Email";
                    //paramemail.Value = txt_email.Text.ToString();
                    //command.Parameters.Add(paramemail);

                    //SqlParameter parampassword = new SqlParameter();
                    //parampassword.ParameterName = "@Password";
                    //parampassword.Value = txt_password.Text.ToString();
                    //command.Parameters.Add(parampassword);
                    //con.Open();
                    //command.ExecuteNonQuery();
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