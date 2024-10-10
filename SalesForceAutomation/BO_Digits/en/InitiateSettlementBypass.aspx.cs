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
    public partial class InitiateSettlementBypass : System.Web.UI.Page
    {
        GeneralFunctions ObjclsFrms = new GeneralFunctions();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                
            }
        }
        public void LoadList(string mode)
        {
            //string rotID = Rot();
            //string mainCondition = "";
            //mainCondition = mainConditions(rotID, "");

           
            DataTable lstUser=default(DataTable);
            //if (mode.Equals("F"))
            //{
            //    lstUser = ObjclsFrms.loadList("SelectUserDailyProcess", "sp_Merchandising", mainConditions(rotID, "C").ToString());
            //}
            //else
            //{
            lstUser = ObjclsFrms.loadList("ListInitiateSettlement", "sp_Merchandising");
            //}

            grvRpt.DataSource = lstUser;

        }
        protected void grvRpt_NeedDataSource(object sender, Telerik.Web.UI.GridNeedDataSourceEventArgs e)
        {
            LoadList("");
        }

        protected void grvRpt_ItemCommand(object sender, Telerik.Web.UI.GridCommandEventArgs e)
        {
            if (e.CommandName.Equals("Initiate"))
            {
                GridDataItem dataItem = e.Item as GridDataItem;
                string ID = dataItem.GetDataKeyValue("udp_ID").ToString();
                string rotCode = dataItem["rot_Code"].Text.ToString();
                string userID = dataItem["udp_usr_ID"].Text.ToString();
                string routeID = dataItem["udp_rot_ID"].Text.ToString(); 

                ViewState["SelectedUdpID"] = ID;
                ViewState["SelectedRouteCode"] = rotCode;
                ViewState["SelectedRouteID"] = routeID;
                ViewState["SelecteduserID"] = userID;
                ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "tmp", "<script type='text/javascript'>Confirm();</script>", false);

            }
            //if (e.CommandName.Equals("Initiate"))
            //{
            //    GridDataItem dataItem = e.Item as GridDataItem;
            //    string routeCode = dataItem["rot_Code"].Text; // Get the route code from the selected row
            //    ViewState["SelectedRouteCode"] = routeCode;  // Save the route code in ViewState for later use

            //    ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "tmp", "Confim();", true); // Show the modal
            //}
        }

        protected void grvRpt_ItemDataBound(object sender, Telerik.Web.UI.GridItemEventArgs e)
        {

        }

       

        //protected void btnConfirmRoute_Click(object sender, EventArgs e)
        //{
        //    string enteredRouteCode = txtConfirmRouteCode.Text.Trim(); // Get the entered route code
        //    string selectedRouteCode = ViewState["SelectedRouteCode"]?.ToString(); // Retrieve the original route code from ViewState

        //    if (enteredRouteCode == selectedRouteCode)
        //    {
        //        // Success: Route codes match, proceed with the next action
        //        lblErrorMessage.Text = "";
        //        // Call the success modal or further logic here
        //        ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "tmp", "successModal('Route code confirmed successfully!');", true);
        //    }
        //    else
        //    {
        //        // Error: Route codes do not match
        //        lblErrorMessage.Text = "The entered route code does not match the selected route code.";
        //        ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "tmp", "$('#modalConfirm').modal('show');", true); // Keep the modal open
        //    }
        //}

     

        protected void insertRoute_Click(object sender, EventArgs e)
        {
            lblerror.Text = "";
            string enteredRouteCode = txtConfirmRouteCode.Text.Trim(); 
            string selectedRouteCode = ViewState["SelectedRouteCode"]?.ToString();
        
            int res = 0;

            //if (enteredRouteCode != selectedRouteCode)
               if (!string.Equals(enteredRouteCode, selectedRouteCode, StringComparison.OrdinalIgnoreCase))
            {
                lblerror.Text = "The entered route code does not match the selected route code.";
                lblerror.ForeColor = System.Drawing.Color.Red;
                ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "hideError", "<script type='text/javascript'>setTimeout(function(){ document.getElementById('" + lblerror.ClientID + "').style.display = 'none'; }, 3500);</script>", false);
                lblerror.Style["display"] = "block"; // Ensure the label is visible

                //lblerror.Text = "The entered route code does not match the selected route code.";
                //lblerror.ForeColor = System.Drawing.Color.Red;
                //lblerror.Style["display"] = "block";
            }
            else
            {
                lblerror.Text = "";
                try
                {
                    string user = UICommon.GetCurrentUserID().ToString();
                    string udpID = ViewState["SelectedUdpID"]?.ToString();
                    string userID = ViewState["SelecteduserID"]?.ToString();
                    string routeID = ViewState["SelectedRouteID"]?.ToString();
                   
                        
                        string[] arr = { userID, routeID, udpID };


                    string Resp = ObjclsFrms.SaveData("sp_Merchandising", "SettlementRequestInsertion", user, arr);
                    res = Int32.Parse(Resp.ToString());

                }
                catch (Exception ex)
                {
                    ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "tmp", "<script type='text/javascript'>failure('" + ex.Message + "');</script>", false);
                }



                if (res > 0)
                {

                    //ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "tmp", "<script type='text/javascript'>Succcess('Inserted successfully');</script>", false);
                    ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "tmp", "<script type='text/javascript'>Success('Inserted successfully');</script>", false);
                }
                else
                {
                    //failedmodal
                    ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "tmp", "<script type='text/javascript'>Failure('Something went wrong!!');</script>", false);
                    //ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "tmp", "<script type='text/javascript'>failure('Something went wrong!!');</script>", false);

                }
            }


        }

        protected void btnOK_Click(object sender, EventArgs e)
        {
            Response.Redirect("InitiateSettlementBypass.aspx");
        }
    }
}