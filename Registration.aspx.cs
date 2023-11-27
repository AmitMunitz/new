using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace End_Project
{
    public partial class Registration : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack)
            {
                if (Request.Form["save"] != null)
                {
                    string tmpUserName = Request.Form["uname"];
                    Session["uname"] = tmpUserName;
                    string tmpcolor = Request.Form["color"];
                    Session["PreferredColor"] = tmpcolor;
                    if (Search())
                    {
                        errorMsg.Visible = true;
                    }
                    else
                    {
                        Application["users"] = (int)Application["users"] + 1;
                        int rowsAffectedNum = UpdateTable();
                        Response.Redirect("home.aspx");
                    }
                }
            }
        }
        public bool Search()
        {
            string fileName = "DBase.accdb";
            bool check = false;

            string username = Request["uname"];
            DataTable DT = new DataTable();
            string sqlQuery = "select * FROM Registration WHERE Username = '" + username + "'";
            ;
            AdoHelper adoHelper = new AdoHelper(fileName);
            DT = adoHelper.GeDataTable(sqlQuery);
            int rowCount = DT.Rows.Count;

            if (rowCount > 0)
            {
                check = true;
            }
            return check;
        }

        public int UpdateTable()
        {
            string fileName = "DBase.accdb";

            string tmpUserName = Request.Form["uname"];
            string tmpFirstName = Request.Form["fname"];
            string tmpLastName = Request.Form["lname"];
            string tmpGender = Request.Form["gender"];
            string tmpBirthday = Request.Form["birthday"];
            string tmpemail = Request.Form["email"];
            string tmpId = Request.Form["id"];
            string tmpaddress = Request.Form["address"];
            string tmpPsw = Request.Params["password"];
            string tmpcolor = Request.Form["color"];
            string sqlQuery = "INSERT INTO Registration (FirstName, LastName, UserName, PLA ,Email ,Color ,Address, ID, Gender, Birthday) " +
                " VALUES ('" + tmpFirstName + "','" + tmpLastName + "','" + tmpUserName + "','" + tmpPsw + "','" + tmpemail + "','" + tmpcolor + "','" + tmpaddress + "','" + tmpId + "','" + tmpGender + "','" + tmpBirthday + "')";
            AdoHelper adoHelper = new AdoHelper(fileName);
            int rowsAffectedNum = adoHelper.ExecuteQueryOperation(sqlQuery);

            return rowsAffectedNum;
        }

    }
}