﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

namespace EmployeeData
{
    public partial class EmployeeData : System.Web.UI.Page
    {
        private SqlConnection obj = null;
        private SqlCommand cmd = null;
        private SqlDataAdapter adapter = null;
        private DataSet ds = null;
        protected void Page_Load(object sender, EventArgs e)
        {
            this.grid();

        }

        public void grid()
        {

            using (obj = new SqlConnection(ConfigurationManager.ConnectionStrings["EclerxConnectionString"].ConnectionString))
            {
                using (adapter = new SqlDataAdapter("select * from EmployeeData", obj))
                {
                    ds = new DataSet();
                    adapter.Fill(ds, "EmpData");
                    GridEmployee.DataSource = ds.Tables["EmpData"];
                    GridEmployee.DataBind();
                }
            }

        }

        protected void GridEmployee_SelectedIndexChanged(object sender, EventArgs e)
        {
            //this is for showing the selected index value to the textbox in the update panel
            TxtId.Text = GridEmployee.SelectedRow.Cells[1].Text;
            TxtPcidssUserName.Text = GridEmployee.SelectedRow.Cells[2].Text;
            TxtUserName.Text=GridEmployee.SelectedRow.Cells[3].Text;
            TxtEmail.Text=GridEmployee.SelectedRow.Cells[4].Text;
            TxtPublicRoles.Text=GridEmployee.SelectedRow.Cells[5].Text;
            TxtAdminRoles.Text=GridEmployee.SelectedRow.Cells[6].Text;
            
            TxtId.Enabled = false;
            ModalPopupExtender1.Show();

        }

        protected void BtnUpdate_Click(object sender, EventArgs e)
        {
            using (obj = new SqlConnection(ConfigurationManager.ConnectionStrings["EclerxConnectionString"].ConnectionString))
            {
                using (cmd = new SqlCommand("usp_UpdateEmployee", obj))
                {
                    //This is for updating data by the id with the sp
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@ID", TxtId.Text);
                    cmd.Parameters.AddWithValue("@PCIDSSUSERNAME", TxtPcidssUserName.Text);
                    cmd.Parameters.AddWithValue("@ECLERXUSERNAME",TxtUserName.Text);
                    cmd.Parameters.AddWithValue("@EMAIL", TxtEmail.Text);
                    cmd.Parameters.AddWithValue("@PUBLICROLES", TxtPublicRoles.Text);
                    cmd.Parameters.AddWithValue("@ADMINROLES", TxtAdminRoles.Text);


                    if (obj.State == ConnectionState.Closed)
                    {
                        obj.Open();
                    }
                    cmd.ExecuteNonQuery();

                    this.grid();

                }
            }
        }

        protected void BtnCreate_Click(object sender, EventArgs e)
        {
            //This is for showing the pop up panel for inserting data into the database
            ModalPopupExtender2.Show();
        }

        protected void BtnInsert_Click(object sender, EventArgs e)
        {
            using (obj = new SqlConnection(ConfigurationManager.ConnectionStrings["EclerxConnectionString"].ConnectionString))
            {
                using (cmd = new SqlCommand("usp_CreateUser", obj))
                {
                    //This is for inserting data into the database like adding new items by sp
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@ID",TxtInId.Text);
                    cmd.Parameters.AddWithValue("@PCIDSSUSERNAME", TxtInPUserName.Text);
                    cmd.Parameters.AddWithValue("@ECLERXUSERNAME", TxtInExUserName.Text);
                    cmd.Parameters.AddWithValue("@EMAIL", TxtInEmail.Text);
                    cmd.Parameters.AddWithValue("@PUBLICROLES",TxtInPublicRoles.Text);
                    cmd.Parameters.AddWithValue("@ADMINROLES", TxtInAdminRoles.Text);
                    cmd.Parameters.AddWithValue("@STATUS", DdlStatus.Text);


                    //After adding data then to clear all the text from the text box
                    this.reset();

                    if (obj.State == ConnectionState.Closed)
                    {
                        obj.Open();
                    }
                    cmd.ExecuteNonQuery();


                    this.grid();

                   

                }
            }
        }

       public void reset()
        {
            TxtInId.Text = "";
            TxtInPUserName.Text = "";
            TxtInExUserName.Text = "";
            TxtInEmail.Text = "";
            TxtInPublicRoles.Text = "";
            TxtInAdminRoles.Text = "";
        }

        
    }
}