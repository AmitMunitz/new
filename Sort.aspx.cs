using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace End_Project
{
    public partial class Sort : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            PrintTableData1();
            if (IsPostBack)
            {
                if (Request.Form["sortby"] != null)
                {
                    PrintTableData();
                }


            }

        }
        public void PrintTableData()
        {
            string tmpasc = Request.Form["AscOrDesc"];
            string tmpsortby = Request.Form["sort"];
            string sqlQuery = "SELECT FirstName,LastName,Username,PLA,Email,Color,Address,ID,Gender,format(Birthday, 'yyyy-mm-dd') as Birthdate,Admin FROM Registration ORDER BY " + tmpsortby + " " + tmpasc;
            string fileName = "DBase.accdb";
            AdoHelper adoHelper = new AdoHelper(fileName);
            string dataHead = "<br>Table:<br>";
            string tableData = adoHelper.GetPrintDataTableStr(sqlQuery);
            display1Div.InnerHtml = $"<div class=\"UsersRow\">{dataHead}{tableData}</div>";
        }
        public void PrintTableData1()
        {
            string sqlQuery = "SELECT FirstName,LastName,Username,PLA,Email,Color,Address,ID,Gender,format(Birthday, 'yyyy-mm-dd') as Birthdate,Admin From Registration";
            string fileName = "DBase.accdb";
            AdoHelper adoHelper = new AdoHelper(fileName);
            string dataHead = "<br>Table:<br>";
            string tableData = adoHelper.GetPrintDataTableStr(sqlQuery);
            display1Div.InnerHtml = $"<div class=\"UsersRow\">{dataHead}{tableData}</div>";

        }
    }
}