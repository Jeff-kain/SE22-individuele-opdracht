using System;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using Animelist;
using System.Collections.Generic;
using System.Linq;
using Oracle.DataAccess;
using Oracle.DataAccess.Client;
using System.Text;
using System.Web;
using System.Threading.Tasks;

namespace AnimelistTest
{
    
    [TestClass]
    public class AnimelistTests
    {
         private OracleConnection conn = new OracleConnection();
        
        [TestMethod]
        public void TestAddAnime()
        {

            Animelist.Databaseconnection db = new Animelist.Databaseconnection();
            db.AddAnime("Airing", "Dragonball", "Action", 9.1, 2, 2, 2748342, 1234567, "Jeff@hotmail.com");
        }
        [TestMethod]
        public void TestAddUser()
        {  
            Animelist.Databaseconnection db = new Animelist.Databaseconnection();
            db.AddUser("Jeff@hotmail.com", "Password");
        }
        [TestMethod]
        public void TestAddComment()
        {
                  
            Animelist.Databaseconnection db = new Animelist.Databaseconnection();
            db.AddComment("Test", 1, db.Getaccountnr("Jeff@hotmail.com"));
        }
    }
}
