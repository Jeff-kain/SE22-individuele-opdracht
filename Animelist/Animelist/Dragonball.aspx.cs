using System;
using System.Collections.Generic;
using System.Data.Entity.Spatial;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text;
using System.Threading.Tasks;
using System.Web.ModelBinding;
using System.Web.SessionState;
using Oracle.DataAccess.Client;
using Oracle.DataAccess;
using Oracle.DataAccess.Types;
using System.Data;
using System.Windows;
using System.Configuration;

namespace Animelist
{
    
    public partial class Dragonball : System.Web.UI.Page
    {

        Databaseconnection db = new Databaseconnection();

        /// <summary>
        /// Loads all the comments made on this anime 
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
protected void Page_Load(object sender, EventArgs e)
    {
        if (!this.IsPostBack)
        {
            db.PopulateComments("Dragonball",rptComments);
        }
    }

        /// <summary>
        ///  adds a comment to this anime
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void AddComment(object sender, EventArgs e)
        {
            db.AddComment(txtCommentBody.Text,1,db.Getaccountnr(Session["email"].ToString()));
            Response.Redirect("~/Dragonball.aspx");
        }


        /// <summary>
        /// adds this anime into your personal list
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void Add_Anime(object sender, System.EventArgs e)
        {
            Button btn = (Button)sender;
            switch (btn.ID)
            {
                case "Dragonball_button":
                    db.AddAnime("airing", "Dragonball", "action", 9.1, 2, 2, 2748342, 1234567,
                        Session["email"].ToString());
                    Response.Write("Dragonball has been succesfully added to your list");
                    break;
                case "Full_Metal_Alchemist":
                    db.AddAnime("airing", "Full Metal Alchemist", "action", 7.9, 3, 3, 2546587, 254685,
                        Session["email"].ToString());
                    Response.Write("Full Metal Alchemist has been succesfully added to your list");
                    break;

            }
        }



    }
}