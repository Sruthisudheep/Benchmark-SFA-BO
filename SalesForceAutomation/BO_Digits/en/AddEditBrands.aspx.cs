using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Telerik.Web.UI;
using Telerik.Windows.Documents.Spreadsheet.Expressions.Functions;

namespace SalesForceAutomation.BO_Digits.en
{
    public partial class AddEditBrands : System.Web.UI.Page
    {
        GeneralFunctions Obj = new GeneralFunctions();
        public int ResponseID
        {
            get
            {
                int ResponseID;
                int.TryParse(Request.Params["Id"], out ResponseID);

                return ResponseID;
            }
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                ViewState["brdImage"] = "";
                string Id = ResponseID.ToString();
                if (Id.Equals("") || Id == "0")                                //To check whether there is a value for ResponseID or not. For adding there won't be a value.
                {

                }
                else                                                                        //If we are editing there will be a value and the following code will be executed.
                {
                    DataTable lstDatas = Obj.loadList("EditBrand", "sp_Masters", ResponseID.ToString());
                    if (lstDatas.Rows.Count > 0)
                    {
                        string brdname, brdcode, Status,Arabic,brdImage;                                          //Declare the variables

                        brdname = lstDatas.Rows[0]["brd_Name"].ToString();                         //Set the value to the variables
                        brdcode = lstDatas.Rows[0]["brd_Code"].ToString();
                        Status = lstDatas.Rows[0]["Status"].ToString();
                        Arabic = lstDatas.Rows[0]["brd_NameArabic"].ToString();
                        brdImage = lstDatas.Rows[0]["brd_Img"].ToString();


                        txtName.Text = brdname.ToString();                                     //Here the binding is done. "txtName" is the ID of the textBox in ASPX
                        txtCode.Text = brdcode.ToString();
                        txtCode.Enabled = false;
                        ddlStat.SelectedValue = Status.ToString();
                        txtArabic.Text = Arabic.ToString();
                        hpl1.NavigateUrl = brdImage.ToString();
                        hlval1.Value = ResponseID.ToString();
                        img1.ImageUrl = brdImage.ToString();
                        ViewState["brdImage"] = brdImage.ToString();
                    }
                    else                                                              //If there is no value you can leave it as it is.
                    {

                    }
                }

            }

        }
        protected void SaveData(string mode)
        {
            string brdname, brdcode, Status, User, Arabic, brdImage;
            brdname = txtName.Text.ToString();
            brdcode = txtCode.Text.ToString();
            Status = ddlStat.SelectedValue.ToString();
            User = UICommon.GetCurrentUserID().ToString();
            Arabic = txtArabic.Text.ToString();
            brdImage = "";

            int ImageID = 0;
            foreach (UploadedFile uploadedFile in upd1.UploadedFiles)
            {
                ImageID += 1;
                string csvPath = Server.MapPath(("..") + @"/../UploadFiles/Brand/") + ImageID.ToString() + "_" + uploadedFile.FileName;
                uploadedFile.SaveAs(csvPath);
                brdImage = @"../../UploadFiles/Brand/" + ImageID.ToString() + "_" + uploadedFile.FileName.ToString();
                ViewState["Image"] = brdImage.ToString();
            }
            //if (brdImage == "")
            //{
            //    brdImage = ViewState["brdImage"].ToString();
            //}
            //else
            //{
            //    brdImage = ViewState["Image"].ToString();
            //}

            //if (brdImage != null)
            //{
               if (mode.Equals("I"))
                {

                    string[] arr = { brdcode, User, Status, Arabic, brdImage };
                    string value = Obj.SaveData("sp_Masters", "AddBrand", brdname, arr);
                    int res = Int32.Parse(value.ToString());
                    if (res > 0)
                    {
                        ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "tmp", "<script type='text/javascript'>successModal('Brand has been saved Successfully');</script>", false);
                    }
                    else
                    {
                        ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "tmp", "<script type='text/javascript'>failedModal('Some fields are missing ');</script>", false);
                    }
                }
                else
                {
                    brdImage = ViewState["brdImage"].ToString();
                    string ID = ResponseID.ToString();
                    string[] arr = { brdcode, User, Status, Arabic, ID , brdImage };
                    string value = Obj.SaveData("sp_Masters", "UpdateBrand", brdname, arr);
                    int res = Int32.Parse(value.ToString());
                    if (res > 0)
                    {
                        ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "tmp", "<script type='text/javascript'>successModal('Brand has been updated Successfully');</script>", false);
                    }
                    else
                    {
                        ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "tmp", "<script type='text/javascript'>failedModal('Some fields are missing ');</script>", false);
                    }
                }
            ///}
        }
        protected void lnkCancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("ListBrand.aspx");
        }

        protected void lnkSave_Click(object sender, EventArgs e)
        {
            //if ((upd1.UploadedFiles.Count == 0) && (ViewState["brdImage"] == null))
            //{


            //    ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "tmp", "<script type='text/javascript'>failModal();</script>", false);
            //}
            //else
            //{
                ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "tmp", "<script type='text/javascript'>Confim();</script>", false);
            //}
        }

        protected void LinkSave_Click(object sender, EventArgs e)
        {
            try
            {
                if (ResponseID == 0)
                {
                    string mode = "I";
                    SaveData(mode);
                }
                else
                {
                    string mode = "U";
                    SaveData(mode);
                }
            }
            catch (Exception ex)
            {
                String innerMessage = (ex.InnerException != null) ? ex.InnerException.Message : "";
                Obj.LogMessageToFile(UICommon.GetLogFileName(), "AddEditQuestions.aspx PageLoad()", "Error : " + ex.Message.ToString() + " - " + innerMessage);
            }
        }

        protected void btnOK_Click(object sender, EventArgs e)
        {
            Response.Redirect("ListBrand.aspx");
        }

        protected void txtCode_TextChanged(object sender, EventArgs e)
        {
            string code = this.txtCode.Text.ToString();
            DataTable lstCodeChecker = Obj.loadList("CheckBrandCode", "sp_CodeChecker", code);
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
    }
}