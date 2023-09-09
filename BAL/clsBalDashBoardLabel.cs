using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;

namespace Admin_DashBoard_HTML_CSS_Javascript.BAL
{
    public class clsBalDashBoardLabel
    {
        private string conString = ConfigurationManager.ConnectionStrings["constr"].ConnectionString;        
        public string BindLabelForTotalMasters()
        {
            using (SqlConnection con = new SqlConnection(conString))
            {
                con.Open();
                using (SqlCommand cmd = new SqlCommand("select Count(Distinct master_scode) as Total_Masters from outstanding_salescode_11j", con))
                {
                    using (SqlDataReader sdr = cmd.ExecuteReader())
                    {
                        if (sdr.Read())
                        {
                            return sdr["Total_Masters"].ToString();
                        }
                    }
                }
            }
            return string.Empty;
        }

        public string BindLabelForTotalCustomers()
        {
            using (SqlConnection con = new SqlConnection(conString))
            {
                con.Open();
                using (SqlCommand cmd = new SqlCommand("select Count(Distinct cust_name) as Total_Customers from outstanding_salescode_11j", con))
                {
                    using (SqlDataReader sdr = cmd.ExecuteReader())
                    {
                        if (sdr.Read()) 
                        {
                            return sdr["Total_Customers"].ToString();
                        }
                    }
                }
            }
            return string.Empty;
        }
        public DataTable GetMasterDataFromDatabase()
        {
            using (SqlConnection con = new SqlConnection(conString))
            {
                string query = "select Distinct master_scode as Master_Sales_Code, Sum(outamt) as OutStanding_Amount,SUM(CASE WHEN delayed_days > 0 THEN outamt ELSE 0 END) as OverDue from outstanding_salescode_11j group by master_scode having sum(outamt) > 10000000 order by Sum(outamt)";
                using (SqlCommand command = new SqlCommand(query, con))
                {
                    con.Open();
                    using (SqlDataAdapter sda = new SqlDataAdapter(command))
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

        public DataTable GetCustomerDataFromDatabase()
        {
            using (SqlConnection con = new SqlConnection(conString))
            {
                string query = "select Distinct cust_name as Customer_Name, Sum(outamt) as OutStanding_Amount,SUM(CASE WHEN delayed_days > 0 THEN outamt ELSE 0 END) as OverDue from outstanding_salescode_11j  group by cust_name having sum(outamt) > 10000000 order by Sum(outamt)";
                using (SqlCommand command = new SqlCommand(query, con))
                {
                    con.Open();
                    using (SqlDataAdapter sda = new SqlDataAdapter(command))
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

        public string BindLabelForMaster()
        {
            using (SqlConnection con = new SqlConnection(conString))
            {
                con.Open();
                using (SqlCommand cmd = new SqlCommand("select Round(Sum(outamt)/1000000,1) as Total_Oustanding from outstanding_salescode_11j", con))
                {
                    using (SqlDataReader sdr = cmd.ExecuteReader())
                    {
                        if (sdr.Read())
                        {
                            return sdr["Total_Oustanding"].ToString();
                        }
                    }
                }
            }
            return string.Empty;
        }

        public string BindLabelForCustomer()
        {
            using (SqlConnection con = new SqlConnection(conString))
            {
                con.Open();
                using (SqlCommand cmd = new SqlCommand("SELECT Round(SUM(CASE WHEN delayed_days > 0 THEN outamt ELSE 0 END)/1000000,1) as Total_Overdue FROM outstanding_salescode_11j", con))
                {
                    using (SqlDataReader sdr = cmd.ExecuteReader())
                    {
                        if (sdr.Read())
                        {
                            return sdr["Total_Overdue"].ToString();
                        }
                    }
                }
            }
            return string.Empty;
        }
    }
}