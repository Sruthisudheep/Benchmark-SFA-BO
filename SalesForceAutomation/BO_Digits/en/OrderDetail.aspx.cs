﻿using Stimulsoft.Report.Dictionary;
using Stimulsoft.Report;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Telerik.Documents.SpreadsheetStreaming;
using Telerik.Web.UI;

namespace SalesForceAutomation.BO_Digits.en
{
    public partial class OrderDetail : System.Web.UI.Page
    {
        GeneralFunctions ObjclsFrms = new GeneralFunctions();
        public int ResponseID
        {
            get
            {
                int ResponseID;
                int.TryParse(Request.Params["ID"], out ResponseID);

                return ResponseID;
            }
        }
        protected void Page_Load(object sender, EventArgs e)
        {


            if (!Page.IsPostBack)
            {

                HeaderData();
            }
        }

        public void LoadData()
        {

            DataTable lstDatas = new DataTable();
            lstDatas = ObjclsFrms.loadList("ListOrderDetails", "sp_Merchandising_UOM", ResponseID.ToString());
            grvRpt.DataSource = lstDatas;

        }


        public void HeaderData()
        {
            DataTable lstDatas = new DataTable();
            lstDatas = ObjclsFrms.loadList("SelOrderDetail", "sp_Merchandising_UOM", ResponseID.ToString());
            if (lstDatas.Rows.Count > 0)
            {
                RadPanelItem rp = RadPanelBar0.Items[0];
                Label lblRot = (Label)rp.FindControl("lblRot");
                Label lblCustomer = (Label)rp.FindControl("lblCustomer");
                Label lblCreatedDate = (Label)rp.FindControl("lblCreatedDate");
                Label lblCreatedBy = (Label)rp.FindControl("lblCreatedBy");
                Label lblDis = (Label)rp.FindControl("lblDis");
                Label lblSub = (Label)rp.FindControl("lblSub");
                Label lblvat = (Label)rp.FindControl("lblvat");
                Label lblGrand = (Label)rp.FindControl("lblGrand");
                Label lblpaymode = (Label)rp.FindControl("lblpaymode");
                Label lbltotal = (Label)rp.FindControl("lbltotal");

                rp.Text = "Order Number: " + lstDatas.Rows[0]["OrderID"].ToString();
                lblRot.Text = lstDatas.Rows[0]["rot_Name"].ToString();
                lblCustomer.Text = lstDatas.Rows[0]["cus_Name"].ToString();
                lblCreatedDate.Text = lstDatas.Rows[0]["CreatedDate"].ToString();
                lblCreatedBy.Text = lstDatas.Rows[0]["usr_Name"].ToString();
                lblDis.Text = lstDatas.Rows[0]["ord_Discount"].ToString();
                lblSub.Text = lstDatas.Rows[0]["ord_SubTotal"].ToString();
                lblvat.Text = lstDatas.Rows[0]["ord_VAT"].ToString();
                lblGrand.Text = lstDatas.Rows[0]["ord_GrandTotal"].ToString();
                lblpaymode.Text = lstDatas.Rows[0]["ord_PayMode"].ToString();
                lbltotal.Text = lstDatas.Rows[0]["ord_SubTotal_WODiscount"].ToString();
                ViewState["ORDNumber"]= ResponseID.ToString();
                ViewState["OrderID"]= lstDatas.Rows[0]["OrderID"].ToString();


            }
        }

        protected void grvRpt_NeedDataSource(object sender, Telerik.Web.UI.GridNeedDataSourceEventArgs e)
        {
            LoadData();
        }

        protected void grvRpt_ItemCommand(object sender, Telerik.Web.UI.GridCommandEventArgs e)
        {

        }

