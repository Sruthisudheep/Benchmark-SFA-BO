using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text;
using System.Data;
using Telerik.Web.UI;
using System.Configuration;
using System.Web.Security;
using System.Security.Cryptography;
using System.IO;
using Ecosoft.DAL;

namespace SalesForceAutomation.BO_Digits.en
{
    public partial class Users : System.Web.UI.Page
    {
        GeneralFunctions ObjclsFrms = new GeneralFunctions();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {

            }
        }

        public void ListData()
        {
            DataTable lstUser = default(DataTable);
            lstUser = ObjclsFrms.loadList("SelectUser", "sp_Masters");
            grvRpt.DataSource = lstUser;
        }

        protected void lnkAddUser_Click(object sender, EventArgs e)
        {
            Response.Redirect("AddEditUser.aspx");
        }

        protected void grvRpt_NeedDataSource(object sender, Telerik.Web.UI.GridNeedDataSourceEventArgs e)
        {
            ListData();
        }

        protected void grvRpt_ItemCommand(object sender, Telerik.Web.UI.GridCommandEventArgs e)
        {
            if (e.CommandName.Equals("Roles"))
            {
                GridDataItem dataItem = e.Item as GridDataItem;
                string ID = dataItem.GetDataKeyValue("UserId").ToString();
                Response.Redirect("UserRoles.aspx?Id=" + ID);
            }
            if (e.CommandName.Equals("Edit"))
            {
                GridDataItem dataItem = e.Item as GridDataItem;
                string ID = dataItem.GetDataKeyValue("UserId").ToString();
                Response.Redirect("AddEditUser.aspx?Id=" + ID);
            }
            if (e.CommandName.Equals("Reset"))
            {
                GridDataItem dataItem = e.Item as GridDataItem;
                string ID = dataItem.GetDataKeyValue("UserId").ToString();
                ViewState["User"] = null;
                ViewState["UserName"] = null;
                ViewState["Email"] = null;
                ViewState["ID"] = null;
                DataTable lstUserName = ObjclsFrms.loadList("SelectUserNameByUserID", "sp_Masters", ID.ToString());
                if (lstUserName.Rows.Count > 0)
                {
                    string username = lstUserName.Rows[0]["UserName"].ToString();
                    string email = lstUserName.Rows[0]["Email"].ToString();
                    string ids = lstUserName.Rows[0]["ID"].ToString();
                    ViewState["UserName"] = username;
                    ViewState["Email"] = email;
                    ViewState["ID"] = ids;
                }
                ViewState["User"] = ID;
                string uName = ViewState["UserName"].ToString();
                ScriptManager.RegisterStartupScript(this.Page, this.GetType(), "tmp", "<script type='text/javascript'>Confim('" + uName + "');</script>", false);
            }

            if (e.CommandName.Equals("Workflow"))
            {
                
                GridDataItem dataItem = e.Item as GridDataItem;
                string ID = dataItem.GetDataKeyValue("UserId").ToString();
                DataTable lstUserName = ObjclsFrms.loadList("SelectUserNameByUserID", "sp_Masters", ID.ToString());
                if (lstUserName.Rows.Count > 0)
                {
                    string ids = lstUserName.Rows[0]["ID"].ToString();
                    Response.Redirect("ListUserWorkFlow.aspx?UID=" + ids);
                }
                else
                {

                }
                
            }

        }

        protected void btnOK_Click(object sender, EventArgs e)
        {
            Response.Redirect("Users.aspx");
        }

        protected void lnkAdds_Click(object sender, EventArgs e)
        {
            Reset();
        }

        public void Reset()
        {
            string mail = ViewState["Email"].ToString();
            string ID = ViewState["ID"].ToString();
            string userName = ViewState["UserName"].ToString();

            string password = ConfigurationManager.AppSettings.Get("DeffPass");
            UserProfile userProfile = new UserProfile();
            MembershipUser user;
            user = Membership.GetUser(userName);

            if (user != null)
            {

                //DataTable dtLogin = ObjclsFrms.loadList("SelLoginCredentailsForReset", "sp_UserModule", mail.ToString());
                //if (dtLogin.Rows.Count > 0)
                //{
                user.UnlockUser();
                string NewPass = user.ResetPassword();

                string[] arr = { ID.ToString() };
                string svd = ObjclsFrms.SaveData("sp_Masters", "UpdResetPasedStatus", null, arr);

                //string key = ConfigurationManager.AppSettings.Get("ENpublicKey");
                //string encryptPassword = encrypt(NewPass, key);

                Save(NewPass);

            }
            else
            {
                this.ltrlMessage.Text = UICommon.GetErrorMessage("User along with this account not Found");
            }
        }

        public string encrypt(string encryptString, string key)
        {
            string EncryptionKey = "EcoKey%123" + key;
            byte[] clearBytes = Encoding.Unicode.GetBytes(encryptString);
            using (Aes encryptor = Aes.Create())
            {
                Rfc2898DeriveBytes pdb = new Rfc2898DeriveBytes(EncryptionKey, new byte[] {
            0x49, 0x76, 0x61, 0x6e, 0x20, 0x4d, 0x65, 0x64, 0x76, 0x65, 0x64, 0x65, 0x76
        });
                encryptor.Key = pdb.GetBytes(32);
                encryptor.IV = pdb.GetBytes(16);
                using (MemoryStream ms = new MemoryStream())
                {
                    using (CryptoStream cs = new CryptoStream(ms, encryptor.CreateEncryptor(), CryptoStreamMode.Write))
                    {
                        cs.Write(clearBytes, 0, clearBytes.Length);
                        cs.Close();
                    }
                    encryptString = Convert.ToBase64String(ms.ToArray());
                }
            }
            return encryptString;
        }

        public void Save(string Password)
        {
            string userName = ViewState["UserName"].ToString();
            string id, user;
            id = ViewState["ID"].ToString();
            user = UICommon.GetCurrentUserID().ToString();
            string[] arr = { Password.ToString(), user.ToString() };
            DataTable lstClaim = ObjclsFrms.loadList("InsertPasswordEncryptionLog", "sp_Masters", id.ToString(), arr);
            if (lstClaim.Rows.Count > 0)
            {
                ScriptManager.RegisterClientScriptBlock(this.Page, this.GetType(), "tmp", "<script type='text/javascript'>SuccessModal('" + userName + " . The password is " + Password + "');</script>", false);
            }
            else
            {
                ScriptManager.RegisterClientScriptBlock(this.Page, this.GetType(), "tmp", "<script type='text/javascript'>failedModal();</script>", false);
            }
        }
    }
}