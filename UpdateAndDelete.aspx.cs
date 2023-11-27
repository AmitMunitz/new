using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace End_Project
{
    public partial class UpdateAndDelete : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            PrintTableData();
            if (IsPostBack)
            {
                if (Request.Form["Delete"] != null)
                {
                    DeleteRows();
                    PrintTableData();
                    Application["users"] = (int)Application["users"] - 1;
                }
                else if (Request.Form["UpdateField"] != null)
                {
                    string tmpUserName = Request.Form["UserNameUpdate"];
                    string tmpField = Request.Form["FieldNameUpdate"];
                    string tmpNewValue = Request.Form["ValueUpdate"];
                    UpdateTable(tmpUserName, tmpField, tmpNewValue);
                    PrintTableData();
                }
            }
        }
        public int DeleteRows()
        {
            string tmpUsernameameDel = Request.Form["UsernameDel"];
            string tmpPassDel = Request.Form["PLADel"];
            string sqlQuery = "delete from Registration where Username='" + tmpUsernameameDel + "' and PLA='" + tmpPassDel + "'";
            string fileName = "DBase.accdb";
            AdoHelper adoHelper = new AdoHelper(fileName);
            int rowsAffectedNum = adoHelper.ExecuteQueryOperation(sqlQuery);
            return rowsAffectedNum;
        }
        public void PrintTableData()
        {
            string sqlQuery = "SELECT FirstName,LastName,Username,PLA,Email,Color,Address,ID,Gender,format(Birthday, 'yyyy-mm-dd') as Birthdate FROM Registration";
            string fileName = "DBase.accdb";
            AdoHelper adoHelper = new AdoHelper(fileName);
            string dataHead = "<br>Table:<br>";
            string tableData = adoHelper.GetPrintDataTableStr(sqlQuery);
            display1Div.InnerHtml = $"<div class=\"UsersRow\">{dataHead}{tableData}</div>";

        }
        public int UpdateTable(string username, string fieldToUpdate, string newValue)
        {

            string sqlQuery = "UPDATE Registration " + "SET " + fieldToUpdate + "='" + newValue + "' " + "WHERE Username='" + username + "'";
            string fileName = "DBase.accdb";
            AdoHelper adoHelper = new AdoHelper(fileName);
            int rowsAffectedNum = adoHelper.ExecuteQueryOperation(sqlQuery);
            return rowsAffectedNum;
        }



    }
}