using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.SessionState;
using System.Data;

namespace End_Project
{
    public class Global : System.Web.HttpApplication
    {

        protected void Application_Start(object sender, EventArgs e)
        {
            string sqlQuery = "select * from Registration";
            string fileName = "DBase.accdb";
            DataTable DT = new DataTable();
            AdoHelper adoHelper = new AdoHelper(fileName);
            DT = adoHelper.GeDataTable(sqlQuery);
            int rowCount = DT.Rows.Count;
            Application["users"] = rowCount;
        }

        protected void Session_Start(object sender, EventArgs e)
        {
            Session["Admin"] = false;
            Session["PreferredColor"] = "White";
            Session["uname"] = "Guest";
        }

        protected void Application_BeginRequest(object sender, EventArgs e)
        {

        }

        protected void Application_AuthenticateRequest(object sender, EventArgs e)
        {

        }

        protected void Application_Error(object sender, EventArgs e)
        {

        }

        protected void Session_End(object sender, EventArgs e)
        {

        }

        protected void Application_End(object sender, EventArgs e)
        {

        }
    }
}