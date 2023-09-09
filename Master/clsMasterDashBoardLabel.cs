using Admin_DashBoard_HTML_CSS_Javascript.BAL;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;

namespace Admin_DashBoard_HTML_CSS_Javascript.Master
{
    public class clsMasterDashBoardLabel
    {       
        public string BindLabelForTotalMasters()
        {
            clsBalDashBoardLabel objBalOS = new clsBalDashBoardLabel();
            return objBalOS.BindLabelForTotalMasters();
        }

        public string BindLabelForTotalCustomers()
        {
            clsBalDashBoardLabel objBalOS = new clsBalDashBoardLabel();
            return objBalOS.BindLabelForTotalCustomers();
        }

        public DataTable GetMasterDataFromDatabase()
        {
            clsBalDashBoardLabel objBalOS = new clsBalDashBoardLabel();
            return objBalOS.GetMasterDataFromDatabase();
        }

        public DataTable GetCustomerDataFromDatabase()
        {
            clsBalDashBoardLabel objBalOS = new clsBalDashBoardLabel();
            return objBalOS.GetCustomerDataFromDatabase();
        }

        public string BindLabelForMaster()
        {
            clsBalDashBoardLabel objBalOS = new clsBalDashBoardLabel();
            return objBalOS.BindLabelForMaster();
        }

        public string BindLabelForCustomer()
        {
            clsBalDashBoardLabel objBalOS = new clsBalDashBoardLabel();
            return objBalOS.BindLabelForCustomer();
        }
    }
}