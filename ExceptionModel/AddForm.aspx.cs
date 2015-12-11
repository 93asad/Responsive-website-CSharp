using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication3
{
    public partial class AddForm : System.Web.UI.Page
    {
        private const string ERROR_MESSAGE = "Fields marked with \' * \' are mendatory and can not be left blank";
        private string connectionString = @"Data Source=finviews.cloudapp.net;Initial Catalog=Finviews;User ID={0};Password={1}";
        private const string TABLE_NAME = "[Domain].[ExceptionLog]";

        protected void Page_Load(object sender, EventArgs e)
        {
            if (HttpContext.Current.Session["userId"] == null)
                Response.Redirect("Account/Login.aspx");

            connectionString = String.Format(connectionString, HttpContext.Current.Session["userId"], HttpContext.Current.Session["password"]);
        }

        protected void Add_Click(object sender, EventArgs e)
        {
            if (cik.Text.Equals("") || action.Text.Equals("") || updateOrder.Text.Equals(""))
            {
                errorMessage.InnerText = "Fields marked with \' * \' are mendatory and can not be left blank";
                return;
            }

            if (action.Text.Equals("0") && updateType.Text.Equals(""))
            {
                errorMessage.InnerText = "'UpdateType' is mendatory and can not be left blank when 'action' is set to '0'";
                return;
            }

            try
            {
                AddRecord();
            }
            catch (Exception excep)
            {
                errorMessage.InnerText = excep.Message;
                return;
            }

            GoBack();
        }

        private void AddRecord()
        {
            string cIK = cik.Text.Equals("") ? null : cik.Text;
            string fIscalYear = fiscalYear.Text.Equals("") ? null : fiscalYear.Text;
            string pEriodFocus = periodFocus.Text.Equals("") ? null : periodFocus.Text;
            string cOncept = concept.Text.Equals("") ? null : concept.Text;
            string sTdConcept = stdConcept.Text.Equals("") ? null : stdConcept.Text;
            string uNitType = unitType.Text.Equals("") ? null : unitType.Text;
            string rOotConcept = rootConcept.Text.Equals("") ? null : rootConcept.Text;
            string wEight = weight.Text.Equals("") ? null : weight.Text;
            string dImension = dimension.Text.Equals("") ? null : dimension.Text;
            string mEmber = member.Text.Equals("") ? null : member.Text;
            string oRiginValue = originValue.Text.Equals("") ? null : originValue.Text;
            string cAlDir = calDir.Text.Equals("") ? null : calDir.Text;
            string pReDir = preDir.Text.Equals("") ? null : preDir.Text;
            string uPdateType;
            try
            {
                uPdateType = updateType.SelectedItem.Text.Equals("") ? null : updateType.Text;
            }
            catch (NullReferenceException exception) { uPdateType = null; }
            string uPdateContent = updateContent.Text.Equals("") ? null : updateContent.Text;
            string aCtion = action.SelectedItem.Text.Equals("") ? null : action.Text;
            string sTatement = statement.Text.Equals("") ? null : statement.Text;
            string uPdateOrder = updateOrder.SelectedItem.Text.Equals("") ? null : updateOrder.Text;
            string nEgative = negative.Text.Equals("") ? null : negative.Text;
            string oRiginRoot = originRoot.Text.Equals("") ? null : originRoot.Text;

            string fIlingDateStart = filingStrtDate.Text.Any(char.IsDigit) ? filingStrtDate.Text : null;
            string fIlingDateEnd = filingEndDate.Text.Any(char.IsDigit) ? filingEndDate.Text : null;
            string sTrtDate = strtDate.Text.Any(char.IsDigit) ? strtDate.Text : null;
            string eNdDate = endDate.Text.Any(char.IsDigit) ? endDate.Text : null;

            AddToDatabase(cIK, fIscalYear, pEriodFocus, cOncept, sTdConcept, uNitType, rOotConcept, wEight, fIlingDateStart, fIlingDateEnd,
                          sTrtDate, eNdDate, dImension, mEmber, oRiginValue, cAlDir, pReDir, uPdateType, uPdateContent,
                          aCtion, sTatement, uPdateOrder, nEgative, oRiginRoot);
        }

        private void AddToDatabase(params string[] colValues)
        {
            string insertQuery = getInsertQuery(colValues);
            System.Diagnostics.Debug.WriteLine(insertQuery);

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                SqlCommand command = connection.CreateCommand();
                connection.Open();
                command.CommandText = insertQuery;

                try { command.ExecuteNonQuery(); }
                finally { connection.Close(); }
            }
        }

        private string getInsertQuery(string[] colValues)
        {
            string columnsNames = @"Cik, FiscalYear, PeriodFocus, Concept, StdConcept, UnitType, RootConcept, Weight, FilingDateStart, FilingDateEnd, 
                               StartDate, EndDate, Dimension, Member, OriginValue, CalDirParentConcept, PreDirParentConcept, UpdateType, UpdateContent, 
                               Action, Statement, UpdateOrder, Negative, OriginRoot";

            string columnVals = null;

            for (int index = 0; index < colValues.Length; index++)
            {
                columnVals += colValues[index] == null ? "null, " : "'" + colValues[index] + "', ";
            }
            columnVals = columnVals.Remove(columnVals.LastIndexOf(','));

            string insertQuery = @"INSERT INTO " + TABLE_NAME + " ( " + columnsNames + @" ) 
             VALUES ( " + columnVals + " )";

            return insertQuery;
        }

        protected void Cancel_Click(object sender, EventArgs e)
        {
            GoBack();
        }

        private void GoBack()
        {
            Response.Redirect("Default.aspx");
        }

        protected void Clear_Radio_Selection_Click(object sender, EventArgs e)
        {
            updateType.ClearSelection();
        }
    }
}