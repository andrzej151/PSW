using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class OrderSummary : System.Web.UI.Page
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
            this.labelPodsumowanie.Text = infos;

            Pair shippingMethod = (Pair)Session["shipping"];
            this.labelDostawa.Text = "Dostawa: " + (string)shippingMethod.First + ", " + (double)shippingMethod.Second;
            this.labelTotal.Text = "" + (productsTotal + (double)shippingMethod.Second);
        }
    }
}