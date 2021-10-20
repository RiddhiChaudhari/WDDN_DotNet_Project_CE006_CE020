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
    public partial class InsertMenu : System.Web.UI.Page
    {
        private string alert;

        protected void Page_Load(object sender, EventArgs e)
        {
            Response.Cache.SetNoStore();
            if (Session["email"] == null || !String.Equals(Session["role"], "Staff"))
            {
                Response.Redirect("~/"); // change this
            }
        }

        protected void btnInsert_Click(object sender, EventArgs e)
        {
            using (SqlConnection con = new SqlConnection("Data Source=DESKTOP-L96SFG5;Initial Catalog=Cms_AspForms;Integrated Security=True"))
            {
                try
                {
                    con.Open();
                    string menuImageName = menuImage.PostedFile.FileName;
                    string menuImagePath = "~/Images/Menu/" + menuImageName;
                    menuImage.PostedFile.SaveAs(Server.MapPath("~/Images/Menu/") + menuImageName);
                    SqlCommand cmd = new SqlCommand("INSERT INTO [menuInfo] VALUES ('" + txtName.Text + "','" + Convert.ToInt32(txtPrice.Text) + "','" + ddlAvailbility.SelectedValue.ToString() + "','" + ddlType.SelectedValue.ToString() + "','" + dllVegOrNonVeg.SelectedValue.ToString() + "','" + menuImagePath + "','" + ddlCousins.SelectedValue.ToString() + "')", con);
                    int chck = cmd.ExecuteNonQuery();
                    if (chck != 0)
                    {
                        alert = "Data inserted Successfully";
                        con.Close();
                        //resetValues();
                        // displayAlertBox(alert);
                        Response.Redirect("~/Staff/MenuList.aspx");
                    }
                    else
                    {
                        alert = "Something went Wrong! Please try again Later";
                        temp.Text = alert;
                        displayAlertBox(alert);
                    }
                }
                catch (System.IO.IOException exp)
                {
                    string alert = "Error occured while connecting Database, Try again later : " + exp;
                    temp.Text = alert;
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

        protected void btnReset_Click(object sender, EventArgs e)
        {
            txtName.Text = txtPrice.Text = "";
            ddlAvailbility.SelectedIndex = dllVegOrNonVeg.SelectedIndex = ddlCousins.SelectedIndex = ddlType.SelectedIndex = -1;
            menuImage = new FileUpload();
        }
    }
}