        protected void imgExcel_Click(object sender, ImageClickEventArgs e)
        {
            DataTable dt = new DataTable();

            int columncount = 0;

            foreach (GridColumn column in grvRpt.MasterTableView.Columns)
            {
                if (!string.IsNullOrEmpty(column.UniqueName) && !string.IsNullOrEmpty(column.HeaderText) && !column.HeaderText.Equals("Detail")
                    && !column.HeaderText.Equals("Image")
                    )
                {

                    if (column.Display == true)
                    {
                        columncount++;
                        dt.Columns.Add(column.HeaderText.Replace("<br>", " "), typeof(string));
                    }

                }
            }

            DataRow dr;
            grvRpt.MasterTableView.AllowPaging = false;

            RadGrid dd = grvRpt;
            dd.AllowPaging = false;
            dd.Rebind();
            int x = grvRpt.MasterTableView.Items.Count;
            foreach (GridDataItem item in dd.MasterTableView.Items)
            {
                dr = dt.NewRow();
                int j = 0;
                for (int i = 0; i < grvRpt.MasterTableView.Columns.Count; i++)
                {
                    if (grvRpt.MasterTableView.Columns[i].Display == true)
                    {
                        //if (i == 0)
                        //{
                        //    i++;


                        //}
                        //else
                        //{

                        //    dr[i] = item[grvRpt.MasterTableView.Columns[i].UniqueName].Text;
                        //}


                        if (!item[grvRpt.MasterTableView.Columns[i].UniqueName].Text.Contains("Detail"))
                        {
                            if (!grvRpt.MasterTableView.Columns[i].HeaderText.Equals("Image"))
                            {
                                if (!item[grvRpt.MasterTableView.Columns[i].UniqueName].Text.Contains("&nbsp;"))
                                {
                                    dr[j] = item[grvRpt.MasterTableView.Columns[i].UniqueName].Text;
                                }
                                else
                                {
                                    dr[j] = " ";
                                }
                                j++;
                            }

                        }
                    }
                }
                dt.Rows.Add(dr);
            }
            SpreadStreamProcessingForXLSXAndCSV(dt);
        }
        private void SpreadStreamProcessingForXLSXAndCSV(DataTable dt, SpreadDocumentFormat docFormat = SpreadDocumentFormat.Xlsx, string sheetName = "Sheet1")
        {
            using (MemoryStream stream = new MemoryStream())
            {
                using (IWorkbookExporter workbook = SpreadExporter.CreateWorkbookExporter(docFormat, stream))
                {
                    using (IWorksheetExporter worksheetExporter = workbook.CreateWorksheetExporter(sheetName))
                    {
                        for (int i = 0; i < dt.Columns.Count; i++)
                        {
                            using (IColumnExporter columnExporter = worksheetExporter.CreateColumnExporter())
                            {
                                //make sure the width of the columns is not excessively large
                                //I reduced it to 100 in this iteration
                                columnExporter.SetWidthInPixels(100);
                            }
                        }

                        ExportHeaderRows(worksheetExporter, dt);

                        foreach (DataRow row in dt.Rows)
                        {
                            using (IRowExporter rowExporter = worksheetExporter.CreateRowExporter())
                            {
                                foreach (var item in row.ItemArray)
                                {
                                    SpreadCellFormat normalFormat = new SpreadCellFormat();
                                    normalFormat.FontSize = 10;

                                    normalFormat.VerticalAlignment = SpreadVerticalAlignment.Center;
                                    normalFormat.HorizontalAlignment = SpreadHorizontalAlignment.Center;
                                    using (ICellExporter cellExporter = rowExporter.CreateCellExporter())
                                    {

                                        cellExporter.SetValue(item.ToString());
                                        cellExporter.SetFormat(normalFormat);
                                    }
                                }

                            }
                        }

                    }
                }

                byte[] output = stream.ToArray();


                Response.ContentType = ContentType;
                Response.Headers.Remove("Content-Disposition");
                Response.AppendHeader("Content-Disposition", string.Format("attachment; filename={0}.{1}", "OrderDetail", "Xlsx"));
                Response.BinaryWrite(output);
                Response.End();
            }
        }


        private void ExportHeaderRows(IWorksheetExporter worksheetExporter, DataTable dt)
        {
            using (IRowExporter rowExporter = worksheetExporter.CreateRowExporter())
            {
                double HeaderRowHeight = 30;
                rowExporter.SetHeightInPoints(HeaderRowHeight);

                SpreadCellFormat format = new SpreadCellFormat();
                format.IsBold = true;
                format.Fill = SpreadPatternFill.CreateSolidFill(new SpreadColor(128, 128, 128));
                format.ForeColor = new SpreadThemableColor(new SpreadColor(255, 255, 255));
                format.HorizontalAlignment = SpreadHorizontalAlignment.Center;
                format.VerticalAlignment = SpreadVerticalAlignment.Center;

                for (int i = 0; i < dt.Columns.Count; i++)
                {
                    using (ICellExporter cellExporter = rowExporter.CreateCellExporter())
                    {
                        cellExporter.SetFormat(format);
                        cellExporter.SetValue(dt.Columns[i].ColumnName);
                    }
                }
            }
        }
        protected void btnPDF_Click(object sender, ImageClickEventArgs e)
        {
           string OrderID;
           if (ViewState["OrderID"]!=null)
            {
                OrderID = ViewState["OrderID"].ToString();
            }
            else
            {
                OrderID = "";
            }
               // string url = "OrderPrint.aspx?ordID=" + OrderID.ToString();
              //  OpenNewBrowserWindow(url, this);
            var s = Server.MapPath("Reports/license.key");
            Stimulsoft.Base.StiLicense.LoadFromFile(s);
            Stimulsoft.Base.StiFontCollection.AddFontFile(Server.MapPath("Reports/THSarabunNew.ttf"));
            var report = new StiReport();
            var path = Server.MapPath("Reports/Orders.mrt");


            report.Load(path);



            //string mrhID = ResponseID.ToString();
            report["@Para2"] = OrderID;


            string url = ConfigurationManager.AppSettings.Get("MyDB");
            ((StiSqlDatabase)report.Dictionary.Databases["BMReport"]).ConnectionString = url;
            StiOptions.Export.Pdf.AllowImportSystemLibraries = true;


            var tempPdfPath = Server.MapPath("~/Downloads/Orders.pdf");
            MemoryStream ms = new MemoryStream();
            report.Render();
            report.ExportDocument(StiExportFormat.Pdf, ms);
            File.WriteAllBytes(tempPdfPath, ms.ToArray());

            // Send the URL of the generated PDF file to client side
            ScriptManager.RegisterStartupScript(this, GetType(), "OpenWindow", "window.open('/Downloads/Orders.pdf','_blank');", true);
        }
        public static void OpenNewBrowserWindow(string Url, Control control)
        {
            ScriptManager.RegisterStartupScript(control, control.GetType(), "Open", "window.open('" + Url + "');", true);
        }
    }
}
