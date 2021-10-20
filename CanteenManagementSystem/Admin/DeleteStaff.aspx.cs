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
    public partial class DeleteStaff : System.Web.UI.Page
    {
        private int id;
        private string alert;
        private string query;

        protected void Page_Load(object sender, EventArgs e)
        {
            Response.Cache.SetNoStore();
            if (Session["email"] == null || !String.Equals(Session["role"], "Admin"))
            {
                Response.Redirect("~/"); // change this
            }
            if (!Request.QueryString.AllKeys.Contains("Id"))
            {
                Response.Redirect("~/Admin/StaffStatus.aspx");
            }
            id = Convert.ToInt32(Request.QueryString["Id"]);
            //Response.Write(id);
            GridView();
            
        }

        private void GridView()
        {
            if (!IsPostBack)
            {
                query = "SELECT * FROM [staffInfo] WHERE Id='" + id + "'";
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
                            txtStaffName.Text = dr["staffName"].ToString() + " " + dr["staffSurname"].ToString();
                            txtStaffEmail.Text = dr["staffEmail"].ToString();
                            txtStaffGender.Text = dr["staffGender"].ToString();
                            txtStaffPhoneNo.Text = dr["staffPhoneNo"].ToString();
                            txtStaffJoinDate.Text = dr["staffJoinDate"].ToString();
                            txtStaffRole.Text = dr["Role"].ToString();
                            ImgStaffImage.ImageUrl = dr["staffImage"].ToString();
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

        protected void btnDelete_Click(object sender, EventArgs e)
        {
            using (SqlConnection con = new SqlConnection("Data Source=DESKTOP-L96SFG5;Initial Catalog=Cms_AspForms;Integrated Security=True"))
            {
                try
                {
                    con.Open();
                    SqlCommand cmd = new SqlCommand("DELETE [staffInfo] WHERE id='" + id + "'", con);
                    int chck = cmd.ExecuteNonQuery();
                    if (chck != 0)
                    {
                        alert = "Staff details has been deleted";
                        con.Close();
                        //displayAlertBox(alert);
                        Response.Redirect("~/Admin/StaffStatus.aspx");
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
            Response.Redirect("~/Admin/StaffStatus.aspx");
        }
    }
}