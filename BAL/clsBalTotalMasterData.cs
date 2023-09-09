using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace Admin_DashBoard_HTML_CSS_Javascript.BAL
{
    public class clsBalTotalMasterData
    {
        public string constring = ConfigurationManager.ConnectionStrings["constr"].ConnectionString;
        public DataTable BindMasterdata()
        {
            using (SqlConnection con = new SqlConnection(constring))
            {
                using (SqlCommand cmd = new SqlCommand("select Distinct master_scode as Master_Sales_Code,inv_smcode as Invoice_SMCode, Sum(outamt) as OutStanding_Amount,SUM(CASE WHEN delayed_days > 0 THEN outamt ELSE 0 END) as TotalOverDue from outstanding_salescode_11j group by master_scode,inv_smcode having sum(outamt) > 10000000 order by Sum(outamt) desc\r\n", con))
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