﻿using ExcelLibrary.BinaryFileFormat;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SalesForceAutomation.BO_Digits.en
{
    public partial class AddEditBank : System.Web.UI.Page
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
            DataTable lstDatas = ObjclsFrms.loadList("SelectBankByID", "sp_Masters", ResponseID.ToString());
            if (lstDatas.Rows.Count > 0)
            {
                string name, status, code;
                name = lstDatas.Rows[0]["bnk_Name"].ToString();
                code = lstDatas.Rows[0]["bnk_Code"].ToString();
                txtcode.Enabled = false;
                status = lstDatas.Rows[0]["Status"].ToString();


                txtcode.Text = code.ToString();
                txtname.Text = name.ToString();
                ddlStatus.SelectedValue = status.ToString();
            }
        }
        protected void Save()
        {
            try
            {


                string name, code, user, status;

                name = txtname.Text.ToString();
                code = txtcode.Text.ToString();
                user = UICommon.GetCurrentUserID().ToString();
                status = ddlStatus.SelectedValue.ToString();


                if (ResponseID.Equals("") || ResponseID == 0)
                {


                    string[] arr = { code.ToString(), user.ToString(), status.ToString() };
                    string Value = ObjclsFrms.SaveData("sp_Masters", "InsertBank", name.ToString(), arr);
                    int res = Int32.Parse(Value.ToString());
                    if (res > 0)
                    {
                        ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "tmp", "<script type='text/javascript'>Succcess('Bank Saved Successfully');</script>", false);
                    }
                    else
                    {
                        ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "tmp", "<script type='text/javascript'>Failure();</script>", false);
                    }
                }

                else
                {
                    string id = ResponseID.ToString();
                    string[] arr = { code.ToString(), status.ToString(), id.ToString() };
                    string Value = ObjclsFrms.SaveData("sp_Masters", "UpdateBank", name.ToString(), arr);
                    int res = Int32.Parse(Value.ToString());
                    if (res > 0)

                    {
                        ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "tmp", "<script type='text/javascript'>Succcess('Bank Updated Successfully');</script>", false);
                    }
                    else
                    {
                        ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "tmp", "<script type='text/javascript'>Failure();</script>", false);
                    }
                }
            }
            catch (Exception ex)
            {
                ObjclsFrms.TraceService("Exception from AddEdit Bank Save(): " + ex.Message.ToString());
            }
        }
        
        protected void save_Click(object sender, EventArgs e)
        {
            Save();
        }

        protected void btnOK_Click(object sender, EventArgs e)
        {
            Response.Redirect("ListBank.aspx");
        }

        protected void lnkAdd_Click(object sender, EventArgs e)
        {
            ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "tmp", "<script type='text/javascript'>Confim();</script>", false);
        }

        protected void lnkCancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("ListBank.aspx");
        }

        protected void txtcode_TextChanged(object sender, EventArgs e)
        {
            string code = this.txtcode.Text.ToString();
            DataTable lstCodeChecker = ObjclsFrms.loadList("CheckBankCode", "sp_CodeChecker", code);
            if(lstCodeChecker.Rows.Count > 0)
            {
                lblCodeDupli.Text = "Code Already Exist";
                lnkAdd.Enabled = false;
                lblCodeDupli.Visible = true;
            }
            else
            {
                lnkAdd.Enabled = true;
                lblCodeDupli.Visible = false;
            }
        }
    }
}