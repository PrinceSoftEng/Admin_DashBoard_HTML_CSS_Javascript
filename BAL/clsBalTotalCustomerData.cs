using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace Admin_DashBoard_HTML_CSS_Javascript.BAL
{
    public class clsBalTotalCustomerData
    {
        public string constring = ConfigurationManager.ConnectionStrings["constr"].ConnectionString;
        public DataTable BindCustomerData()
        {
            using (SqlConnection con = new SqlConnection(constring))
            {
                using (SqlCommand cmd = new SqlCommand("select Distinct cust_name as Customer_Name,cust_code as Customer_Code, Sum(outamt) as OutStanding_Amount,SUM(CASE WHEN delayed_days > 0 THEN outamt ELSE 0 END) as Total_OverDue from outstanding_salescode_11j  group by cust_name,cust_code having sum(outamt) > 10000000 order by Sum(outamt) desc", con))
                {
                    cmd.CommandType = CommandType.Text;
                    using (SqlDataAdapter sda = new SqlDataAdapter(cmd))
                    {
                        using (DataTable dt = new DataTable())
                        {
                            sda.Fill(dt);
                            return dt;
                        }
                    }
                }
            }
        }
    }
}