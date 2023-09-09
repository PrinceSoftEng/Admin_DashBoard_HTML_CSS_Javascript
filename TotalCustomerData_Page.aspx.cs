using Admin_DashBoard_HTML_CSS_Javascript.Master;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Admin_DashBoard_HTML_CSS_Javascript
{
    public partial class TotalCustomerData_Page : System.Web.UI.Page
    {
        clsMasterTotalCustomerData objMastTCD= new clsMasterTotalCustomerData();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.IsPostBack)
            {
                BindCustomerData();
            }
        }

        private void BindCustomerData()
        {
            DataTable dt =objMastTCD.BindCustomerData();
            if (dt.Rows.Count > 0)
            {
                GvCustomerData.DataSource = dt;
                GvCustomerData.DataBind();
            }
            else 
            {
                GvCustomerData.DataSource = "No Records Found";
                GvCustomerData.DataBind();
            }
        }
    }
}