using System;
using System.Collections;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Collections.Generic;

public partial class Products : System.Web.UI.Page
{


    Hashtable hedgehogs = new Hashtable();
    Hashtable smartphones = new Hashtable();
    Hashtable food = new Hashtable();
    Hashtable cart = new Hashtable();

    List<Hashtable> products = new List<Hashtable>();

    int productsInCart = 0;

    protected void Page_Load(object sender, EventArgs e)
    {
        products.AddRange(new List<Hashtable>() { hedgehogs, smartphones, food });

        hedgehogs.Add("first", 1.34);
        hedgehogs.Add("second", 7.54);

        smartphones.Add("nokia", 5.47);
        smartphones.Add("samsung", 4.35);
        smartphones.Add("siajomi", 23.5);

        food.Add("food1", 1.22);
        food.Add("food2", 66.34);
        food.Add("food3", 12.24);
        food.Add("food4", 34.23);

        if (Session["cart"] != null)
        {
            cart = (Hashtable)Session["cart"];
        }

        if (HttpContext.Current.Request.Cookies["numCart"] != null)
            productsInCart += Int32.Parse(HttpContext.Current.Request.Cookies["numCart"].Value);
        int inCart = 0;
        foreach (DictionaryEntry entry in cart)
        {
            int quantity = (int)entry.Value;
            inCart += quantity;
        }
        this.labelCart.Text = "Products in Cart: " + inCart;
    }

    protected void RadioButtonList1_SelectedIndexChanged(object sender, EventArgs e)
    {
        this.CheckBoxList1.Items.Clear();
        Hashtable products;
        if (this.RadioButtonList1.SelectedValue == "hedgehogs")
        {
            products = hedgehogs;
        }
        else if (this.RadioButtonList1.SelectedValue == "smartphones")
        {
            products = smartphones;
        }
        else if (this.RadioButtonList1.SelectedValue == "food")
        {
            products = food;
        }
        else
        {
            products = null;
        }

        if (products != null)
        {
            foreach (DictionaryEntry pair in products)
            {
                this.CheckBoxList1.Items.Add(pair.Key + " | " + pair.Value + " PLN");
            }
            this.productsDiv.Visible = true;
        }
        else
        {
            this.productsDiv.Visible = false;
        }
    }

    protected void addToCartButton_add(object sender, EventArgs e)
    {
        if (this.productsDiv.Visible == true)
        {
            putProductsIntoCart();
            if (HttpContext.Current.Request.Cookies["numCart"] != null)
            {
                int tmp = Int32.Parse(HttpContext.Current.Request.Cookies["numCart"].Value);
                tmp += numberOfSelectedItems();
                var response = HttpContext.Current.Response;
                response.Cookies.Remove("numCart");
                HttpCookie cookie = new HttpCookie("numCart", tmp.ToString());
                response.Cookies.Add(cookie);
            }
            else
            {
                var response = HttpContext.Current.Response;
                HttpCookie cookie = new HttpCookie("numCart", numberOfSelectedItems().ToString());
                response.Cookies.Add(cookie);
            }
            productsInCart += Int32.Parse(HttpContext.Current.Request.Cookies["numCart"].Value);
        }
        Response.Redirect(HttpContext.Current.Request.Url.ToString(), true);

    }



    protected void putProductsIntoCart()
    {

        for (int i = 0; i < CheckBoxList1.Items.Count; i++)
        {
            if (CheckBoxList1.Items[i].Selected == true)
            {
                if (cart[CheckBoxList1.Items[i].Value] == null)
                {
                    cart.Add(CheckBoxList1.Items[i].Value, 1);
                }
                else
                {
                    int tmp = (int)cart[CheckBoxList1.Items[i].Value];
                    cart.Remove(CheckBoxList1.Items[i].Value);
                    cart.Add(CheckBoxList1.Items[i].Value, tmp + 1);
                }
            }
        }
        Session["cart"] = cart;
    }

    protected int numberOfSelectedItems()
    {
        int count = 0;
        for (int i = 0; i < CheckBoxList1.Items.Count; i++)
        {
            if (CheckBoxList1.Items[i].Selected == true)
            {
                count = count + 1;
            }
        }

        return count;
    }

    protected void checkoutButton_run(object sender, EventArgs e)
    {
        Session["products"] = products;
        Response.Redirect("Checkout.aspx");
    }
}