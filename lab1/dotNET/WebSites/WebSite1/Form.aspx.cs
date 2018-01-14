using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Form : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (IsPostBack)
        {
            label1.Text = "Data from POST:<br> " + GetPostData();
        }
    }

    protected String GetPostData()
    {
        System.Text.StringBuilder displayValues =
        new System.Text.StringBuilder();
        System.Collections.Specialized.NameValueCollection
            postedValues = Request.Form;
        String nextKey;
        for (int i = 0; i < postedValues.AllKeys.Length; i++)
        {
            nextKey = postedValues.AllKeys[i];
            if (nextKey.Substring(0, 1) != "__")
            {
                displayValues.Append("<br>");
                displayValues.Append(nextKey);
                displayValues.Append(" = ");
                displayValues.Append(postedValues[i]);
            }
        }
        return displayValues.ToString();
    }
}