using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CanteenManagementSystem.Admin
{
    public partial class CustomerStatus : System.Web.UI.Page
    {
        private string query;
        private string alert;

        protected void Page_Load(object sender, EventArgs e)
        {
            Response.Cache.SetNoStore();
            if (Session["email"] == null || !String.Equals(Session["role"], "Admin"))
            {
                Response.Redirect("~/"); // change this
            }
            if (!IsPostBack)
            {
                query = "SELECT * FROM [customerInfo]";
                gridViewBind(query);
            }
        }

        protected void gridViewBind(string query)
        {
            using (SqlConnection con = new SqlConnection("Data Source=DESKTOP-L96SFG5;Initial Catalog=Cms_AspForms;Integrated Security=True"))
            {
                try
                {
                    con.Open();
                    //SqlCommand cmd = new SqlCommand("SELECT Id,staffName,staffSurname,staffEmail,staffGender,staffPhoneNo,staffJoinDate,Role FROM [StaffInfo]", con); // Either use this but you can't get any other element wwhile using this
                    SqlCommand cmd = new SqlCommand(query, con); // while GridView customisation is better option
                    SqlDataReader dr = cmd.ExecuteReader();
                    if (dr.HasRows == true)
                    {
                        gvCustomerStatus.DataSource = dr;
                        gvCustomerStatus.DataBind();
                    }
                    else
                    {
                        displayAlertBox("No data available for given Name");
                        con.Close();
                    }
                }
                catch (System.IO.IOException exp)
                {
                    alert = "Error occured while connecting Database, Try again later : " + exp;
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
    }
}