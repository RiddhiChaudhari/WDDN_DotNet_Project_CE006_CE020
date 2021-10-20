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
    public partial class UpdateMenu : System.Web.UI.Page
    {
        private int id;
        private string query;
        private string alert;

        protected void Page_Load(object sender, EventArgs e)
        {
            Response.Cache.SetNoStore();
            if (Session["email"] == null || !String.Equals(Session["role"], "Staff"))
            {
                Response.Redirect("~/"); // change this
            }
            if (!Request.QueryString.AllKeys.Contains("Id"))
            {
                Response.Redirect("~/Staff/MenuList.aspx");
            }
            id = Convert.ToInt32(Request.QueryString["Id"]);
            if (!IsPostBack)
            {
                query = "SELECT * FROM [menuInfo] WHERE Id='" + id + "'";
                using (SqlConnection con = new SqlConnection("Data Source=DESKTOP-L96SFG5;Initial Catalog=Cms_AspForms;Integrated Security=True"))
                {
                    try
                    {
                        con.Open();
                        SqlCommand cmd = new SqlCommand(query, con);
                        SqlDataReader dr = cmd.ExecuteReader();
                        while (dr.Read())
                        {
                            txtId.Text = Convert.ToString(id);
                            txtMenuName.Text = dr["menuName"].ToString();
                            txtMenuPrice.Text = dr["menuPrice"].ToString();
                            txtMenuCousines.Text = dr["menuCousines"].ToString();
                            txtMenuType.Text = dr["menuType"].ToString();
                            mImage.ImageUrl = dr["menuImage"].ToString();
                        }
                    }
                    catch (System.IO.IOException exp)
                    {
                        alert = "Error occured while connecting Database, Try again later : " + exp;
                        Label1.Text = alert;
                        displayAlertBox(alert);
                    }
                }
            }
        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            using (SqlConnection con = new SqlConnection("Data Source=DESKTOP-L96SFG5;Initial Catalog=Cms_AspForms;Integrated Security=True"))
            {
                try
                {
                    con.Open();
                    string menuImagePath = mImage.ImageUrl;
                    if ( menuImage.HasFile )
                    {
                        string staffImageName = menuImage.PostedFile.FileName;
                        menuImagePath = "~/Images/Menu/" + staffImageName;
                        menuImage.PostedFile.SaveAs(Server.MapPath("~/Images/Menu/") + staffImageName);
                    }
                    SqlCommand cmd = new SqlCommand("UPDATE [menuInfo] SET menuName='" + txtMenuName.Text + "', menuPrice ='" + txtMenuPrice.Text + "', menuAvailbility='" + ddlMenuAvailbility.SelectedValue.ToString() + "', vegOrNonVeg='" + ddlVegOrNonVeg.SelectedValue.ToString() + "', menuImage='" + menuImagePath + "'WHERE Id='" + id + "'", con);
                    int chck = cmd.ExecuteNonQuery();
                    if (chck != 0)
                    {
                        alert = "Menu details has been updated";
                        con.Close();
                        Response.Redirect("~/Staff/UpdateMenu.aspx?Id=" + id);
                    }
                    else
                    {
                        alert = "Something went Wrong! Please try again Later";
                        displayAlertBox(alert);
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

        protected void btnBack_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Staff/MenuList.aspx");
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