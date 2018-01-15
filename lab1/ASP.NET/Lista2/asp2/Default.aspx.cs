using System.Collections.Specialized;
using Microsoft.AspNet.Membership.OpenAuth;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Laboratorium_10
{
    class Product
    {
        public string Name { get; set; }
        public int Count { get; set; }
        public decimal Price { get; set; }
    }

    public partial class _Default : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //if (!IsPostBack) return;
            Update();
            Refresh(this, null);
        }

        protected void Refresh(object sender, EventArgs e)
        {
            Fruits.Visible = Vegetables.Visible = Bread.Visible = Milk.Visible = false;
            switch (Categories.SelectedItem.Value)
            {
                case "Fruits":
                    Fruits.Visible = true;
                    break;
                case "Vegetables":
                    Vegetables.Visible = true;
                    break;
                case "Bread":
                    Bread.Visible = true;
                    break;
                case "Milk":
                    Milk.Visible = true;
                    break;
            }
        }

        public void Buy(object sender, EventArgs e)
        {
            var all = new List<ListItem>();
            all.AddRange(Fruits.Items.Cast<ListItem>());
            all.AddRange(Vegetables.Items.Cast<ListItem>());
            all.AddRange(Bread.Items.Cast<ListItem>());
            all.AddRange(Milk.Items.Cast<ListItem>());
            foreach (var product in all.Where(x => x.Selected))
            {
                AddToCart(product.Text, decimal.Parse(product.Value));
                product.Selected = false;
            }
            Update();
        }

        private void AddToCart(string name, decimal price)
        {
            if (Session[name] == null)
                Session[name] = new Product {Name = name, Price = price, Count = 1};
            else
                ((Product) Session[name]).Count++;
        }

        private void Update()
        {
            if (Session.Count > 0)
            {
                var products = Session.Keys.OfType<string>().Select(x => Session[x]).Cast<Product>().ToArray();
                var count = products.Sum(x => x.Count);
                CartInfoCount.Text = "Produktów w koszyku: " + count;
                CartInfoProducts.Text = products.Aggregate("", (current, product) => current + (product.Name + " - " + product.Count + "kg<br />"));
            }
            CartInfoCount.Visible = Session.Count > 0;
            CartInfoProducts.Visible = Session.Count > 0;
        }
    }
}