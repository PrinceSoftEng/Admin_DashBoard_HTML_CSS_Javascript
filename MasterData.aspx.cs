using Admin_DashBoard_HTML_CSS_Javascript.Master;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Runtime.Remoting.Messaging;
using System.Security.Policy;
using System.Threading.Tasks;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Admin_DashBoard_HTML_CSS_Javascript
{
    public partial class MasterData : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.IsPostBack)
            {
                var tv = Request.QueryString["TV"];
                BindGridViewFromCSV1(tv);
            }
        }

        //ReadCSV File and store it in DataTable 
        protected DataTable ReadCsvAndPopulateDataTable()
        {
            string filePath = Server.MapPath("~/TVTable Data.csv");
            DataTable dataTable = new DataTable();

            using (StreamReader reader = new StreamReader(filePath))
            {
                bool isHeader = true;
                while (!reader.EndOfStream)
                {
                    string line = reader.ReadLine();
                    string[] fields = line.Split(',');

                    if (isHeader)
                    {
                        foreach (string field in fields)
                        {
                            dataTable.Columns.Add(field.Trim());
                        }
                        isHeader = false;
                    }
                    else
                    {
                        // Create a new row and add data
                        DataRow row = dataTable.NewRow();
                        for (int i = 0; i < fields.Length; i++)
                        {
                            row[i] = fields[i].Trim();
                        }
                        dataTable.Rows.Add(row);
                    }
                }
            }
            return dataTable;
        }

        //Dynamically bind GridView from CSV file 
        private void BindGridViewFromCSV1(string tv)
        {
            DataTable dt = ReadCsvAndPopulateDataTable();
            string filterQS;
            if (tv != null)
            {
                filterQS = tv.Replace("'", "");
                dt = dt.AsEnumerable().Where(row => row.Field<string>(0) == filterQS).CopyToDataTable();
            }
            for (int i = 0; i < dt.Rows.Count; i++)
            {
                try
                {
                    //var filterRows =
                    List<CSVColumnInfo> csvData = ReadCSVFile(dt.Rows[i][3] + ".csv");
                    GridView gvGrid = new GridView();
                    gvGrid.ID = "DynamicGridView";
                    gvGrid.AutoGenerateColumns = false;
                    gvGrid.Width = Unit.Parse("100%");
                    gvGrid.RowDataBound += GridView_OnRowDataBound;
                    foreach (CSVColumnInfo columnInfo in csvData)
                    {
                        BoundField column = new BoundField();
                        column.DataField = columnInfo.DataField;
                        column.ItemStyle.Width = Unit.Parse(columnInfo.ItemStyleWidth);
                        column.HeaderText = columnInfo.HeaderText;
                        column.ItemStyle.CssClass = columnInfo.ItemStyleCssClass;
                        if (!string.IsNullOrEmpty(columnInfo.ItemStyleCssClass))
                        {
                            column.ItemStyle.HorizontalAlign = HorizontalAlign.Right;
                        }
                        gvGrid.Columns.Add(column);
                    }
                    GridViewPlaceholder.Controls.Add(gvGrid);

                    ////Bind data to GridView
                    gvGrid.DataSource = GetDataFromTable1(dt.Rows[i][2] + ".txt");
                    gvGrid.DataBind();
                }
                catch (Exception ex)
                {

                }
            }
        }

        //Get Data From DataBase import from text file
        private DataTable GetDataFromTable1(string tFileName)
        {
            DataTable dt = new DataTable();
            string tFilePath = Server.MapPath(tFileName);
            string sqlQuery = File.ReadAllText(tFilePath);
            string conString = ConfigurationManager.ConnectionStrings["conStr"].ConnectionString;
            using (SqlConnection con = new SqlConnection(conString))
            {
                using (SqlCommand cmd = new SqlCommand(sqlQuery, con))
                {
                    using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                    {
                        sda.Fill(dt);
                    }
                }
            }
            return dt;
        }

        //Set the Header Accordingly based on GridView
        private List<CSVColumnInfo> ReadCSVFile(string filePath)
        {
            List<CSVColumnInfo> csvData = new List<CSVColumnInfo>();

            using (StreamReader reader = new StreamReader(Server.MapPath(filePath)))
            {
                string line;
                bool headerRow = true;

                while ((line = reader.ReadLine()) != null)
                {
                    if (headerRow)
                    {
                        headerRow = false;
                        continue;
                    }

                    string[] cols = line.Split(',');

                    if (cols.Length == 4)
                    {
                        csvData.Add(new CSVColumnInfo
                        {
                            DataField = cols[0],
                            ItemStyleWidth = cols[1],
                            HeaderText = cols[2],
                            ItemStyleCssClass = cols[3]
                        });
                    }
                }
            }

            return csvData;
        }



        protected void GridView_OnRowDataBound(object sender, GridViewRowEventArgs e)
        {
            GridView gvGrid = (GridView)sender;
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                DataRowView rowView = (DataRowView)e.Row.DataItem;
                int colName = Convert.ToInt16(rowView["Delayed_Days"]);
                if (gvGrid.ID == "DynamicGridView" && colName > 15)
                {
                    e.Row.BackColor = System.Drawing.Color.Yellow;
                    e.Row.CssClass += "blink";
                }
            }
            //if (e.Row.RowType == DataControlRowType.DataRow)
            //{
            //    if (Convert.ToInt32(e.Row.Cells[12].Text) > 15)
            //    {
            //        e.Row.BackColor = System.Drawing.Color.Yellow;
            //        e.Row.CssClass += "blink";
            //        gvOutSandingData.HeaderRow.CssClass = "fixed-header";
            //    }
            //}
        }

        public class CSVColumnInfo
        {
            public string DataField { get; set; }
            public string ItemStyleWidth { get; set; }
            public string HeaderText { get; set; }
            public string ItemStyleCssClass { get; set; }
        }
    }
}