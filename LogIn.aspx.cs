using System;
using System.Collections.Generic;
using System.Linq;
using System.Data;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace End_Project
{
    public partial class LogIn : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            if (IsPostBack)
            {

                if (Request.Form["sub"] != null)
                {
                    GetColor();
                    IsAdmin();
                    if (Search())
                    {
                        Session["uname"] = Request.Form["un"];
                        Response.Redirect("Home.aspx");
                    }
                    else {
                        errorMsg.Visible = true;
                    }


                }
            }
        }
        public bool Search()
        {
            string fileName = "DBase.accdb";
            bool check = false;

            string tmpun = Request["un"];
            DataTable DT = new DataTable();
            string tmppass = Request["pa"];
            string sqlQuery = "select * from Registration where Username='" + tmpun + "' and PLA = '" + tmppass + "'";
            AdoHelper adoHelper = new AdoHelper(fileName);
            DT = adoHelper.GeDataTable(sqlQuery);
            int rowCount = DT.Rows.Count;

            if (rowCount > 0)
            {
                check = true;
            }
            return check;
        }

      
            public void IsAdmin()
            {
                string tmpun = Request["un"];
                string tmppass = Request["pa"];
                string sqlQuery = "SELECT Admin FROM Registration WHERE Username='" + tmpun + "' AND PLA='" + tmppass + "'";

                DataTable DT = new DataTable();
                string fileName = "DBase.accdb";
                AdoHelper adoHelper = new AdoHelper(fileName);
                DT = adoHelper.GeDataTable(sqlQuery);

                if (DT.Rows.Count > 0)
                {
                    bool isAdmin = Convert.ToBoolean(DT.Rows[0]["Admin"]);
                    if (isAdmin)
                    {
                        Session["Admin"] = true;
                    }
                }
            }

        public void GetColor()
        {
            string tmpun = Request["un"];
            string tmppass = Request["pa"];
            string sqlQuery = "SELECT Color FROM Registration WHERE Username='" + tmpun + "' AND PLA='" + tmppass + "'";

            DataTable DT = new DataTable();
            string fileName = "DBase.accdb";
            AdoHelper adoHelper = new AdoHelper(fileName);
            DT = adoHelper.GeDataTable(sqlQuery);

            if (DT.Rows.Count > 0)
            {
                string Color = DT.Rows[0]["Color"].ToString();
                Session["PreferredColor"] = Color;
            }

        }
    }
}
        