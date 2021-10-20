using iTextSharp.text;
using iTextSharp.text.pdf;
using Microsoft.AspNet.Identity;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CanteenManagementSystem
{
    public partial class MenuDetails : System.Web.UI.Page
    {
        private int id;
        private string query;
        private string alert;
        private string alertMsg;
        private string userName;
        private string orderCurrentDate;

        protected void Page_Load(object sender, EventArgs e)
        {
            if ( !User.Identity.IsAuthenticated )
            {
                Response.Redirect("~/");
            }
            if (!Request.QueryString.AllKeys.Contains("Id"))
            {
                Response.Redirect("~/Menu.aspx");
            }
            if ( !IsPostBack )
            {
                ViewState["PreviousPage"] = Request.UrlReferrer;
            }
            id = Convert.ToInt32(Request.QueryString["Id"]);
            GridView();
        }

        private void GridView()
        {
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
                            id = Convert.ToInt32(dr["Id"].ToString());
                            txtMenuName.Text = dr["menuName"].ToString();
                            txtMenuPrice.Text = dr["menuPrice"].ToString();
                            txtMenuCousines.Text = dr["menuCousines"].ToString();
                            txtMenuType.Text = dr["menuType"].ToString();
                            txtVegOrNonveg.Text = dr["vegOrNonVeg"].ToString();
                            ImgMenuImage.ImageUrl = dr["menuImage"].ToString();
                        }
                    }
                    catch (System.IO.IOException exp)
                    {
                        alert = "Error occured while connecting Database, Try again later : " + exp;
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

        protected void btnBack_Click(object sender, EventArgs e)
        {
            if (ViewState["PreviousPage"] != null)
            {
                Response.Redirect(ViewState["PreviousPage"].ToString());
            }
            else
            {
                Response.Redirect("~/");
            }
        }

        protected void btnCheckOut_Click(object sender, EventArgs e)
        {
            string paymentDoneOrNot = "";
            orderCurrentDate = DateTime.Now.ToString("yyyy-MM-dd", System.Globalization.CultureInfo.InvariantCulture);
            string userId = Convert.ToString(Session["CustomerUserId"]);
            userName = Convert.ToString(Session["CustomerUserName"]);
            //Response.Write(paymentDoneOrNot + "<br>");
            //Response.Write(orderCurrentDate + "<br>");
            //Response.Write(userId + "<br>");
            //Response.Write(userName + "<br>");
            if ( ddlSelectPaymentMode.SelectedValue.ToString() == "cod")
            {
                paymentDoneOrNot = "no";
                using (SqlConnection con = new SqlConnection("Data Source=DESKTOP-L96SFG5;Initial Catalog=Cms_AspForms;Integrated Security=True"))
                {
                    try
                    {
                        con.Open();
                        SqlCommand cmd = new SqlCommand("INSERT INTO [ordersInfo] VALUES ('" + userId + "','" + id + "','" + userName + "','" + txtMenuName.Text + "','" + txtMenuPrice.Text + "','" + ddlSelectPaymentMode.SelectedValue.ToString() + "','" + paymentDoneOrNot + "','" + orderCurrentDate + "','" + Context.User.Identity.GetUserName() + "')", con);
                        int chck = cmd.ExecuteNonQuery();
                        if (chck != 0)
                        {
                            alertMsg = "Order Placed";
                            con.Close();
                            //displayAlertBox(alertMsg);
                            createPDF();
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
            else
            {
                // can never reach here
                Response.Redirect("OnlinePayment.aspx?id="+ id );
            }
        }

        private void createPDF()
        {
            Rectangle rec = new Rectangle(PageSize.A4);
            try
            {
                //now giving path to put pdf file and name while creating it
                string appRootDir = System.AppDomain.CurrentDomain.BaseDirectory;
                string startfile = appRootDir + "/Pdf/" + id + userName + ".pdf";
                using (FileStream fs = new FileStream(startfile, FileMode.Create, FileAccess.Write, FileShare.None))

                using (Document doc = new Document(rec))

                using (PdfWriter writer = PdfWriter.GetInstance(doc, fs))
                {
                    doc.Open();

                    Paragraph heading = new Paragraph("Receipt", new Font(Font.FontFamily.HELVETICA, 28f, Font.BOLD));
                    heading.Alignment = Element.ALIGN_CENTER;
                    doc.Add(heading);
                    //string url = "C:/Users/Public/orderidhere4.pdf";
                    //iTextSharp.text.Image jpg = iTextSharp.text.Image.GetInstance(url);
                    //jpg.Border = Rectangle.BOX;
                    //doc.Add(jpg);

                    Paragraph OderID = new Paragraph("OrderId:" + id, new Font(Font.FontFamily.HELVETICA, 16f, Font.BOLD));
                    OderID.Alignment = Element.ALIGN_LEFT;
                    doc.Add(OderID);

                    Paragraph Customername = new Paragraph("Customer's Name : " + userName, new Font(Font.FontFamily.HELVETICA, 16f, Font.BOLD));
                    Customername.Alignment = Element.ALIGN_LEFT;
                    doc.Add(Customername);

                    Paragraph Menuname = new Paragraph("Food Item's Name : " + txtMenuName.Text, new Font(Font.FontFamily.HELVETICA, 16f, Font.BOLD));
                    Menuname.Alignment = Element.ALIGN_LEFT;
                    doc.Add(Menuname);

                    Paragraph Menuprice = new Paragraph("Price : " + "₹" + txtMenuPrice.Text, new Font(Font.FontFamily.HELVETICA, 16f, Font.BOLD));
                    Menuprice.Alignment = Element.ALIGN_LEFT;
                    doc.Add(Menuprice);

                    Paragraph Paymentmode = new Paragraph("Mode of Payment : " + ddlSelectPaymentMode.SelectedItem.Text, new Font(Font.FontFamily.HELVETICA, 16f, Font.BOLD));
                    Paymentmode.Alignment = Element.ALIGN_LEFT;
                    doc.Add(Paymentmode);

                    Paragraph Paymentdoneornot = new Paragraph("Payment Status : " + "Panding", new Font(Font.FontFamily.HELVETICA, 16f, Font.BOLD));
                    Paymentdoneornot.Alignment = Element.ALIGN_LEFT;
                    doc.Add(Paymentdoneornot);

                    Paragraph Orderdate = new Paragraph("Order Date : " + orderCurrentDate, new Font(Font.FontFamily.HELVETICA, 16f, Font.BOLD));
                    Orderdate.Alignment = Element.ALIGN_LEFT;
                    doc.Add(Orderdate);

                    Paragraph Customeremail = new Paragraph("Customer Email:" + Context.User.Identity.GetUserName(), new Font(Font.FontFamily.HELVETICA, 16f, Font.BOLD));
                    Customeremail.Alignment = Element.ALIGN_LEFT;
                    doc.Add(Customeremail);

                    doc.Close();
                    printPDF();
                }
            }
            catch (DocumentException de)
            {
                throw de;
            }
            catch (IOException ioe)
            {
                throw ioe;
            }
        }

        private void printPDF()
        {
            string appRootDir = System.AppDomain.CurrentDomain.BaseDirectory;
            string path = appRootDir + "/Pdf/" + id + userName + ".pdf";
            FileInfo file1 = new FileInfo(path);
            if (file1.Exists)
            {
                Response.Clear();
                Response.AddHeader("Content-Disposition", "attachment; filename=" + (id + userName + ".pdf"));
                Response.ContentType = "application/vnd.ms-excel";
                Response.Flush();
                Response.TransmitFile(file1.FullName);
                Response.End();
                Response.Redirect("~/Menu.aspx");
                file1.Delete();
            }
            else
            {
                // Label11.Text = "File is not available for downloading";
            }
        }
    }
}