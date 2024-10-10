using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SalesForceAutomation.BO_Digits.en
{
    public partial class NotstartedRoutes : System.Web.UI.Page
    {
        GeneralFunctions ObjclsFrms = new GeneralFunctions();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {

            }
        }
        public void LoadList()
        {
            try
            {
                string rotID = Session["Route"].ToString();
                DataTable lstUser = default(DataTable);
                string[] arr = { };
                lstUser = ObjclsFrms.loadList("SelNotStartedRoutes", "sp_Dashboard", rotID, arr);
                grvRpt.DataSource = lstUser;
            }
            catch(Exception ex)
            {

            }
           
        }
        protected void grvRpt_NeedDataSource(object sender, Telerik.Web.UI.GridNeedDataSourceEventArgs e)
        {
            LoadList();
        }
    }
}