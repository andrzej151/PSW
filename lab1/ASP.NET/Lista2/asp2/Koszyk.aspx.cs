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
    public partial class _Koszyk : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Cart.Items.Count == 0)
            {
                var products = Session.Keys.OfType<string>().Select(x => Session[x]).Cast<Product>().ToArray();
                foreach (var product in products)
                {
                    Cart.Items.Add(product.Name + " - " + product.Count + "kg");
                    Cart.Items[Cart.Items.Count - 1].Value = product.Name;
                }
            }
            Refresh();
        }

        protected void RemoveProducts(object sender, EventArgs e)
        {
            var selected = Cart.Items.Cast<ListItem>().Where(x => x.Selected).ToArray();
            foreach (var product in selected)
            {
                Cart.Items.Remove(product);
                Session.Remove(product.Value);
            }
            Refresh();
        }

        private void Refresh()
        {
            var products = Cart.Items.Cast<ListItem>().ToArray();
            var selected = products.Where(x => x.Selected);
            Remove.Visible = selected.Any();
            Cart.Visible = CartInfo.Visible = products.Any();
            var totalPrice = products.Select(x => (Product) Session[x.Value]).Sum(x => x.Count*x.Price);
            Total.Text = totalPrice > 0 ? "Łączna wartość produktów w koszyku: " + totalPrice + " zł." : "Brak towarów w koszyku.";
        }

        protected void Cart_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
    }
}