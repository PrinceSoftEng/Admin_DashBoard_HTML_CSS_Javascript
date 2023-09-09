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
    public partial class TotalMaster_Page : System.Web.UI.Page
    {
        clsMasterTotalMasterData objMastTMD=new clsMasterTotalMasterData();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.IsPostBack)
            {
                BindGridData();
            }
        }

        private void BindGridData()
        {
            DataTable dt = objMastTMD.BindMasterdata();
            if (dt.Rows.Count > 0)
            {
                GvMasterData.DataSource = dt;
                GvMasterData.DataBind();
            }
            else 
            {
                GvMasterData.DataSource = "No Data Founds";
                GvMasterData.DataBind();
            }
        }
    }
}