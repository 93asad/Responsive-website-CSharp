using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Windows.Forms;

namespace WebApplication3
{
    public partial class Add1 : System.Web.UI.Page
    {
        private const string ERROR_MESSAGE = "Fields marked with \' * \' are mendatory and can not be left blank";
        private string connectionString = ConfigurationManager.ConnectionStrings["connectionStringStub"].ConnectionString;
        private string columnNames = System.Configuration.ConfigurationManager.AppSettings["columnNames"];
        private readonly string TABLE_NAME = System.Configuration.ConfigurationManager.AppSettings["tableToAlter"];

        protected void Page_Load(object sender, EventArgs e)
        {
            if (HttpContext.Current.Session["userId"] == null)
                Response.Redirect("Account/Login.aspx");

            connectionString = String.Format(connectionString, HttpContext.Current.Session["userId"], HttpContext.Current.Session["password"]);
            if (!IsPostBack)
            {
                PopulateStdConcept();
            }
        }

        protected void Add_Click(object sender, EventArgs e)
        {
            if (cik.Text.Equals(String.Empty) || action.Text.Equals(String.Empty) || updateOrder.Text.Equals(String.Empty))
            {
                errorMessage.InnerText = "Fields marked with \' * \' are mendatory and can not be left blank";
                return;
            }

            if (action.Text.Equals("0") && updateType.Text.Equals(String.Empty))
            {
                errorMessage.InnerText = "'UpdateType' is mendatory and can not be left blank when 'action' is set to '0'";
                return;
            }


            try
            {
                if (MessageBox.Show("Do you really want to add a new Record?", "Confirm Add", MessageBoxButtons.YesNo) == DialogResult.Yes)
                    AddRecord();
                else return;
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
            string cIK = cik.Text.Equals(String.Empty) ? null : cik.Text;
            string fIscalYear = fiscalYear.Text.Equals(String.Empty) ? null : fiscalYear.Text;
            string pEriodFocus = periodFocus.Text.Equals(String.Empty) ? null : periodFocus.Text;
            string cOncept = concept.Text.Equals(String.Empty) ? null : concept.Text;
            string sTdConcept = stdConcept.SelectedItem.Text.Equals(String.Empty) ? null : stdConcept.Text;
            string uNitType = unitType.Text.Equals(String.Empty) ? null : unitType.Text;
            string rOotConcept = rootConcept.Text.Equals(String.Empty) ? null : rootConcept.Text;
            string wEight = weight.Text.Equals(String.Empty) ? null : weight.Text;
            string dImension = dimension.Text.Equals(String.Empty) ? null : dimension.Text;
            string mEmber = member.Text.Equals(String.Empty) ? null : member.Text;
            string oRiginValue = originValue.Text.Equals(String.Empty) ? null : originValue.Text;
            string cAlDir = calDir.Text.Equals(String.Empty) ? null : calDir.Text;
            string pReDir = preDir.Text.Equals(String.Empty) ? null : preDir.Text;
            string uPdateType = updateType.Text.Equals(String.Empty) ? null : updateType.Text;

            string uPdateContent = updateContent.Text.Equals(String.Empty) ? null : updateContent.Text;
            string aCtion = action.SelectedItem.Text.Equals(String.Empty) ? null : action.Text;
            string sTatement = statement.Text.Equals(String.Empty) ? null : statement.Text;
            string uPdateOrder = updateOrder.SelectedItem.Text.Equals(String.Empty) ? null : updateOrder.Text;
            string nEgative = negative.Text.Equals(String.Empty) ? null : negative.Text;
            string oRiginRoot = originRoot.Text.Equals(String.Empty) ? null : originRoot.Text;

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
            string columnVals = null;

            for (int index = 0; index < colValues.Length; index++)
            {
                columnVals += colValues[index] == null ? "null, " : "'" + colValues[index] + "', ";
            }
            columnVals = columnVals.Remove(columnVals.LastIndexOf(','));

            string insertQuery = @"INSERT INTO " + TABLE_NAME + " ( " + columnNames + @" ) 
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

        protected void SetAddedValue(object sender, EventArgs e)
        {
            SetAddedValue(((System.Web.UI.WebControls.RadioButtonList)sender).SelectedValue);
        }

        private void SetAddedValue(string selectedValue)
        {
            switch (selectedValue)
            {
                case "1": ScriptManager.RegisterStartupScript(this.Page, Page.GetType(), "myJsFn", "SetAddedVal(true, false)", true); return;
                case "2": ScriptManager.RegisterStartupScript(this.Page, Page.GetType(), "myJsFn", "SetAddedVal(false, true)", true); return;
                default: ScriptManager.RegisterStartupScript(this.Page, Page.GetType(), "myJsFn", "SetAddedVal(true, true)", true); return;
            }
        }

        protected void Filters_Changed(object sender, EventArgs e)
        {
            PopulateStdConcept();
        }

        private void PopulateStdConcept()
        {
            string filters = null;

            if (!treeTYpe.SelectedValue.Equals(String.Empty))
                filters += " AND a.TreeType LIKE '" + treeTYpe.SelectedValue + "'";

            if (!rootConcept.SelectedValue.Equals(String.Empty))
                filters += " AND b.StdConcept LIKE '" + rootConcept.SelectedValue + "'";

            DataTable concepts = new DataTable();

            using (SqlConnection con = new SqlConnection(connectionString))
            {

                try
                {
                    string command = @"select distinct a.StdConcept, a.[Order] 
                                        from [Domain].[DimStdConcept] a, [Domain].[DimStdConcept] b 
                                        where a.StatementId = b.StdConceptId" + filters + @" 
                                        order by a.[Order]";

                    System.Diagnostics.Debug.WriteLine(command);
                    SqlDataAdapter adapter = new SqlDataAdapter(command, con);
                    adapter.Fill(concepts);

                    stdConcept.DataSource = concepts;

                    stdConcept.DataTextField = "StdConcept";
                    stdConcept.DataValueField = "StdConcept";
                    stdConcept.DataBind();
                    stdConcept.Items.Insert(0, new ListItem(String.Empty));
                    stdConcept.Items.Insert(1, new ListItem("N/M", "N/M"));
                }
                catch (Exception ex)
                {
                    errorMessage.InnerText = ex.Message;
                }

            }
        }
    }
}