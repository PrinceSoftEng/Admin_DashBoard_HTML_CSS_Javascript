using Admin_DashBoard_HTML_CSS_Javascript.Master;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.DataVisualization.Charting;
using System.Web.UI.WebControls;

namespace Admin_DashBoard_HTML_CSS_Javascript
{
    public partial class Admin_DashBoard : System.Web.UI.Page
    {
        clsMasterDashBoardLabel objMastOS = new clsMasterDashBoardLabel();
        public int delayedDays = Convert.ToInt32(ConfigurationManager.AppSettings["SetDelayedDays"]);
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.IsPostBack)
            {
                BindLabelForTotalMaster();
                BindLabelForTotalCustomers();
                GetMasterDataFromDatabase();
                GetCustomerDataFromDatabase();
                BindLabelForMaster();
                BindLabelForCustomer();
            }
        }

        private void GetMasterDataFromDatabase()
        {
            DataTable dt = objMastOS.GetMasterDataFromDatabase();
            if (dt.Rows.Count > 0)
            {
                ChartArea objChartArea = MasterDataChart.ChartAreas[0];
                objChartArea.AxisX.MinorGrid.Enabled = false;
                objChartArea.AxisX.MajorGrid.Enabled = false;
                objChartArea.AxisX.Interval = 1;
                objChartArea.AxisX.Title = "Master Sales Code";
                objChartArea.AxisX.TitleFont = new Font("Arial", 10, FontStyle.Bold);

                objChartArea.AxisY.MinorGrid.Enabled = false;
                objChartArea.AxisY.MajorGrid.Enabled = false;
                objChartArea.AxisY.Title = "OutStanding Amount";
                objChartArea.AxisY.TextOrientation = TextOrientation.Horizontal;
                objChartArea.AxisY.TitleFont = new Font("Arial", 10, FontStyle.Bold);

                MasterDataChart.DataSource = dt;
                MasterDataChart.DataBind();
            }
        }
        private void GetCustomerDataFromDatabase()
        {
            DataTable dt = objMastOS.GetCustomerDataFromDatabase();
            if (dt.Rows.Count > 0)
            {
                ChartArea objchrArea = CustomerDataChart.ChartAreas[0];
                objchrArea.AxisX.MinorGrid.Enabled = false;
                objchrArea.AxisX.MajorGrid.Enabled = false;
                objchrArea.AxisX.Interval = 1;
                objchrArea.AxisX.Title = "Customer";
                objchrArea.AxisX.TitleFont = new Font("Arial", 10, FontStyle.Bold);

                objchrArea.AxisY.MajorGrid.Enabled = false;
                objchrArea.AxisY.MinorGrid.Enabled = false;
                objchrArea.AxisY.Title = "OutStanding Amount";
                objchrArea.AxisY.TextOrientation = TextOrientation.Horizontal;
                objchrArea.AxisY.TitleFont = new Font("Arial", 10, FontStyle.Bold);

                CustomerDataChart.DataSource = dt;
                CustomerDataChart.DataBind();
            }
        }
        private void BindLabelForMaster()
        {
            string message = objMastOS.BindLabelForMaster();
            if (message != null)
            {
                lblTotalAmount.Text = message.ToString();
            }
            else
            {
                lblTotalAmount.Text = "No Data Found.";
            }
        }
        private void BindLabelForCustomer()
        {
            string message = objMastOS.BindLabelForCustomer();
            if (message != null)
            {
                lblOverDue.Text = message.ToString();
            }
            else
            {
                lblOverDue.Text = "No Data Found";
            }
        }
        private void BindLabelForTotalMaster()
        {
            clsMasterDashBoardLabel objMastOS = new clsMasterDashBoardLabel();
            string message = objMastOS.BindLabelForTotalMasters();
            if (message != null)
            {
                lblTotalMaster.Text = message;
            }
            else
            {
                lblTotalMaster.Text = "No Data Available..!";
            }
        }

        private void BindLabelForTotalCustomers()
        {
            clsMasterDashBoardLabel objMastOS = new clsMasterDashBoardLabel();
            string message = objMastOS.BindLabelForTotalCustomers();
            if (message != null)
            {
                lblTotalCustomers.Text = message;
            }
            else
            {
                lblTotalCustomers.Text = "No Data Available..!";
            }
        }
    }
}