using DocumentFormat.OpenXml.Wordprocessing;
using GoogleApi.Entities.Common.Enums;
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
    public partial class AddEditUsers : System.Web.UI.Page
    {
        GeneralFunctions obj = new GeneralFunctions();
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
                string Id = ResponseID.ToString();

                Store();

                if (Id.Equals("") || Id == "0")                                //To check whether there is a value for ResponseID or not. For adding there won't be a value.
                {

                }
                else                                                                        //If we are editing there will be a value and the following code will be executed.
                {
                    DataTable lstDatas = obj.loadList("EditUsers", "sp_Masters", ResponseID.ToString());
                    if (lstDatas.Rows.Count > 0)
                    {
                        string name, arabic, code, pass, status, istracking, TrackDuration,UserType,isStokecount;                                          //Declare the variables
                        name = lstDatas.Rows[0]["usr_Name"].ToString();
                        arabic = lstDatas.Rows[0]["usr_ArabicName"].ToString();
                        code = lstDatas.Rows[0]["usr_Code"].ToString();
                        pass = lstDatas.Rows[0]["usr_Password"].ToString();
                        status = lstDatas.Rows[0]["Status"].ToString();
                        istracking = lstDatas.Rows[0]["usr_IsTrackingNeeded"].ToString();
                        TrackDuration = lstDatas.Rows[0]["usr_TrackingDuration"].ToString();
                        isStokecount = lstDatas.Rows[0]["IsInstantStockCount"].ToString();
                        UserType = lstDatas.Rows[0]["usr_Type"].ToString();
                        rdappUsrtype.SelectedValue = UserType;
                        if (UserType == "SFA")
                        {
                            Tracking.Visible = true;
                            Stoke.Visible = false;
                            rdDuration.Text = TrackDuration.ToString();
                            ddlTracking.SelectedValue = istracking.ToString();
                        }

                        else
                        {
                            Tracking.Visible = false;
                            Stoke.Visible = true;
                            rdInsStockCount.SelectedValue = isStokecount;
                            DataTable store = obj.loadList("SelStoreByUserID", "sp_Masters", ResponseID.ToString());
                            if (store.Rows.Count > 0)
                            {
                                string strID = store.Rows[0]["strID"].ToString();
                                string[] ar = strID.Split(',');
                                for (int i = 0; i < ar.Length; i++)
                                {
                                    foreach (RadComboBoxItem items in rdStore.Items)
                                    {
                                        if (items.Value == ar[i])
                                        {
                                            items.Checked = true;
                                        }
                                    }
                                }
                            }
                        }

                        txtName.Text = name.ToString();
                        txtArabic.Text = arabic.ToString();
                        txtCode.Text = code.ToString();
                        txtPass.Text = pass.ToString();
                        ddlStatus.SelectedValue = status.ToString();
                        txtCode.Enabled = false;
                       
                        txtCode.Enabled = false;

                        //DataTable store = obj.loadList("SelStoreByUserID", "sp_Masters", ResponseID.ToString());
                        //if (store.Rows.Count > 0)
                        //{
                        //    string strID= store.Rows[0]["strID"].ToString();
                        //    string[] ar = strID.Split(',');
                        //    for (int i = 0; i < ar.Length; i++)
                        //    {
                        //        foreach (RadComboBoxItem items in rdStore.Items)
                        //        {
                        //            if (items.Value == ar[i])
                        //            {
                        //                items.Checked = true;
                        //            }
                        //        }
                        //    }
                        //}
                    }
                    else                                                              //If there is no value you can leave it as it is.
                    {

                    }
                }
            }

        }
        public void Store()
        {

            rdStore.DataSource = obj.loadList("SelStoreforAppUser", "sp_Masters");
            rdStore.DataTextField = "str_Name";
            rdStore.DataValueField = "str_ID";
            rdStore.DataBind();
        }
        public string str()
        {
            var CollectionMarket = rdStore.CheckedItems;
            string strID = "";
            int j = 0;
            int MarCount = CollectionMarket.Count;
            if (CollectionMarket.Count > 0)
            {
                foreach (var item in CollectionMarket)
                {
                    if (j == 0)
                    {
                        strID += item.Value + ",";
                    }
                    else if (j > 0)
                    {
                        strID += item.Value + ",";
                    }
                    if (j == (MarCount - 1))
                    {
                        strID += item.Value;
                    }
                    j++;
                }
                return strID;
            }
            else
            {
                return "0";
            }

        }

        public void UserStoresSave(string id)
        {
            var CollectionMarket = rdStore.CheckedItems;
            string Id = (id==""?ResponseID.ToString():id);
            int MarCount = CollectionMarket.Count;
            if (CollectionMarket.Count > 0)
            {
                foreach (var item in CollectionMarket)
                {
                    string[] arr = { item.Value };
                    string ustvalue = obj.SaveData("sp_Masters", "InsertUserStores", Id, arr);
                    
                }
            }
        }

        public void Save()
        {
            string name, arabic, code, User, pass, Status, istracking, TrackDuration,IsInstatStockCount,usertype;
            name = this.txtName.Text.ToString();
            arabic = this.txtArabic.Text.ToString();
            code = this.txtCode.Text.ToString();
            pass = this.txtPass.Text.ToString();
            User = UICommon.GetCurrentUserID().ToString();
            Status = this.ddlStatus.SelectedValue.ToString();
            istracking = this.ddlTracking.SelectedValue.ToString();
            TrackDuration = this.rdDuration.Text.ToString();
            IsInstatStockCount= this.rdInsStockCount.SelectedValue.ToString();
            usertype = this.rdappUsrtype.SelectedValue.ToString();

            if (ResponseID.Equals("") || ResponseID == 0)
            {
                string[] arr = { code, pass, User, Status, istracking, TrackDuration, arabic, IsInstatStockCount, usertype };
                string Value = obj.SaveData("sp_Masters", "InsertUser", name, arr);
                try
                {
                    int res = Int32.Parse(Value.ToString());

                    if (res > 0)
                    {
                        UserStoresSave(res.ToString());
                        ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "tmp", "<script type='text/javascript'>Succcess('User details has been saved successfully');</script>", false);
                    
                    }
                    else
                    {
                        ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "tmp", "<script type='text/javascript'>Failure();</script>", false);
                    }
                }
                catch (Exception ex)
                {
                    ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "tmp", "<script type='text/javascript'>Failure();</script>", false);
                }

            }
            else
            {
                string ID = ResponseID.ToString();
                string[] arr = { code, pass, User, Status, ID, istracking, TrackDuration, arabic, IsInstatStockCount, usertype };
                string value = obj.SaveData("sp_Masters", "UpdateUser", name, arr);
                int res = Int32.Parse(value.ToString());
                if (res > 0)
                {
                    try
                    {
                        DataTable delData = obj.loadList("DeleteUserStores", "sp_Masters", ID.ToString());
                        UserStoresSave("");
                        ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "tmp", "<script type='text/javascript'>Succcess('User details has been updated successfully');</script>", false);
                    }
                    catch(Exception ex)
                    {
                        ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "tmp", "<script type='text/javascript'>Failure();</script>", false);
                    }
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
            Response.Redirect("ListUsers.aspx");
        }

        protected void save_Click(object sender, EventArgs e)
        {
            Save();
        }

        protected void btnOK_Click(object sender, EventArgs e)
        {
            Response.Redirect("ListUsers.aspx");
        }

        protected void txtCode_TextChanged(object sender, EventArgs e)
        {
            string code = this.txtCode.Text.ToString();
            DataTable lstCodeChecker = obj.loadList("CheckUsersCode", "sp_CodeChecker", code);
            if (lstCodeChecker.Rows.Count > 0)
            {
                lblCodeDupli.Text = "Code Already Exist";
                lnkSave.Enabled = false;
                lblCodeDupli.Visible = true;
            }
            else
            {
                lnkSave.Enabled = true;
                lblCodeDupli.Visible = false;
            }
        }

        protected void rdappUsrtype_SelectedIndexChanged(object sender, DropDownListEventArgs e)
        {
            string FS = rdappUsrtype.SelectedValue.ToString();

            if (FS.Equals("SFA"))
            {
                Tracking.Visible = true;
                Stoke.Visible = false;
            }

            else
            {
                Tracking.Visible = false;
                Stoke.Visible = true;
            }
        }
    }
}