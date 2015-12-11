using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Windows.Forms;

namespace WebApplication3
{
    public partial class _Default : Page
    {

        private ArrayList checkedCheckBoxesIds;
        private const string TABLE_NAME = "[Domain].[ExceptionLog]";
        private string connectionString = @"Data Source=finviews.cloudapp.net;Initial Catalog=Finviews;User ID={0};Password={1}";

        protected void Page_Load(object sender, EventArgs e)
        {
            if (HttpContext.Current.Session["userId"] == null)
                Response.Redirect("Account/Login.aspx");

            string userId = @Session["userId"].ToString();
            string password = @Session["password"].ToString();

            connectionString = String.Format(connectionString, userId, password);

            PopulateFiscalYearDropDown();

            if (ViewState["Ids"] != null)
            {
                checkedCheckBoxesIds = (ArrayList)ViewState["Ids"];
            }
            else
            {
                checkedCheckBoxesIds = new ArrayList();
            }
        }

        private void PopulateFiscalYearDropDown()
        {
            if (fiscalYear.Items.Count > 1)
                return;

            for (int year = DateTime.Now.Year; year >= 2009; year--)
            {
                fiscalYear.Items.Add(new ListItem(year.ToString(), year.ToString()));
            }
        }


        protected void UpdateCheckBoxList(object sender, EventArgs e)
        {
            System.Web.UI.WebControls.CheckBox checkBox = (System.Web.UI.WebControls.CheckBox)sender;

            if (checkBox.Checked)
                checkedCheckBoxesIds.Add(checkBox.Attributes["value"]);
            else
                checkedCheckBoxesIds.Remove(checkBox.Attributes["value"]);

            ViewState.Add("Ids", checkedCheckBoxesIds);
        }


        protected void Search_Click(object sender, EventArgs e)
        {
            Search();
        }

        private void Search()
        {
            string cIK = (cik.Text.Trim().Equals("")) ? null : cik.Text;
            string concpt = (concept.Text.Trim().Equals("")) ? null : concept.Text;
            string fisclYear = (fiscalYear.SelectedItem.Text.Trim().Equals("")) ? null : fiscalYear.SelectedItem.Text;
            string priod = (period.SelectedItem.Text.Trim().Equals("")) ? null : period.SelectedItem.Text;
            string rootConcpt = (rootConcept.Text.Trim().Equals("")) ? null : rootConcept.SelectedItem.Text;
            string ngative = (negative.SelectedItem.Text.Trim().Equals("")) ? null : negative.SelectedItem.Text;
            string uPdateType = (updateType.SelectedItem.Text.Trim().Equals("")) ? null : updateType.SelectedItem.Text;
            string uPdateOrder = (updateType.SelectedItem.Text.Trim().Equals("")) ? null : updateOrder.SelectedItem.Text;
            string aCtion = (updateType.SelectedItem.Text.Trim().Equals("")) ? null : action.SelectedItem.Text;
            string queryString = @"SELECT Id, Concept, StdConcept, Dimension, FilingDateStart, Weight,
                                         UnitType, Member, OriginValue, CalDirParentConcept,
                                         PreDirParentConcept, UpdateContent, OriginRoot, Statement
                                   FROM  " + TABLE_NAME + " "
                                   + getWhereClause(cIK, fisclYear, priod, rootConcpt, ngative, uPdateOrder, uPdateType, aCtion) + @" 
                                   ORDER BY Id";

            var listView = SearchResults;
            listView.Items.Clear();

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                System.Diagnostics.Debug.WriteLine(connectionString);
                SqlCommand command = connection.CreateCommand();
                connection.Open();

                command.CommandText = queryString;
                SqlDataAdapter da = new SqlDataAdapter(command);
                try
                {
                    DataTable dataTable = new DataTable();
                    da.Fill(dataTable);
                    listView.DataSource = dataTable;
                    listView.DataBind();
                }
                catch (Exception exception) { errorMessage.InnerText = exception.Message; }
                finally
                {
                    connection.Close();
                }
            }
        }

        private string getWhereClause(params string[] whereConditions)
        {
            string whereClause = null;
            string stub = "AND {0} = {1} ";
            string stubForFirstArg = "WHERE {0} = {1} ";

            string[] conditions = { "Cik", "FiscalYear", "PeriodFocus", "RootConcept", "Negative", "UpdateOrder", "UpdateType", "Action" };

            bool firstConditionFound = false;

            for (int index = 0; index < whereConditions.Length; index++)
            {
                whereClause += firstConditionFound ?
                    (whereConditions[index] == null ? null : String.Format(stub, conditions[index], "'" + whereConditions[index] + "'" + " ")) :
                    (whereConditions[index] == null ? null : String.Format(stubForFirstArg, conditions[index], "'" + whereConditions[index] + "'" + " "));

                firstConditionFound = !whereClause.Equals("");
            }
            return whereClause;
        }

        protected void Add_Click(object sender, EventArgs e)
        {
            Response.Redirect("AddForm.aspx");
        }

        protected void Delete_Click(object sender, EventArgs e)
        {
            string iDs = null;

            foreach (string id in checkedCheckBoxesIds)
            {
                iDs += id + ", ";
            }

            if (iDs == null) return;

            iDs = iDs.Remove(iDs.LastIndexOf(","));


            string deleteQuery = getDeleteQuery(iDs);
            System.Diagnostics.Debug.WriteLine(deleteQuery);

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                SqlCommand command = connection.CreateCommand();
                connection.Open();
                command.CommandText = deleteQuery;

                try
                {
                    command.ExecuteNonQuery();
                    Search();
                }
                catch (Exception exception) { errorMessage.InnerText = exception.Message; }
                finally { connection.Close(); }
            }

        }

        protected void OnPagePropertiesChanging(object sender, PagePropertiesChangingEventArgs e)
        {
            (SearchResults.FindControl("DataPager1") as DataPager).SetPageProperties(e.StartRowIndex, e.MaximumRows, false);
            Search();
        }

        private string getDeleteQuery(string iDs)
        {
            return @"DELETE FROM " + TABLE_NAME + " WHERE Id IN (" + iDs + ")";
        }
    }
}