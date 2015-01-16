using System;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using Animelist;

namespace AnimelistTest
{
    [TestClass]
    public class AnimelistTests
    {
        [TestMethod]
        public void TestAddAnime()
        {
            Animelist.Databaseconnection db = new Animelist.Databaseconnection();
            db.AddAnime("Airing", "Dragonball", "Action", 9.1, 2, 2, 2748342, 1234567, "Jeffrey_kain@hotmail.com");
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
            db.AddComment("Test", 1, db.Getaccountnr("Jeffrey_kain@hotmail.com"));
        }
    }
}
