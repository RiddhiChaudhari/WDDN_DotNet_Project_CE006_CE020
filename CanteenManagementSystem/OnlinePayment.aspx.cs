using Microsoft.AspNet.Identity;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CanteenManagementSystem
{
    public partial class OnlinePayment : System.Web.UI.Page
    {
        private string alertMsg;
        private int id;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!User.Identity.IsAuthenticated)
            {
                Response.Redirect("~/");
            }
            if (!Request.QueryString.AllKeys.Contains("Id"))
            {
                Response.Redirect("~/Menu.aspx");
            }
            if (!IsPostBack)
            {
                ViewState["PreviousPage"] = Request.UrlReferrer;
            }
            id = Convert.ToInt32(Request.QueryString["Id"]);
        }

        protected void btnPaymentStatus_Click(object sender, EventArgs e)
        {
            string paymentDoneOrNot = "yes";
            String orderCurrentDate = DateTime.Now.ToString("yyyy-MM-dd", System.Globalization.CultureInfo.InvariantCulture);
            string userId = Convert.ToString(Session["CustomerUserId"]);
            string userName = Convert.ToString(Session["CustomerUserName"]);
            using (SqlConnection con = new SqlConnection("Data Source=DESKTOP-L96SFG5;Initial Catalog=Cms_AspForms;Integrated Security=True"))
            {
                try
                {
                    con.Open();
                    int chck = 0;
                    // fetch menu details from passed I'd and select MenuName and MenuPrice from that and pass them to Given Command
                    //SqlCommand cmd = new SqlCommand("INSERT INTO [ordersInfo] VALUES ('" + userId + "','" + id + "','" + userName + "','" + txtMenuName.Text + "','" + txtMenuPrice.Text + "','" + "online" + "','" + paymentDoneOrNot + "','" + orderCurrentDate + "','" + Context.User.Identity.GetUserName() + "')", con);
                    //chck = cmd.ExecuteNonQuery();
                    if (chck != 0)
                    {
                        alertMsg = "Order Placed";
                        con.Close();
                        displayAlertBox(alertMsg);
                        Response.Redirect("~/Menu.aspx");
                        // code to download PDF
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