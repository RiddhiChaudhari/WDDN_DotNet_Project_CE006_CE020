using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CanteenManagementSystem.Staff
{
    public partial class ChangePassword : System.Web.UI.Page
    {
        private object email;
        private object userId;
        private string cryptPassword;
        private string alert;

        protected void Page_Load(object sender, EventArgs e)
        {
            Response.Cache.SetNoStore();
            if (Session["email"] == null || !String.Equals(Session["role"], "Staff"))
            {
                Response.Redirect("~/"); // change this
            }
            email = Session["email"];
            userId = Session["userID"];
        }

        protected void btnUpdatePassword_Click(object sender, EventArgs e)
        {
            using (SqlConnection con = new SqlConnection("Data Source=DESKTOP-L96SFG5;Initial Catalog=Cms_AspForms;Integrated Security=True"))
            {
                try
                {
                    if (isPasswordValid())
                    {
                        con.Open();
                        cryptPassword = encryptString(txtNEWPassword.Text);
                        SqlCommand cmd = new SqlCommand("UPDATE [staffInfo] SET staffPassword='" + cryptPassword + "'WHERE Id='" + userId + "'", con);
                        int chck = cmd.ExecuteNonQuery();
                        if (chck != 0)
                        {
                            alert = "Password has been Updated";
                            displayAlertBox(alert);
                        }
                    }
                    else
                    {
                        alert = "Wrong Input Password";
                        displayAlertBox(alert);
                    }
                }
                catch (System.IO.IOException exp)
                {
                    alert = "Error occured while connecting Database, Try again later : " + exp;
                    displayAlertBox(alert);
                }
                finally
                {
                    con.Close();
                }
            }
        }

        private bool isPasswordValid()
        {
            using (SqlConnection con = new SqlConnection("Data Source=DESKTOP-L96SFG5;Initial Catalog=Cms_AspForms;Integrated Security=True"))
            {
                try
                {
                    con.Open();
                    cryptPassword = encryptString(txtOldPassword.Text);
                    SqlCommand cmd = new SqlCommand("SELECT * FROM [staffInfo] WHERE staffEmail='" + email + "' AND staffPassword = '" + cryptPassword + "'", con);
                    SqlDataReader dr = cmd.ExecuteReader();
                    if (dr.HasRows == true)
                    {
                        return true;
                    }
                    else
                    {
                        return false;
                    }
                }
                catch (System.IO.IOException exp)
                {
                    string alert = "Error occured while connecting Database, Try again later : " + exp;
                    displayAlertBox(alert);
                    return false;
                }
            }
        }

        private string encryptString(string password)
        {
            string msg = "";
            byte[] encode = new byte[password.Length];
            encode = Encoding.UTF8.GetBytes(password);
            msg = Convert.ToBase64String(encode);
            return msg;
        }

        private void displayAlertBox(string message)
        {
            StringBuilder sb = new StringBuilder();
            sb.Append("<script type = 'text/javascript'>");
            sb.Append("window.onload = function(){");
            sb.Append("alert('");
            sb.Append(message);
            sb.Append("')};");
            sb.Append("</script>");
            ClientScript.RegisterClientScriptBlock(this.GetType(), "alert", sb.ToString());
        }

        protected void btnReset_Click(object sender, EventArgs e) => resetValues();

        private void resetValues()
        {
            txtNEWPassword.Text = txtOldPassword.Text = txtNewConfPassword.Text = "";
        }
    }
}