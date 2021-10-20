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
    public partial class OrdersList : System.Web.UI.Page
    {
        private string query;
        private string alert;

        protected void Page_Load(object sender, EventArgs e)
        {
            Response.Cache.SetNoStore();
            if (Session["email"] == null || !String.Equals(Session["role"], "Staff"))
            {
                Response.Redirect("~/"); // change this
            }
            if (!IsPostBack)
            {
                // Bind only that orders who have orderDate as current date
                query = "SELECT * FROM [ordersInfo] WHERE PaymentDoneOrNot = 'no' AND CODorOnlinePay = 'cod' AND orderDate = '" + DateTime.Now.ToString("yyyy-MM-dd", System.Globalization.CultureInfo.InvariantCulture) + "'";
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
                        gvOrderStatus.DataSource = dr;
                        gvOrderStatus.DataBind();
                        con.Close();
                    }
                    else
                    {
                        displayAlertBox("Work Hard!! no orders ahead.");
                        con.Close();
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

        protected void gvOrderStatus_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            //if (e.CommandName == "orderId")
            //{
            //    int cRow = Convert.ToInt32(e.CommandArgument.ToString());
            //    string str = gvOrderStatus.Rows[cRow].Cells[5].Text;
            //    if ( str=="yes" )
            //    {
            //        // disable asp:ButtonField - 'Paid'
            //    }
            //}
            if ( e.CommandName=="orderId" )
            {
                //int cRow = Convert.ToInt32(e.CommandArgument.ToString());
                //string str = gvOrderStatus.Rows[cRow].Cells[0].Text;
                int passedOrderId = Convert.ToInt32(gvOrderStatus.Rows[Convert.ToInt32(e.CommandArgument.ToString())].Cells[0].Text);
                //Response.Write(passedOrderId);
                using (SqlConnection con = new SqlConnection("Data Source=DESKTOP-L96SFG5;Initial Catalog=Cms_AspForms;Integrated Security=True"))
                {
                    try
                    {
                        con.Open();
                        SqlCommand cmd = new SqlCommand("UPDATE [ordersInfo] SET PaymentDoneOrNot = 'yes' WHERE Id='" + passedOrderId + "'", con);
                        int chck = cmd.ExecuteNonQuery();
                        if (chck != 0)
                        {
                            con.Close();
                            Response.Redirect("~/Staff/OrdersList.aspx");
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
        }

        protected void btnPaidorNot_Click(object sender, EventArgs e)
        {
            if ( ddlPaidorNot.SelectedValue.ToString() == "no" )
            {
                query = "SELECT * FROM [ordersInfo] WHERE PaymentDoneOrNot = 'no' AND orderDate = '" + DateTime.Now.ToString("yyyy-MM-dd", System.Globalization.CultureInfo.InvariantCulture) + "'";
            }
            else if ( ddlPaidorNot.SelectedValue.ToString() == "yes" )
            {
                query = "SELECT * FROM [ordersInfo] WHERE PaymentDoneOrNot = 'yes'";
            }
            else if (ddlPaidorNot.SelectedValue.ToString() == "missed" )
            {
                query = "SELECT * FROM [ordersInfo] WHERE PaymentDoneOrNot = 'no' AND orderDate != '" + DateTime.Now.ToString("yyyy-MM-dd", System.Globalization.CultureInfo.InvariantCulture) + "'";
            }
            else if ( ddlPaidorNot.SelectedValue.ToString() == "all" )
            {
                query = "SELECT * FROM [ordersInfo]";
            }
            txtSearchOrderbyCustomerName.Text = "";
            gridViewBind(query);
        }

        protected void btnSearchOrderbyCustomerName_Click(object sender, EventArgs e)
        {
            if (string.IsNullOrEmpty(txtSearchOrderbyCustomerName.Text))
            {
                query = "SELECT * FROM [ordersInfo] WHERE PaymentDoneOrNot = 'no' AND orderDate = '" + DateTime.Now.ToString("yyyy-MM-dd", System.Globalization.CultureInfo.InvariantCulture) + "'";
            }
            else
            {
                query = "SELECT * FROM [ordersInfo] WHERE customerName LIKE '%" + txtSearchOrderbyCustomerName.Text + "%'";
                ddlPaidorNot.SelectedIndex = -1;
            }
            gridViewBind(query);
        }
    }
}