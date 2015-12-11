using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication3
{
    public partial class Update : System.Web.UI.Page
    {
        private const string TABLE_NAME = "[Domain].[ExceptionLog]";
        private string connectionString = @"Data Source=finviews.cloudapp.net;Initial Catalog=Finviews;User ID={0};Password={1}";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (HttpContext.Current.Session["userId"] == null)
                Response.Redirect("Account/Login.aspx");

            connectionString = String.Format(connectionString, HttpContext.Current.Session["userId"], HttpContext.Current.Session["password"]);

            if (!IsPostBack)
            {
                try
                {
                    PopulateFields();
                }
                catch (Exception exception)
                {
                    errorMessage.InnerText = exception.Message;
                }
            }

        }

        private void PopulateFields()
        {
            string recordId = Request.QueryString["Id"];

            string selectQuery = getSelectQuery(recordId);
            System.Diagnostics.Debug.WriteLine(selectQuery);

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                SqlCommand command = connection.CreateCommand();
                connection.Open();
                command.CommandText = selectQuery;
                SqlDataReader reader = command.ExecuteReader();

                try
                {
                    while (reader.Read())
                    {
                        SetFields(reader);
                    }

                    reader.Close();
                }
                finally { connection.Close(); }
            }
        }

        private void AlertUser(string infoMessage)
        {
            string script = "<script type=\"text/javascript\">alert('" + infoMessage + "');</script>";
            Response.Write(script);
        }

        private void SetFields(SqlDataReader reader)
        {
            cik.Text = reader[2].ToString();
            fiscalYear.Text = reader[3].ToString();
            periodFocus.SelectedValue = reader[4].ToString();
            concept.Text = reader[5].ToString();
            stdConcept.Text = reader[6].ToString();
            unitType.Text = reader[7].ToString();
            rootConcept.SelectedValue = reader[8].ToString();
            weight.Text = reader[9].ToString();
            dimension.Text = reader[14].ToString();
            member.Text = reader[15].ToString();
            originValue.Text = reader[16].ToString();
            calDir.Text = reader[17].ToString();
            preDir.Text = reader[18].ToString();
            updateType.SelectedValue = reader[19].ToString();
            updateContent.Text = reader[20].ToString();
            action.SelectedValue = reader[22].ToString();
            statement.Text = reader[23].ToString();
            updateOrder.SelectedValue = reader[24].ToString();
            negative.SelectedValue = reader[25].ToString();
            originRoot.Text = reader[28].ToString();
            filingStrtDate.Text = reader[10].ToString();
            filingEndDate.Text = reader[11].ToString();
            strtDate.Text = reader[12].ToString();
            endDate.Text = reader[13].ToString();
        }

        private string getSelectQuery(string recordId)
        {
            return @"Select * from " + TABLE_NAME + @" Where Id = '" + recordId + "'";
        }

        protected void Cancel_Click(object sender, EventArgs e)
        {
            GoBack();
        }

        private void GoBack()
        {
            Response.Redirect("Default.aspx");
        }

        protected void Update_Click(object sender, EventArgs e)
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
                UpdateRecord();
            }
            catch (Exception excep)
            {
                errorMessage.InnerText = excep.Message;
                return;
            }

            GoBack();
        }

        private void UpdateRecord()
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

            UpdateDatabase(cIK, fIscalYear, pEriodFocus, cOncept, sTdConcept, uNitType, rOotConcept, wEight, fIlingDateStart, fIlingDateEnd,
                          sTrtDate, eNdDate, dImension, mEmber, oRiginValue, cAlDir, pReDir, uPdateType, uPdateContent,
                          aCtion, sTatement, uPdateOrder, nEgative, oRiginRoot);
        }

        private void UpdateDatabase(params string[] colValues)
        {
            string updateQuery = getUpdateQuery(colValues);
            System.Diagnostics.Debug.WriteLine(updateQuery);

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                SqlCommand command = connection.CreateCommand();
                connection.Open();

                command.CommandText = updateQuery;

                //SetAlerts(connection);
                try { command.ExecuteNonQuery(); }
                finally { connection.Close(); }
            }
        }

        private void SetAlerts(SqlConnection connection)
        {

        }



        private string getUpdateQuery(string[] colValues)
        {
            string[] columnsNames = {"Cik", "FiscalYear", "PeriodFocus", "Concept", "StdConcept", "UnitType", "RootConcept", "Weight", "FilingDateStart", "FilingDateEnd", 
                               "StartDate", "EndDate", "Dimension", "Member", "OriginValue", "CalDirParentConcept", "PreDirParentConcept", "UpdateType", "UpdateContent", 
                               "Action", "Statement", "UpdateOrder", "Negative", "OriginRoot"};

            string columnVals = null;

            for (int index = 0; index < colValues.Length; index++)
            {
                columnVals += colValues[index] == null ? columnsNames[index] + " = null, " : columnsNames[index] + " = '" + colValues[index] + "', ";
            }
            columnVals = columnVals.Remove(columnVals.LastIndexOf(','));

            string updateQuery = @"UPDATE " + TABLE_NAME + @" 
                                   SET " + columnVals + @" 
                                   WHERE Id = " + Request.QueryString["Id"];

            return updateQuery;
        }

        protected void Clear_Radio_Selection_Click(object sender, EventArgs e)
        {
            updateType.ClearSelection();
        }
    }
}