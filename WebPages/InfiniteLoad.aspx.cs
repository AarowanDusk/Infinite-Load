using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace InfiniteLoad
{
    public partial class InfiniteLoad : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        [WebMethod]
        public static string getData(int recCount)
        {
            var dbCon = DBConnection.Instance();
            dbCon.DatabaseName = "erp_master";
            string data = null;
            if (dbCon.IsConnect())
            {
                //suppose col0 and col1 are defined as VARCHAR in the DB
                string query = "SELECT*FROM log_in ORDER BY id DESC LIMIT 10 OFFSET " + recCount;
                var cmd = new MySqlCommand(query, dbCon.Connection);
                var reader = cmd.ExecuteReader();
                while (reader.Read())
                {
                    data += reader.GetString("id") + "<br/>";
                }
                dbCon.Close();

            }
            return data;
        }
    }
}
