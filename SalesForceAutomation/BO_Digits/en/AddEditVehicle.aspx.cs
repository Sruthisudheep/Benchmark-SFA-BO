using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SalesForceAutomation.BO_Digits.en
{
    public partial class AddEditVehicle : System.Web.UI.Page
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
                FillForm();
            }
        }
        public void FillForm()
        {
            DataTable lstDatas = ObjclsFrms.loadList("SelectVehicleByID", "sp_Masters", ResponseID.ToString());
            if (lstDatas.Rows.Count > 0)
            {
                string veh_Number, brd_Name;
                veh_Number = lstDatas.Rows[0]["veh_Number"].ToString();
                brd_Name = lstDatas.Rows[0]["veh_BrandName"].ToString();
                


                txtcode.Text = brd_Name.ToString();
                txtname.Text = veh_Number.ToString();
            }
        }
        protected void Save()
        {
            string veh_Number, brd_Name, user;

            veh_Number = txtname.Text.ToString();
            brd_Name = txtcode.Text.ToString();
            user = UICommon.GetCurrentUserID().ToString();


            if (ResponseID.Equals("") || ResponseID == 0)
            {


                string[] arr = { brd_Name.ToString(), user.ToString() };
                string Value = ObjclsFrms.SaveData("sp_Masters", "InsertVehicle", veh_Number.ToString(), arr);
                int res = Int32.Parse(Value.ToString());
                if (res > 0)
                {
                    ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "tmp", "<script type='text/javascript'>Succcess('Vehicle Saved Successfully');</script>", false);
                }
                else
                {
                    ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "tmp", "<script type='text/javascript'>Failure();</script>", false);
                }
            }

            else
            {
                string id = ResponseID.ToString();
                string[] arr = { veh_Number.ToString(), id.ToString() };
                string Value = ObjclsFrms.SaveData("sp_Masters", "UpdateVehicle", brd_Name.ToString(), arr);
                int res = Int32.Parse(Value.ToString());
                if (res > 0)

                {
                    ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "tmp", "<script type='text/javascript'>Succcess('Vehicle Updated Successfully');</script>", false);
                }
                else
                {
                    ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "tmp", "<script type='text/javascript'>Failure();</script>", false);
                }
            }
        }

        protected void save_Click(object sender, EventArgs e)
        {
            Save();
        }

        protected void btnOK_Click(object sender, EventArgs e)
        {
            Response.Redirect("ListVehicle.aspx");
        }

        protected void lnkAdd_Click(object sender, EventArgs e)
        {
            ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "tmp", "<script type='text/javascript'>Confim();</script>", false);
        }

        protected void lnkCancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("ListVehicle.aspx");
        }

        protected void txtname_TextChanged(object sender, EventArgs e)
        {
            string code = this.txtname.Text.ToString();
            DataTable lstCodeChecker = ObjclsFrms.loadList("CheckVehicleNumber", "sp_CodeChecker", code);
            if (lstCodeChecker.Rows.Count > 0)
            {
                lblCodeDupli.Text = "Vehicle Number  Already Exist";
                lblCodeDupli.Visible = true;
            }
            else
            {
                lblCodeDupli.Visible = false;
            }
        }

    }
}