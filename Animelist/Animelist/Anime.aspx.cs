using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.Owin;
using Owin;
using Animelist.Models;
using System.Data;
using Animelist.Account;

namespace Animelist
{
    public partial class About : Page
    {
        
        Databaseconnection db = new Databaseconnection();
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        /// <summary>
        /// Connects to the db to add an anime to your personal list
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        public void Add_Anime(object sender, System.EventArgs e)
        {
                Button btn = (Button) sender;
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


        public string Getemail(String email)
        {
            return email;
        }
    }
}