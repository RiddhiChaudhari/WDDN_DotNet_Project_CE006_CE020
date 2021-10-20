using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CanteenManagementSystem.Admin
{
    public partial class updateStaff : System.Web.UI.Page
    {
        int id;
        string query, alert;
        protected void Page_Load(object sender, EventArgs e)
        {
            Response.Cache.SetNoStore();
            if (Session["email"] == null || !String.Equals(Session["role"], "Admin"))
            {
                Response.Redirect("~/"); // change this
            }
            if ( !Request.QueryString.AllKeys.Contains("Id") )
            {
                Response.Redirect("~/Admin/StaffStatus.aspx");
            }
            id = Convert.ToInt32(Request.QueryString["Id"]);
            if (!IsPostBack)
            {
                query = "SELECT * FROM [StaffInfo] WHERE Id='"+ id +"'";
                using (SqlConnection con = new SqlConnection("Data Source=DESKTOP-L96SFG5;Initial Catalog=Cms_AspForms;Integrated Security=True"))
                {
                    try
                    {
                        con.Open();
                        SqlCommand cmd = new SqlCommand(query, con);
                        SqlDataReader dr = cmd.ExecuteReader();
                        while ( dr.Read() )
                        {
                            txtId.Text = Convert.ToString(id);
                            txtName.Text = dr["staffName"].ToString();
                            txtSurname.Text = dr["staffSurname"].ToString();
                            txtEmail.Text = dr["staffEmail"].ToString();
                            txtPhone.Text = dr["staffPhoneNo"].ToString();
                            ddlGender.Text = dr["staffGender"].ToString();
                            ddlRole.Text = dr["Role"].ToString();
                            sImage.ImageUrl = dr["staffImage"].ToString();
                        }
                    }
                    catch (System.IO.IOException exp )
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
                    //Label1.Text = staffImage.PostedFile.FileName;
                    string staffImagePath = sImage.ImageUrl;
                    if ( staffImage.HasFile )
                    {
                        string staffImageName = ddlRole.SelectedItem.Text.ToUpper() + "_" + staffImage.PostedFile.FileName;
                        staffImagePath = "~/Images/Staff/" + staffImageName;
                        staffImage.PostedFile.SaveAs(Server.MapPath("~/Images/Staff/") + staffImageName);
                    }
                    SqlCommand cmd = new SqlCommand("UPDATE [staffInfo] SET staffEmail='"+ txtEmail.Text +"', staffPhoneNo ='"+ txtPhone.Text +"', Role='"+ ddlRole.SelectedValue.ToString() +"', staffImage='"+ staffImagePath + "'WHERE Id='"+ id +"'", con);
                    int chck = cmd.ExecuteNonQuery();
                    if (chck != 0)
                    {
                        alert = "Staff details has been updated";
                        con.Close();
                        //resetValues();
                        //displayAlertBox(alert);

                        Response.Redirect("~/Admin/UpdateStaff.aspx?Id="+id);
                    }
                    else
                    {
                        alert = "Something went Wrong! Please try again Later";
                        displayAlertBox(alert);
                    }
                }
                catch(System.IO.IOException exp)
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

        private void resetValues()
        {
            txtEmail.Text = txtPhone.Text = "";
            staffImage = new FileUpload();
        }

        protected void staffImage_Click(object sender, ImageClickEventArgs e)
        {
            sImage.Visible = true;
        }

        protected void btnBack_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Admin/StaffStatus.aspx");
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