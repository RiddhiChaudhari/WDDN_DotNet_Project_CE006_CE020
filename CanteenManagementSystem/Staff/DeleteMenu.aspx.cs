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
    public partial class DeleteMenu : System.Web.UI.Page
    {
        private int id;
        private string query;
        private string alert;

        protected void Page_Load(object sender, EventArgs e)
        {
            Response.Cache.SetNoStore();
            if (Session["email"] == null || !String.Equals(Session["role"], "Admin"))
            {
                Response.Redirect("~/"); // change this
            }
            if (!Request.QueryString.AllKeys.Contains("Id"))
            {
                Response.Redirect("~/Staff/MenuList.aspx");
            }
            id = Convert.ToInt32(Request.QueryString["Id"]);
            // Response.Write(id);
            GridView();
        }

        private void GridView()
        {
            if (!IsPostBack)
            {
                query = "SELECT * FROM [menuInfo] WHERE Id='" + id + "'";
                using (System.Data.SqlClient.SqlConnection con = new SqlConnection("Data Source=DESKTOP-L96SFG5;Initial Catalog=Cms_AspForms;Integrated Security=True"))
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
                            txtMenuAvailbility.Text = dr["menuAvailbility"].ToString();
                            txtMenuType.Text = dr["menuType"].ToString();
                            txtVegOrNonveg.Text = dr["vegOrNonVeg"].ToString();
                            txtMenuCousines.Text = dr["menuCousines"].ToString();
                            ImgMenuImage.ImageUrl = dr["menuImage"].ToString();
                        }
                    }
                    catch (System.IO.IOException exp)
                    {
                        alert = "Error occured while connecting Database, Try again later : " + exp;
                        //Label1.Text = alert;
                        displayAlertBox(alert);
                    }
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

        protected void btnDelete_Click(object sender, EventArgs e)
        {
            using (SqlConnection con = new SqlConnection("Data Source=DESKTOP-L96SFG5;Initial Catalog=Cms_AspForms;Integrated Security=True"))
            {
                try
                {
                    con.Open();
                    SqlCommand cmd = new SqlCommand("DELETE [menuInfo] WHERE id='" + id + "'", con);
                    int chck = cmd.ExecuteNonQuery();
                    if (chck != 0)
                    {
                        alert = "Staff details has been deleted";
                        con.Close();
                        //displayAlertBox(alert);
                        Response.Redirect("~/Staff/MenuList.aspx");
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
            }
        }

        protected void btnBack_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Staff/MenuList.aspx");
        }
    }
}