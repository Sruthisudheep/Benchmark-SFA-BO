using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SalesForceAutomation.BO_Digits.en
{
    public partial class AddEditRegion : System.Web.UI.Page
    {
       
            GeneralFunctions ObjclsFrms = new GeneralFunctions();

            protected void Page_Load(object sender, EventArgs e)
            {
                if (!Page.IsPostBack)
                {
                FillForm();
                country();
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
            public void country()
            {
                DataTable dt = ObjclsFrms.loadList("selectCountryForDropDown", "sp_Masters");
                ddlcountry.DataSource = dt;
                ddlcountry.DataTextField = "cou_Name";
                ddlcountry.DataValueField = "cou_ID";
                ddlcountry.DataBind();
            }
            public void FillForm()
            {
                DataTable lstDatas = ObjclsFrms.loadList("SelRegionByID", "sp_Masters", ResponseID.ToString());
                if (lstDatas.Rows.Count > 0)
                {
                    string code, name,arabic,country;
                    name = lstDatas.Rows[0]["reg_Name"].ToString();
                    code = lstDatas.Rows[0]["reg_Code"].ToString();
                    arabic = lstDatas.Rows[0]["reg_Name_ar"].ToString();
                    country  = lstDatas.Rows[0]["cou_ID"].ToString();


                    txtname.Text = name.ToString();
                    txtcode.Text = code.ToString();
                    txtARname.Text = arabic.ToString();
                    ddlcountry.SelectedValue = country.ToString();

                }
            }
            protected void Save()
            {
                string cntry, code, name,arabic, User;
                cntry = ddlcountry.SelectedValue.ToString();
                
                name = txtname.Text.ToString();
                code = txtcode.Text.ToString();
                arabic = txtARname.Text.ToString();
                User = UICommon.GetCurrentUserID().ToString();
                if (ResponseID.Equals("") || ResponseID == 0)
                {
                    string[] arr = { code,name, arabic, User };
                    string Value = ObjclsFrms.SaveData("sp_Masters", "insertRegion", cntry, arr);
                    int res = Int32.Parse(Value.ToString());
                    if (res >= 0)
                    {
                        ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "tmp", "<script type='text/javascript'>Succcess('Region Saved Successfully');</script>", false);
                    }
                    else
                    {
                        ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "tmp", "<script type='text/javascript'>Failure();</script>", false);
                    }


                }

                else
                {
                    string id = ResponseID.ToString();
                    string[] arr = { name,arabic,cntry,User, id };
                    string Value = ObjclsFrms.SaveData("sp_Masters", "UpdateRegion", code, arr);
                    int res = Int32.Parse(Value.ToString());
                    if (res > 0)

                    {
                        ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "tmp", "<script type='text/javascript'>Succcess('Region Updated Successfully');</script>", false);
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
                Response.Redirect("ListRegionMaster.aspx");
            }

            protected void save_Click(object sender, EventArgs e)
            {
                Save();
            }

            protected void btnOK_Click(object sender, EventArgs e)
            {
                Response.Redirect("ListRegionMaster.aspx");
            }

        protected void txtcode_TextChanged(object sender, EventArgs e)
        {
            
        }

        protected void txtname_TextChanged(object sender, EventArgs e)
        {
            
        }

        protected void txtARname_TextChanged(object sender, EventArgs e)
        {
            
        }
    }

 }