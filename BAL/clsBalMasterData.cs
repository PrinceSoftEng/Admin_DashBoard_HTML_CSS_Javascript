using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;

namespace Admin_DashBoard_HTML_CSS_Javascript.BAL
{
    public class clsBalMasterData
    {
        private string conString = ConfigurationManager.ConnectionStrings["constr"].ConnectionString;       
        public DataTable BindGridOutStandingData()
        {
            using (SqlConnection con = new SqlConnection(conString))
            {
                using (SqlCommand cmd = new SqlCommand("select Top 50 Id,comp_code as Company_Code,master_scode as Master_Scode,inv_smcode as Inv_Smcode,cust_code as Customer_Code,cust_name as Customer_Name,inv_no as Invoice_No,inv_code as Invoice_Code,inv_date as Invoice_Date,duedate as DueDate,inv_amt as Invoice_Amount,outamt as OutAmount,delayed_days as Delayed_Days from outstanding_salescode_11j", con))
                {
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