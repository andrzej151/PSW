using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication8
{
    public partial class Contact : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            FormData.Visible = IsPostBack;
            if (IsPostBack)
            {
                List<string> keys = Request.Form.AllKeys.ToList().FindAll(x => x[0] != '_' && !x.Contains("Submit") );
                string[] properKeys = keys.ToArray();
                FormData.Text = string.Join("<br>", keys.Select(x => x + " = " + Request.Form[x]));
            }
        }
    }
}