using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace End_Project
{
    public partial class Main : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["uname"].ToString() == "Guest")
            {
                logout.Value = "login";
                if (Request.Form["ctl00$logout"] != null)
                {
                    Response.Redirect("LogIn.aspx");
                }
            }
            else
            {
                if (IsPostBack)
                {
                    if (Request.Form["ctl00$logout"] != null)
                    {
                        Session.Clear();
                        Session["Admin"] = false;
                        Session["PreferredColor"] = "White";
                        Session["uname"] = "Guest";
                        Response.Redirect("Menu.aspx");
                    }
                }
            }

        }
    }    
}