using Microsoft.AspNet.Identity;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CanteenManagementSystem
{
    public partial class CustomerInfo : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            txtEmail.Text = Context.User.Identity.GetUserName();
            if ( !User.Identity.IsAuthenticated)
            {
                Response.Redirect("~/");
            }
            if ( !IsPostBack )
            {
                ViewState["PreviousPage"] = Request.UrlReferrer;
            }
            using (SqlConnection con = new SqlConnection("Data Source=DESKTOP-L96SFG5;Initial Catalog=Cms_AspForms;Integrated Security=True"))
            {
                try
                {
                    con.Open();
                    SqlCommand cmd = new SqlCommand("SELECT * FROM [customerInfo] WHERE userEmail = '" + txtEmail.Text + "'", con);
                    SqlDataAdapter sda = new SqlDataAdapter(cmd);
                    DataTable dt = new DataTable();
                    sda.Fill(dt);
                    if (dt.Rows.Count > 0)
                    {
                        SqlDataReader dr = cmd.ExecuteReader();
                        while( dr.Read() )
                        {
                            txtName.Text = dr["userName"].ToString();
                            txtName.ReadOnly = true;
                            txtSurname.Text = dr["userSurname"].ToString();
                            txtSurname.ReadOnly = true;
                            txtEmail.Text = Context.User.Identity.GetUserName();
                            ddlGender.SelectedItem.Value = dr["userGender"].ToString();
                            ddlGender.Enabled = false;
                            txtPhone.Text = dr["userPhoneNo"].ToString();
                            txtPhone.ReadOnly = true;
                            txtUsername.Text = dr["userUserName"].ToString();
                            txtUsername.ReadOnly = true;
                            ddlFrom.SelectedItem.Value = dr["userStream"].ToString();
                            ddlFrom.Enabled = false;
                            btnRegister.Enabled = false;
                            btnReset.Enabled = false;
                            btnBack.Enabled = true;
                        }
                    }
                }
                catch (System.IO.IOException exp)
                {
                    string alert = "Error occured while connecting Database, Try again later : " + exp;
                    displayAlertBox(alert);
                }
                finally
                {
                    con.Close();
                }
            }
            // code to check if user has already inputted data or not?
            // if yes display with all disable
            // else show this form
            // add this event or code to every page wether user has filled info or not
            // if yes than nothing else sent to this page
        }

        protected void btnReset_Click(object sender, EventArgs e) => resetValues();

        private void resetValues()
        {
            txtName.Text = txtPhone.Text = txtUsername.Text = txtSurname.Text = "";
            ddlGender.SelectedIndex = ddlFrom.SelectedIndex = -1;
        }

        protected void btnRegister_Click(object sender, EventArgs e)
        {
            using (SqlConnection con = new SqlConnection("Data Source=DESKTOP-L96SFG5;Initial Catalog=Cms_AspForms;Integrated Security=True"))
            {
                try
                {
                    string alertMsg;
                    con.Open();
                    SqlCommand cmd = new SqlCommand("INSERT INTO [customerInfo] VALUES ('" + txtName.Text + "','" + txtSurname.Text + "','" + txtEmail.Text + "','" + ddlGender.SelectedItem.Text + "','" + txtPhone.Text + "','" + txtUsername.Text + "','" + ddlFrom.SelectedValue.ToString() + "')", con);
                    int chck = cmd.ExecuteNonQuery();
                    if (chck != 0)
                    {
                        alertMsg = "Data inserted Successfully!";
                        con.Close();
                        displayAlertBox(alertMsg);
                        Response.Redirect("~/Menu.aspx");
                    }
                    else
                    {
                        alertMsg = "Something went Wrong! Please try again Later";
                        displayAlertBox(alertMsg);
                    }
                }
                catch (System.IO.IOException exp)
                {
                    string alert = "Error occured while connecting Database, Try again later : " + exp;
                    displayAlertBox(alert);
                    // Response.Redirect("Default.aspx");
                }
                finally
                {
                    con.Close();
                }
            }
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

        protected void btnBack_Click(object sender, EventArgs e)
        {
            if (ViewState["PreviousPage"] != null)  //Check if the ViewState, contains Previous page URL
            {
                Response.Redirect(ViewState["PreviousPage"].ToString());//Redirect to Previous page by retrieving the PreviousPage Url from ViewState.
            }
            else
            {
                Response.Redirect("~/");
            }
        }
    }
}