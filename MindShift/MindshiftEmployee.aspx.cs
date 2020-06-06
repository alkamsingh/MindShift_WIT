using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace MindShift
{
    /*
    The  MindshiftEmployee class
    Contains all methods for displaying Different Sections
*/
    public partial class MindshiftEmployee : System.Web.UI.Page
    {
        MindShift.Models.clsMindshiftEmployee clsMind = new MindShift.Models.clsMindshiftEmployee();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {

                string id = string.Empty;
                if (!string.IsNullOrEmpty(Convert.ToString(Session["panel"])))
                {
                    id = Convert.ToString(Session["panel"]);
                }
               
                readQuiz();
                readPanels(id);
            }
        }
      
        // read the details of all enables sections from XML file
        void readPanels(string sID)
        {
            DataView dvPanels = clsMind.readPanels(sID, HttpContext.Current.Server.MapPath("~/XML/Panels.xml"));
            if (dvPanels.Count > 0)
            {
                ddlPanels.DataSource = dvPanels;
                ddlPanels.DataBind();
            }
        }      

        // create the Options for questions as radio buttons at runtime        
        protected void ddlQuiz_ItemDataBound(object sender, DataListItemEventArgs e)
        {
            RadioButtonList rbList = e.Item.FindControl("rdbQuiz") as RadioButtonList;
            Label lblOptions = e.Item.FindControl("lblOptions") as Label;
            
            if (!string.IsNullOrEmpty(lblOptions.Text))
            {
                string[] arOptions = lblOptions.Text.Split(',');
                rbList.DataSource = arOptions;
                rbList.DataBind();
            }

        }
        // read the Questions available to display from XML file
        void readQuiz()
        {
            DataView dvQues = clsMind.readQuiz(HttpContext.Current.Server.MapPath("~/XML/Quiz.xml"));
            if (dvQues.Count > 0)
            {
                ddlQuiz.DataSource = dvQues;
                ddlQuiz.DataBind();
            }
        }

        // check the correct and incorrect answers submit by User and display them
        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            string id = string.Empty;
            int totalques = ddlQuiz.Items.Count;
            int iCorrect = 0;

            foreach (DataListItem dlitem in ddlQuiz.Items)
            {
                RadioButtonList rdList = dlitem.FindControl("rdbQuiz") as RadioButtonList;
                Label lblAnswer = dlitem.FindControl("lblAnswer") as Label;
                Label lblcorrect = dlitem.FindControl("lblcorrect") as Label;
                Label lblID = dlitem.FindControl("lblID") as Label;
                string option = rdList.SelectedValue;
                string answer = lblAnswer.Text;
                if (option.ToUpper().Trim() != answer.ToUpper().Trim())
                {
                    lblcorrect.Text = "Correct Answer: " + answer;
                    lblcorrect.Visible = true;
                }
                else
                {
                    lblcorrect.Visible = false;
                    iCorrect++;
                }
                clsMind.updateQues(lblID.Text, HttpContext.Current.Server.MapPath("~/XML/Quiz.xml"));

            }
            double percent = (double)(iCorrect * 100) / totalques;
            double ipercent = Math.Round(percent, 2);

            lblPercent.Text = "You have given " + Convert.ToString(ipercent) + "% correct answers";
            lblPercent.Visible = true;
        }

        protected void ddlPanels_ItemDataBound(object sender, DataListItemEventArgs e)
        {
            Label lbltext = e.Item.FindControl("lbltext") as Label;
        }
    }
}