using Admin_DashBoard_HTML_CSS_Javascript.BAL;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;

namespace Admin_DashBoard_HTML_CSS_Javascript.Master
{
    public class clsMasterMasterData
    {
        public DataTable BindGridOutStandingData()
        {
            clsBalMasterData objBalMD = new clsBalMasterData();
            return objBalMD.BindGridOutStandingData();
        }
    }
}