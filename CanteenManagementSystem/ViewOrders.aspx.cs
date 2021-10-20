using iTextSharp.text;
using iTextSharp.text.pdf;
using Microsoft.AspNet.Identity;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.IO;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Font = iTextSharp.text.Font;

namespace CanteenManagementSystem
{
    public partial class ViewOrders : System.Web.UI.Page
    {
        private string alert;
        private string PdfOrderId;
        private string PdfCustomerName;
        private string PdfMenuName;
        private string PdfOrderPrice;
        private string PdfPaymentMode;
        private string PdfPaymentDoneOrNOt;
        private string PdfOrderDate;
        private string PdfCustomerEmail;
        private int passedOrderId;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                ViewState["PreviousPage"] = Request.UrlReferrer;
            }
            using (SqlConnection con = new SqlConnection("Data Source=DESKTOP-L96SFG5;Initial Catalog=Cms_AspForms;Integrated Security=True"))
            {
                try
                {
                    con.Open();
                    SqlCommand cmdCheckFilled = new SqlCommand("SELECT * FROM [customerInfo] WHERE userEmail = '" + Context.User.Identity.GetUserName() + "'", con);
                    SqlDataAdapter sdaCheckFilled = new SqlDataAdapter(cmdCheckFilled);
                    DataTable dtCheckFilled = new DataTable();
                    sdaCheckFilled.Fill(dtCheckFilled);
                    if (dtCheckFilled.Rows.Count == 0)
                    {
                        Response.Redirect("~/CustomerInfo.aspx"); // customer data is not fully filled
                    }
                    else
                    {
                        gridViewBind();
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

        private void gridViewBind()
        {
            using (SqlConnection con = new SqlConnection("Data Source=DESKTOP-L96SFG5;Initial Catalog=Cms_AspForms;Integrated Security=True"))
            {
                try
                {
                    con.Open();
                    SqlCommand cmdUpcoming = new SqlCommand("SELECT * FROM [ordersInfo] WHERE CustomerEmailId = '" + Context.User.Identity.GetUserName() + "' AND PaymentDoneOrNot = 'no' AND orderDate = '" + DateTime.Now.ToString("yyyy-MM-dd", System.Globalization.CultureInfo.InvariantCulture) + "'", con);
                    SqlDataReader drUpcoming = cmdUpcoming.ExecuteReader();
                    if (drUpcoming.HasRows == true)
                    {
                        gvUpcomingOrderStatus.DataSource = drUpcoming;
                        gvUpcomingOrderStatus.DataBind();
                    }
                    drUpcoming.Close();
                    drUpcoming.Dispose();
                    SqlCommand cmdPrevious = new SqlCommand("SELECT * FROM [ordersInfo] WHERE CustomerEmailId = '" + Context.User.Identity.GetUserName() + "' AND PaymentDoneOrNot = 'yes'", con);
                    SqlDataReader drPrevious = cmdPrevious.ExecuteReader();
                    if (drPrevious.HasRows == true)
                    {
                        gvPreviousOrderStatus.DataSource = drPrevious;
                        gvPreviousOrderStatus.DataBind();
                    }
                    drPrevious.Close();
                    drPrevious.Dispose();
                    SqlCommand cmdMissed = new SqlCommand("SELECT * FROM [ordersInfo] WHERE CustomerEmailId = '" + Context.User.Identity.GetUserName() + "' AND PaymentDoneOrNot = 'no' AND orderDate != '" + DateTime.Now.ToString("yyyy-MM-dd", System.Globalization.CultureInfo.InvariantCulture) + "'", con);
                    SqlDataReader drMissed = cmdMissed.ExecuteReader();
                    if (drMissed.HasRows == true)
                    {
                        gvMissedOrderStatus.DataSource = drMissed;
                        gvMissedOrderStatus.DataBind();
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

        // this code will be never used
        protected void gvUpcomingOrderStatus_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            //int cRow = Convert.ToInt32(e.CommandArgument.ToString());
            //Response.Write("cRow = "+cRow);
            //string str = gvUpcomingOrderStatus.Rows[cRow].Cells[0].Text;
            //Response.Write(str);
            passedOrderId = Convert.ToInt32(gvUpcomingOrderStatus.Rows[Convert.ToInt32(e.CommandArgument.ToString())].Cells[0].Text);
            Response.Write(passedOrderId);
            using (SqlConnection con = new SqlConnection("Data Source=DESKTOP-L96SFG5;Initial Catalog=Cms_AspForms;Integrated Security=True"))
            {
                try
                {
                    con.Open();
                    SqlCommand cmd = new SqlCommand("SELECT * FROM [ordersInfo] WHERE Id = '" + passedOrderId + "'", con);
                    SqlDataReader dr = cmd.ExecuteReader();
                    while (dr.Read())
                    {
                        PdfOrderId = dr["Id"].ToString();
                        PdfCustomerName = dr["customerName"].ToString();
                        PdfMenuName = dr["menuName"].ToString();
                        PdfOrderPrice = dr["orderPrice"].ToString();
                        PdfPaymentMode = dr["CODorOnlinePay"].ToString();
                        PdfPaymentDoneOrNOt = dr["PaymentDoneOrNOt"].ToString();
                        PdfOrderDate = dr["orderDate"].ToString();
                        PdfCustomerEmail = dr["customerEmailId"].ToString();
                    }
                    // createPDF();
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

        private void createPDF()
        {
            iTextSharp.text.Rectangle rec = new iTextSharp.text.Rectangle(PageSize.A4);
            try
            {
                //now giving path to put pdf file and name while creating it
                string appRootDir = System.AppDomain.CurrentDomain.BaseDirectory;
                string startfile = appRootDir + "/Pdf/" + PdfOrderId + PdfCustomerName + ".pdf";
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

                    Paragraph OderID = new Paragraph("OrderId:" + passedOrderId, new Font(Font.FontFamily.HELVETICA, 16f, Font.BOLD));
                    OderID.Alignment = Element.ALIGN_LEFT;
                    doc.Add(OderID);

                    Paragraph Customername = new Paragraph("Customer's Name : " + PdfCustomerName, new Font(Font.FontFamily.HELVETICA, 16f, Font.BOLD));
                    Customername.Alignment = Element.ALIGN_LEFT;
                    doc.Add(Customername);

                    Paragraph Menuname = new Paragraph("Food Item's Name : " + PdfMenuName, new Font(Font.FontFamily.HELVETICA, 16f, Font.BOLD));
                    Menuname.Alignment = Element.ALIGN_LEFT;
                    doc.Add(Menuname);

                    Paragraph Menuprice = new Paragraph("Price : " + "₹" + PdfOrderPrice, new Font(Font.FontFamily.HELVETICA, 16f, Font.BOLD));
                    Menuprice.Alignment = Element.ALIGN_LEFT;
                    doc.Add(Menuprice);

                    Paragraph Paymentmode = new Paragraph("Mode of Payment : " + PdfPaymentMode, new Font(Font.FontFamily.HELVETICA, 16f, Font.BOLD));
                    Paymentmode.Alignment = Element.ALIGN_LEFT;
                    doc.Add(Paymentmode);

                    Paragraph Paymentdoneornot = new Paragraph("Payment Status : " + PdfPaymentDoneOrNOt, new Font(Font.FontFamily.HELVETICA, 16f, Font.BOLD));
                    Paymentdoneornot.Alignment = Element.ALIGN_LEFT;
                    doc.Add(Paymentdoneornot);

                    Paragraph Orderdate = new Paragraph("Order Date : " + PdfOrderDate, new Font(Font.FontFamily.HELVETICA, 16f, Font.BOLD));
                    Orderdate.Alignment = Element.ALIGN_LEFT;
                    doc.Add(Orderdate);

                    Paragraph Customeremail = new Paragraph("Customer Email:" + PdfCustomerEmail, new Font(Font.FontFamily.HELVETICA, 16f, Font.BOLD));
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
            string path = appRootDir + "/Pdf/" + passedOrderId + PdfCustomerName + ".pdf";
            FileInfo file1 = new FileInfo(path);
            if (file1.Exists)
            {
                Response.Clear();
                Response.AddHeader("Content-Disposition", "attachment; filename=" + (passedOrderId + PdfCustomerName + ".pdf"));
                Response.ContentType = "application/vnd.ms-excel";
                Response.Flush();
                Response.TransmitFile(file1.FullName);
                Response.End();
                file1.Delete();
            }
            else
            {
                displayAlertBox("Some thing went Wrong!! try againb later");
            }
        }
    }
}