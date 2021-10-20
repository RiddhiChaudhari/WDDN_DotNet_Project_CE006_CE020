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
    public partial class Menu : System.Web.UI.Page
    {
        private string alert;
        private string query;

        protected void Page_Load(object sender, EventArgs e)
        {
            if ( !IsPostBack )
            {
                ViewState["PreviousPage"] = Request.UrlReferrer;
                query = "SELECT * FROM [menuInfo] WHERE menuAvailbility= 'yes'";
                bindDataList();
            }
            using (SqlConnection con = new SqlConnection("Data Source=DESKTOP-L96SFG5;Initial Catalog=Cms_AspForms;Integrated Security=True"))
            {
                try
                {
                    con.Open();
                    SqlCommand cmd = new SqlCommand("SELECT * FROM [customerInfo] WHERE userEmail = '" + Context.User.Identity.GetUserName() + "'", con);
                    SqlDataAdapter sda = new SqlDataAdapter(cmd);
                    DataTable dt = new DataTable();
                    sda.Fill(dt);
                    if (dt.Rows.Count == 0)
                    {
                        // displayAlertBox(Context.User.Identity.GetUserName() + " - You have not filled data please fill it");
                        Response.Redirect("~/CustomerInfo.aspx");
                    }
                    else
                    {
                        SqlDataReader dr = cmd.ExecuteReader();
                        while (dr.Read())
                        {
                            Session["CustomerUserId"] = dr["Id"].ToString();
                            Session["CustomerUserName"] = dr["userName"].ToString();
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
        }

        private void bindDataList()
        {
            using (SqlConnection con = new SqlConnection("Data Source=DESKTOP-L96SFG5;Initial Catalog=Cms_AspForms;Integrated Security=True"))
            {
                try
                {
                    con.Open();
                    //SqlCommand cmd = new SqlCommand("SELECT Id,staffName,staffSurname,staffEmail,staffGender,staffPhoneNo,staffJoinDate,Role FROM [StaffInfo]", con); // Either use this but you can't get any other element wwhile using this
                    SqlCommand cmd = new SqlCommand(query, con);
                    SqlDataReader dr = cmd.ExecuteReader();
                    if (dr.HasRows == true)
                    {
                        dlShowMenu.DataSource = dr;
                        dlShowMenu.DataBind();
                        con.Close();
                    }
                    else
                    {
                        displayAlertBox("Oops!!! No menu Available on given Name.");
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

        protected void btnSelectCousines_Click(object sender, EventArgs e)
        {
            query = "SELECT * FROM [MenuInfo] WHERE menuCousines='" + ddlSelectCousines.SelectedValue.ToString() + "' AND menuAvailbility= 'yes'";
            ddlSelectType.SelectedIndex = -1;
            txtSearchMenu.Text = "";
            bindDataList();
        }

        protected void btnSelectType_Click(object sender, EventArgs e)
        {
            query = "SELECT * FROM [MenuInfo] WHERE menuType='" + ddlSelectType.SelectedValue.ToString() + "' AND menuAvailbility= 'yes'";
            ddlSelectCousines.SelectedIndex = -1;
            txtSearchMenu.Text = "";
            bindDataList();
        }

        protected void srchSearchMenu_Click(object sender, EventArgs e)
        {
            if (string.IsNullOrEmpty(txtSearchMenu.Text))
            {
                query = "SELECT * FROM [MenuInfo]";
            }
            else
            {
                query = "SELECT * FROM [MenuInfo] WHERE menuName LIKE '%" + txtSearchMenu.Text + "%' AND menuAvailbility= 'yes'";
                ddlSelectType.SelectedIndex = -1;
                ddlSelectCousines.SelectedIndex = -1;
            }
            bindDataList();
        }
    }
}