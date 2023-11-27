using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace End_Project
{
    public partial class Search : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack)
            {
                if (Request.Form["AdvanceSearch"] != null)
                {
                    if (Request.Form["Uname"] == "" || Request.Form["firstNameDel"] == "" || Request.Form["lastNameDel"] == "")
                    {
                        display1Div.InnerHtml = "";
                    }
                    else {
                        PrintTableData(Request.Form["Uname"], Request.Form["firstNameDel"], Request.Form["lastNameDel"]); 
                    }          
                }
                if (Request.Form["UpdateField"] != null)
                {
                    if (Request.Form["UserNameUpdate"] != "")
                    {
                        PrintTableData1();
                    }
                    else {
                        display1Div.InnerHtml = ""; 
                    }
                }
            }

        }
        public void PrintTableData(string username, string firstName, string lastName)
        {
            string sqlQuery = "SELECT FirstName,LastName,Username,PLA,Email,Color,Address,ID,Gender,format(Birthday, 'yyyy-mm-dd') as Birthdate,Admin FROM Registration WHERE Username = '" + username + "' AND LastName = '" + lastName + "' AND FirstName = '" + firstName + "'";
            string fileName = "DBase.accdb";
            AdoHelper adoHelper = new AdoHelper(fileName);
            DataTable DT = new DataTable();
            DT = adoHelper.GeDataTable(sqlQuery);
            int rowCount = DT.Rows.Count;
            string dataHead = "<br>Table:<br>";
            string tableData = adoHelper.GetPrintDataTableStr(sqlQuery);
            if (rowCount > 0)
            {
                errorMsg.Visible = false;
                errorMsg1.Visible = false;
                display1Div.InnerHtml = $"<div class=\"UsersRow\">{dataHead}{tableData}</div>";
            }
            else
            {
                errorMsg1.Visible = true;
                errorMsg.Visible = false;
                display1Div.InnerHtml = "";
            }
        }
        public void PrintTableData1()
        {
            string username = Request.Form["UserNameUpdate"];
            string sqlQuery = "SELECT FirstName,LastName,Username,PLA,Email,Color,Address,ID,Gender,format(Birthday, 'yyyy-mm-dd') as Birthdate,Admin FROM Registration WHERE Username LIKE '" + username + "%'";
            //like '" + username + "%'
            string fileName = "DBase.accdb";
            AdoHelper adoHelper = new AdoHelper(fileName);
            DataTable DT = new DataTable();
            DT = adoHelper.GeDataTable(sqlQuery);
            int rowCount = DT.Rows.Count;
            string dataHead = "<br>All UserNames That Start With '" + username + "' are: <br>";
            string tableData = adoHelper.GetPrintDataTableStr(sqlQuery);
            if (rowCount > 0)
            {
                errorMsg.Visible = false;
                errorMsg1.Visible = false;
                display1Div.InnerHtml = $"<div class=\"UsersRow\">{dataHead}{tableData}</div>";
            }
            else
            {
                errorMsg1.Visible = false;
                errorMsg.Visible = true;
                display1Div.InnerHtml = "";
            }
        }
    }
}