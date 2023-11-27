using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace End_Project
{
    public partial class Test : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            TelAviv();
            EndsWith();
            under8();
        }
        public void TelAviv()
        {
            //string sql = "select username from registration where gender = 'female' and address = 'Tel Aviv'";
            string sqlQuery = "SELECT Username as 'User names of people from Tel Aviv' FROM Registration WHERE Address = 'Tel Aviv' and Gender = 'Female'";
            string fileName = "DBase.accdb";
            AdoHelper adoHelper = new AdoHelper(fileName);
            string tableData = adoHelper.GetPrintDataTableStr(sqlQuery);
            string dataHead = "<br>Table:<br>";
            display1Div.InnerHtml = dataHead + tableData;
        }
        public void EndsWith()
        {
            string sqlQuery = "SELECT Username FROM Registration WHERE Email LIKE '%@gmail.com' and Gender = 'Male'";
            string fileName = "DBase.accdb";
            AdoHelper adoHelper = new AdoHelper(fileName);
            string tableData = adoHelper.GetPrintDataTableStr(sqlQuery);
            string dataHead = "<br>Table:<br>";
            display2Div.InnerHtml = dataHead + tableData;
        }

        public void under8()      
        {
            string sqlQuery = "SELECT YEAR(DATE()) - YEAR(birthday) as Age FROM Registration WHERE YEAR(DATE()) - YEAR(birthday) < 8";
             string fileName = "DBase.accdb";
            AdoHelper adoHelper = new AdoHelper(fileName);
            string tableData = adoHelper.GetPrintDataTableStr(sqlQuery);
            string dataHead = "<br>Table:<br>";
            display3Div.InnerHtml = dataHead + tableData;
        }
    }
}   

