using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace End_Project
{
    public partial class ForgotPassword : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack)
            {

                if (Request.Form["sub"] != null)
                {
                    string tmpusername = Request.Form["un"];
                    string tmpemail = Request.Form["email"];
                    string tmpnewValue = Request.Form["pa"];
                    int rowsAffectedNum = UpdateTable(tmpusername, tmpemail, tmpnewValue);
                    if (rowsAffectedNum > 0)
                    {
                        errorMsg.Visible = false;
                        PrintTableData();
                    }
                    else
                    {
                        errorMsg.Visible = true;
                        display1Div.InnerHtml = "";
                    }
                }
            }
        }
        public int UpdateTable(string username, string email, string newValue)
        {
            string sqlQuery = "UPDATE Registration SET PLA = '" + newValue + "' WHERE Username = '" + username + "' AND Email = '" + email + "'";
            string fileName = "DBase.accdb";
            AdoHelper adoHelper = new AdoHelper(fileName);
            int rowsAffectedNum = adoHelper.ExecuteQueryOperation(sqlQuery);
            return rowsAffectedNum;
        }
        public void PrintTableData()
        {
            string username = Request.Form["un"];
            string pass = Request.Form["pa"];
            string sqlQuery = "SELECT FirstName,LastName,'will not show you ha ha ha(all i can say is you updated it successfully)' as NewPassword FROM Registration WHERE Username = '" + username + "' AND PLA = '" + pass + "'";
            string fileName = "DBase.accdb";
            AdoHelper adoHelper = new AdoHelper(fileName);
            string dataHead = "<br>Here is you Updated Info:<br>";
            string tableData = adoHelper.GetPrintDataTableStr(sqlQuery);
            display1Div.InnerHtml = $"<div class=\"UsersRow\">{dataHead}{tableData}</div>";
        }

    }
}