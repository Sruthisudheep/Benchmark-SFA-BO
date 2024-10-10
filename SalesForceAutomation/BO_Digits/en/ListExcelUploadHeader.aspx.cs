using DocumentFormat.OpenXml.Drawing.Diagrams;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Telerik.Web.UI;

namespace SalesForceAutomation.BO_Digits.en
{
    public partial class ListExcelUploadHeader : System.Web.UI.Page
    {
        GeneralFunctions ObjclsFrms = new GeneralFunctions();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                //rddate.SelectedDate = DateTime.Now;
                Procedures();
                try
                {
                    if (Session["FromDate"] != null)
                    {
                        rdfromDate.SelectedDate = DateTime.Parse(Session["FromDate"].ToString());
                        
                    }
                    else
                    {
                        rdfromDate.SelectedDate = DateTime.Now;


                    }
                    rdfromDate.MaxDate = DateTime.Now;

                    if (Session["ToDate"] != null)
                    {
                        rdendDate.SelectedDate = DateTime.Parse(Session["ToDate"].ToString());
                    }
                    else
                    {
                        rdendDate.SelectedDate = DateTime.Now;

                    }
                    rdendDate.MaxDate = DateTime.Now;
                    // Restore the selected procedure from session
                    if (Session["SelectedProcedure"] != null)
                {
                    string selectedProcedure = Session["SelectedProcedure"].ToString();

                    ddlprocs.SelectedValue = selectedProcedure;

                }
                }
                catch (Exception ex)
                {
                    Response.Redirect("~/SignIn.aspx");
                }
            }
        }

        public void LoadList()
        {
            string proc, date;
            string procCondition;
            string dateCondition;
            proc =ddlprocs.SelectedValue.ToString();
            if (proc == "")
            {
                procCondition = "";
            }
            else
            {
                procCondition = " and eul_Procedure in ('" + proc + "')";
            }

            string fromDate = DateTime.Parse(rdfromDate.SelectedDate.ToString()).ToString("yyyyMMdd");
            string endDate = DateTime.Parse(rdendDate.SelectedDate.ToString()).ToString("yyyyMMdd");
            dateCondition = "(cast(CreatedDate as date) between cast('" + fromDate + "' as date) and cast('" + endDate + "' as date))";

            //date =DateTime.Parse(rddate.SelectedDate.ToString()).ToString("yyyyMMdd");
            //string dateCondition = " cast(CreatedDate as date) = cast('" + date + "' as date) ";   

            string[] ar = { dateCondition };

            DataTable lstUser = default(DataTable);
            lstUser = ObjclsFrms.loadList("ListHeaderData", "sp_Backend", procCondition, ar);
            grvRpt.DataSource = lstUser;
        }
        protected void grvRpt_NeedDataSource(object sender, Telerik.Web.UI.GridNeedDataSourceEventArgs e)
        {
            LoadList();
        }

        protected void grvRpt_ItemCommand(object sender, Telerik.Web.UI.GridCommandEventArgs e)
        {
            if (e.CommandName.Equals("Detail"))
            {
                GridDataItem dataItem = e.Item as GridDataItem;
                string ID = dataItem.GetDataKeyValue("eul_ID").ToString();
                Response.Redirect("ListExcelUploadDetails.aspx?Id=" + ID);
            }
        }

        protected void lnkFilter_Click(object sender, EventArgs e)
        {

            try
            {

                Session["SelectedProcedure"] = ddlprocs.SelectedValue;
                Session["FromDate"] = rdfromDate.SelectedDate.ToString();
                Session["ToDate"] = rdendDate.SelectedDate.ToString();
               

            }
            catch (Exception ex)
            {
                Response.Redirect("~/SignIn.aspx");
            }
           

            LoadList();
            grvRpt.Rebind();
        }





        //protected void lnkFilter_Click(object sender, EventArgs e)
        //{
        //    LoadList();
        //    grvRpt.Rebind();
        //}

        public void Procedures()
        {
            DataTable dt = ObjclsFrms.loadList("SelProcedures", "sp_Backend");
            ddlprocs.DataSource = dt;
            ddlprocs.DataTextField = "upt_Name";
            ddlprocs.DataValueField = "upt_Procedure";
            ddlprocs.DataBind();

        }

    }
}