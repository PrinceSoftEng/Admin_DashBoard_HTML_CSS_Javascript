using Admin_DashBoard_HTML_CSS_Javascript.BAL;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;

namespace Admin_DashBoard_HTML_CSS_Javascript.Master
{
    public class clsMasterTotalMasterData
    {
        public DataTable BindMasterdata()
        {
            clsBalTotalMasterData objBalTMD= new clsBalTotalMasterData();
            return objBalTMD.BindMasterdata();
        }
    }
}