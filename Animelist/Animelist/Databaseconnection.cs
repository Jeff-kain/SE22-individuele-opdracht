using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Web.ModelBinding;
using System.Web.SessionState;
using System.Web.UI.WebControls;
using Oracle.DataAccess.Client;
using Oracle.DataAccess;
using Oracle.DataAccess.Types;
using System.Data;
using System.Windows;
using System.Configuration;
using System.Web;


namespace Animelist
{
    public class Databaseconnection
    {
        private OracleConnection conn;

        private int accountnr;
        public Databaseconnection()
        {
            conn = new OracleConnection();
            //string user = "SYSTEM";
            //string pw = "Heartless275";
            //conn.ConnectionString = "User Id=" + user + ";Password=" + pw + ";Data Source=" + " //localhost:1521/xe" + ";";

            string user = "dbi262941";
            string pw = "R2aLj9v1os";
            conn.ConnectionString = "User Id=" + user + ";Password=" + pw + ";Data Source=" + " //fhictora01.fhict.local:1521/fhictora" + ";";

            //this.conn.ConnectionString = ConfigurationManager.ConnectionStrings["MyConnectionString"].ConnectionString;
        }
        /// <summary>
        /// Create account with email and password 
        /// </summary>
        /// <param name="email"></param>
        /// <param name="password"></param>
        public void AddUser(string email, string password)
        {
            try
            {
                OracleCommand cmd = this.conn.CreateCommand();

                cmd.CommandText = "INSERT INTO DB21_ACCOUNT(Mailaddress,password) VALUES( :MAILADDRESS,:PASSWORD)";

                cmd.Parameters.Add("Mailaddress", email);
                cmd.Parameters.Add("password", password);
                this.conn.Open();
                cmd.ExecuteReader();
            }
            catch (OracleException exc)
            {
                Console.Write(exc);
            }
            finally
            {
                this.conn.Close();
            }
        }
        /// <summary>
        /// Adds an anime serie into your account
        /// </summary>
        /// <param name="status"></param>
        /// <param name="anime"></param>
        /// <param name="genre"></param>
        /// <param name="score"></param>
        /// <param name="rank"></param>
        /// <param name="popularity"></param>
        /// <param name="members"></param>
        /// <param name="favorites"></param>
        /// <param name="email"></param>
        public void AddAnime(string status,string anime, string genre, double score, int rank, int popularity, int members, int favorites,string email)
        {
            try
            {
                accountnr = Getaccountnr(email);
                OracleCommand cmd = this.conn.CreateCommand();
                cmd.CommandText = "INSERT INTO DB21_MYANIME(Status,Anime,Manga,Genre,Score,Rank, Popularity, Members,Favorites,Accountnr) VALUES(:Status,:Anime, :Manga, :Genre, :Score, :Rank, :Popularity,:Members, :Favorites, :Mailaddress)";

                cmd.Parameters.Add("Status", status);
                cmd.Parameters.Add("Anime", anime);
                cmd.Parameters.Add("Manga", anime);
                cmd.Parameters.Add("Genre", genre);
                cmd.Parameters.Add("Score", score);
                cmd.Parameters.Add("Rank", rank);
                cmd.Parameters.Add("Popularity", popularity);
                cmd.Parameters.Add("Members", members);
                cmd.Parameters.Add("Favorites", favorites);
                cmd.Parameters.Add("Mailaddress",accountnr);
                this.conn.Open();
                cmd.ExecuteReader();
            }
            catch (OracleException exc)
            {
                Console.Write(exc);
            }
            finally
            {
                this.conn.Close();
            }
        }
        /// <summary>
        /// Gets the accountnr of the person who is currently logged in 
        /// </summary>
        /// <param name="email"></param>
        /// <returns></returns>
        public int Getaccountnr(string email)
        {
            try
            {
                OracleCommand cmd = this.conn.CreateCommand();
                cmd.CommandText = "SELECT Accountnr FROM DB21_ACCOUNT WHERE (Mailaddress= :Mailaddress)";
                cmd.Parameters.Add("Mailaddress", email);
                this.conn.Open();
                cmd.ExecuteReader();
                accountnr = Convert.ToInt16(cmd.ExecuteScalar());
            }
            catch (OracleException exc)
            {
                Console.Write(exc);
            }
            finally
            {
                this.conn.Close();
            }
            return accountnr;
        }
        /// <summary>
        /// A comment will be added on the chosen animeserie
        /// </summary>
        /// <param name="bericht"></param>
        /// <param name="myanime"></param>
        /// <param name="accnr"></param>
       public void AddComment(string bericht,int myanime, int accnr)
        {
            try
            {
                OracleCommand cmd = this.conn.CreateCommand();
                cmd.CommandText ="INSERT INTO DB21_REVIEW(DESCRIPTION, MYANIMEID, ACCOUNTNR) values(:bericht,:myanime, :accnr)";
                cmd.Parameters.Add("comment", bericht);
                cmd.Parameters.Add("myanime", myanime);
                cmd.Parameters.Add("accountnr", accnr);

                this.conn.Open();
                cmd.ExecuteReader();
            }
            catch (OracleException exc)
            {
                Console.Write(exc);
            }
            finally
            {
                this.conn.Close();
            }

        }
        /// <summary>
        /// Load all the comments of a certain anime
        /// </summary>
        /// <param name="anime"></param>
        /// <param name="rptComments"></param>
       public void PopulateComments(string anime,Repeater rptComments)
       {
           string sqlStatment = "Select mailaddress, description from DB21_REVIEW R, DB21_ACCOUNT a,DB21_MYANIME M WHERE R.ACCOUNTNR= a.ACCOUNTNR and M.MYANIMEID = R.MYANIMEID and (M.ANIME=:anime)";
           using (OracleConnection con = new OracleConnection(conn.ConnectionString))
           {
               using (OracleCommand cmd = new OracleCommand(sqlStatment, con))
               {
                   cmd.Parameters.Add(":anime", anime);
                   using (OracleDataAdapter da = new OracleDataAdapter(cmd))
                   {
                       DataSet ds = new DataSet();
                       da.Fill(ds);
                       rptComments.DataSource = ds;
                       rptComments.DataBind();
                   }
               }
           }
       }

       public List<string> Search(string searchterm)
       {
           List<string> searchresults = new List<string>();
           try
           {
               string queryString = "select Animename from DB21_ANIME where upper(Animename) LIKE upper(:un)";

               OracleCommand cmd = new OracleCommand(queryString, this.conn);
               cmd.Parameters.Add(":un", OracleDbType.NVarchar2).Value = "%" + searchterm + "%";


               this.conn.Open();

               using (OracleDataReader reader = cmd.ExecuteReader())
               {
                   while (reader.Read())
                   {
                       searchresults.Add(reader.GetString(0));
                   }
               }
           }
           catch (OracleException exc)
           {
               Console.Write(exc);
           }
           finally
           {
               this.conn.Close();
           }
           return searchresults;
       }
    }
}
