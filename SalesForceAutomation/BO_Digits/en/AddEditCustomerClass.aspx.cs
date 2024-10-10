using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SalesForceAutomation.BO_Digits.en
{
  
    public partial class AddEditCustomerClass : System.Web.UI.Page
    {
        GeneralFunctions ObjclsFrms = new GeneralFunctions();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                FillForm();
                Customercategory();
            }
        }
        public int ResponseID
        {
            get
            {
                int ResponseID;
                int.TryParse(Request.Params["ID"], out ResponseID);

                return ResponseID;
            }
        }
        public void FillForm()
        {
            DataTable lstDatas = ObjclsFrms.loadList("SelCustomerClassByID", "sp_Masters", ResponseID.ToString());
            if (lstDatas.Rows.Count > 0)
            {
                string name, arabic, status,cat;
                name = lstDatas.Rows[0]["cls_Name"].ToString();
                arabic = lstDatas.Rows[0]["cls_NameArabic"].ToString();
                status = lstDatas.Rows[0]["Status"].ToString();
                cat= lstDatas.Rows[0]["cls_cct_ID"].ToString();
                txtname.Text = name.ToString();
                txtarabic.Text = arabic.ToString();
                ddlStatus.SelectedValue = status.ToString();
                ddlcategory.SelectedValue = cat.ToString();

            }
        }
        public void Customercategory()
        {
            DataTable dt = ObjclsFrms.loadList("SelCusCategory", "sp_Masters");
            ddlcategory.DataSource = dt;
            ddlcategory.DataTextField = "cct_Name";
            ddlcategory.DataValueField = "cct_ID";
            ddlcategory.DataBind();
        }
        protected void Save()
        {
            string name, arabic, user, status,cat;
            name = txtname.Text.ToString();
            arabic = txtarabic.Text.ToString();
            user = UICommon.GetCurrentUserID().ToString();
            status = ddlStatus.SelectedValue.ToString();
            cat= ddlcategory.SelectedValue.ToString();
            if (ResponseID.Equals("") || ResponseID == 0)
            {
                string[] arr = { arabic, user,  status,cat };
                string Value = ObjclsFrms.SaveData("sp_Masters", "InsertCustomerClass", name, arr);
                int res = Int32.Parse(Value.ToString());
                if (res >= 0)
                {
                    ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "tmp", "<script type='text/javascript'>Succcess('Customer Class Saved Successfully');</script>", false);
                }
                else
                {
                    ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "tmp", "<script type='text/javascript'>Failure();</script>", false);
                }


            }

            else
            {
                string id = ResponseID.ToString();
                string[] arr = { arabic, status, id ,cat};
                string Value = ObjclsFrms.SaveData("sp_Masters", "UpdateCustomerClass", name.ToString(), arr);
                int res = Int32.Parse(Value.ToString());
                if (res > 0)

                {
                    ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "tmp", "<script type='text/javascript'>Succcess('Customer Class Updated Successfully');</script>", false);
                }
                else
                {
                    ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "tmp", "<script type='text/javascript'>Failure();</script>", false);
                }
            }
        }

        protected void lnkSave_Click(object sender, EventArgs e)
        {
            ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "tmp", "<script type='text/javascript'>Confim();</script>", false);

        }

        protected void lnkCancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("ListCustomerClass.aspx");
        }

        protected void save_Click(object sender, EventArgs e)
        {
            Save();
        }

        protected void btnOK_Click(object sender, EventArgs e)
        {
            Response.Redirect("ListCustomerClass.aspx");
        }
    }
}