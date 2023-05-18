using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using InfoSoftGlobal;
using System.Text;
using System.Data;


public partial class OPT_Default : System.Web.UI.Page
{

    clsDataAccess cls = new clsDataAccess();
    string charttype = string.Empty;
    void bind3d()
    {
        StringBuilder strXML = new StringBuilder();

        //$strXML will be used to store the entire XML document generated
        //Generate the chart element

        string factoryQuery = string.Empty;
        DataTable dt;
        if (ddltype.SelectedValue == "R")
        {
            strXML.Append("<chart caption='Candidate Wise  Chart Of Voting' subCaption='' pieSliceDepth='40'  formatNumberScale='0' numberSuffix=' '>");

            factoryQuery = @"select tblPatientRegistration.regno,Name,isNull(R.total,0) as Total from tbl_PatientRegistration

                    left outer join(

                    select appointment_no,regno,COUNT(*) as total from tbl_appointment group by regno,appointment_no having appointment_no='        ) as R on R.regno=tbl_PatientRegistration.regno 

       
                    order by Name";
            dt = cls.GetDataTable(factoryQuery);
            //Iterate through each record
            foreach (DataRow DR in dt.Rows)
            {
                //Generate <set name='..' value='..' />		

                strXML.AppendFormat("<set label='{0}' value='{1}' />", DR["Name"].ToString(), DR["Total"].ToString());

                //  }
                //free the resultset

            }


        }

        else
        {
            strXML.Append("<chart caption='Gender Wise Patient Appointment' subCaption='' pieSliceDepth='40'  formatNumberScale='0' numberSuffix=' '>");

            factoryQuery = @"
            select count(*) as total,sum(case tbl_PatientRegistration.Gender when 'Male' then 1 else 0 end)  as Male

            ,sum(case tbl_PatientRegistration.Gender when 'Female' then 1 else 0 end)  as Female,
             sum(case tbl_PatientRegistration.Gender when 'Other' then 1 else 0 end)  as Other
             from  tbl_PatientRegistration
            ";
            dt = cls.GetDataTable(factoryQuery);

            DataTable dtNew = new DataTable();
            dtNew.Columns.Add("Total", typeof(string));
            dtNew.Columns.Add("Gender", typeof(string));
            DataRow dr = dtNew.NewRow();

            dr["Gender"] = "Male";
            dr["Total"] = dt.Rows[0]["Male"].ToString();

            dtNew.Rows.Add(dr);

            DataRow dr1 = dtNew.NewRow();

            dr1["Gender"] = "Female";
            dr1["Total"] = dt.Rows[0]["Female"].ToString();
            dtNew.Rows.Add(dr1);

            DataRow dr2 = dtNew.NewRow();
            dr2["Gender"] = "Other";
            dr2["Total"] = dt.Rows[0]["Other"].ToString();
            dtNew.Rows.Add(dr2);
            //Iterate through each record
            foreach (DataRow DR in dtNew.Rows)
            {
                //Generate <set name='..' value='..' />		

                strXML.AppendFormat("<set label='{0}' value='{1}'  />", DR["Gender"].ToString(), DR["Total"].ToString());

                //  }
                //free the resultset

            }

        }



        //Finally, close <chart> element
        strXML.Append("</chart>");


        //Create the chart - Pie 3D Chart with data from strXML
        Literal1.Text = FusionCharts.RenderChart(charttype, "", strXML.ToString(), "FactorySum", "980", "600", false, true, false);
    }

    void bindData()
    {
        if (RadioButtonList1.SelectedValue == "1")
            charttype = "FusionCharts/Column3D.swf";
        else if (RadioButtonList1.SelectedValue == "2")
            charttype = "FusionCharts/Column2D.swf";
        else if (RadioButtonList1.SelectedValue == "3")
            charttype = "FusionCharts/Line.swf";
        else if (RadioButtonList1.SelectedValue == "4")
            charttype = "FusionCharts/Pie3D.swf";

        bind3d();
    }


    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["UserId"] == null)
        {
            Response.Redirect("~/FrmLogin.aspx");
        }
        if (!IsPostBack)
        {

            bindData();
        }
    }
    protected void RadioButtonList1_SelectedIndexChanged(object sender, EventArgs e)
    {
        bindData();
    }
    protected void ddlpost_SelectedIndexChanged(object sender, EventArgs e)
    {
        bindData();
    }
    protected void ddltype_SelectedIndexChanged(object sender, EventArgs e)
    {
        bindData();
    }
}