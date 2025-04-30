using Microsoft.Data.SqlClient;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace MediQ.MVC.Controller
{
    class DatabaseController
    {
        string connectionString = "Server=localhost;Database=TestDB;Trusted_Connection=True;Encrypt=False;";
        SqlConnection conn;
        
        public void insertData(string sql)
        {
            this.conn = new SqlConnection(this.connectionString);
            this.conn.Open();

            new SqlCommand(sql, this.conn).ExecuteScalar();

            this.conn.Close();
        }
    }
}
