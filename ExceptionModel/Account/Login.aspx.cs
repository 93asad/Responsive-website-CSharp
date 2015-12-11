using System;
using System.Web;
using System.Web.UI;
using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.Owin;
using Owin;
using WebApplication3.Models;
using System.Data.SqlClient;
using System.Configuration;

namespace WebApplication3.Account
{
    public partial class Login : Page
    {

        private string connectionString = @"Data Source=finviews.cloudapp.net;Initial Catalog=Finviews;User ID={0};Password={1}";
        private const string TABLE_NAME = "[Domain].[ExceptionLog]";
        private const string TEST_QUERY = "SELECT TOP 1 * FROM " + TABLE_NAME;

        protected void Page_Load(object sender, EventArgs e)
        {
           
        }

        protected void LogIn(object sender, EventArgs e)
        {
            string userId = @Id.Text;
            string password = @Password.Text;

            connectionString = String.Format(connectionString, userId, password);

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                try
                {
                    SqlCommand command = connection.CreateCommand();
                    connection.Open();

                    HttpContext.Current.Session["userId"] = userId;
                    HttpContext.Current.Session["password"] = password;
                    Response.Redirect(@"../Default.aspx");
                }
                catch (System.Data.SqlClient.SqlException exception) { errorMessage.InnerText = exception.Message; }
                finally { connection.Close(); }
            }

        }
    }
}