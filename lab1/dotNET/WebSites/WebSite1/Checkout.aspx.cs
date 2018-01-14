using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Checkout : System.Web.UI.Page
{
    Hashtable cart = new Hashtable();
    List<Hashtable> products = new List<Hashtable>();
    double productsTotal = 0;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["products"] != null)
        {
            products = (List<Hashtable>)Session["products"];
        }

        if (Session["cart"] != null)
        {
            cart = (Hashtable)Session["cart"];
            string infos = "";
            foreach (DictionaryEntry entry in cart)
            {
                string name = (string)entry.Key;
                name = name.Substring(0, name.IndexOf(" "));
                double price = 0;
                foreach (Hashtable ht in products)
                {
                    if (ht.Contains(name))
                    {
                        price = (double)ht[name];
                    }
                }

                int quantity = (int)entry.Value;
                double thisEntryPrice = quantity * price;
                productsTotal += thisEntryPrice;
                string info = "Name: " + name + " Quantity: " + quantity + "<br />"
                    + "&nbsp;&nbsp;&nbsp;&nbsp" + ("" + quantity) + ("x " + price) + " = " + thisEntryPrice + "<br />";
                infos += info;
            }
            this.labelProdukty.Text = infos;
            this.labelZaProdukty.Text = "Warość produktów: " + productsTotal;
        }
    }

    private void EnableConfirmButtonIfSuitable()
    {
        if (cart.Count > 0)
        {
            confirmButton.Enabled = true;
        }
    }

    protected void RadioButtonListDostawa_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (this.RadioButtonListDostawa.SelectedValue == "ekonomiczny")
        {
            EnableConfirmButtonIfSuitable();
            labelPodsumowanie.Text = "Całkowity koszt: " + (productsTotal + 3.5);
            Session["shipping"] = new Pair("List ekonomiczny", 3.5);
        }
        else if (this.RadioButtonListDostawa.SelectedValue == "polecony")
        {
            EnableConfirmButtonIfSuitable();
            labelPodsumowanie.Text = "Całkowity koszt: " + (productsTotal + 5.5);
            Session["shipping"] = new Pair("List polecony", 5.5);
        }
        else if (this.RadioButtonListDostawa.SelectedValue == "kurier")
        {
            EnableConfirmButtonIfSuitable();
            labelPodsumowanie.Text = "Całkowity koszt: " + (productsTotal + 15.0);
            Session["shipping"] = new Pair("Kurier", 15.0);
        }
    }

    protected void backToProductsButton_add(object sender, EventArgs e)
    {
        Response.Redirect("Products.aspx");
    }

    protected void confirmButton_add(object sender, EventArgs e)
    {
        Response.Redirect("OrderSummary.aspx");
    }
    protected void clearCartButton_add(object sender, EventArgs e)
    {
        Session["cart"] = null;
        Response.Cookies.Remove("numCart");
        Response.Redirect(HttpContext.Current.Request.Url.ToString(), true);
    }
}