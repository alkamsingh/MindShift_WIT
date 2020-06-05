using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;
using System.Data;
using System.IO;
using System.Xml.Linq;
using System.Linq;
using System.Xml;



namespace MindShift
{
    /*
   The  MindshiftAdmin class
   Contains all methods for managing Different Sections for UI
*/
    public partial class MindshiftAdmin : System.Web.UI.Page
    {
        MindShift.Models.clsMindshiftAdmin clsMindAdmin = new MindShift.Models.clsMindshiftAdmin();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                loadPanels();
                getDisplayQues();
            }

        }

        // read how many questions needs to be display in Quiz section of UI
        void getDisplayQues()
        {
            string number = clsMindAdmin.getDisplayQues(HttpContext.Current.Server.MapPath("~/XML/Quiz.xml"));
            foreach (ListItem li in ddlDisplayQuiz.Items)
            {
                if (li.Text == number)
                {
                    li.Selected = true;
                }
            }
        }

        // read the details of Sections from XML
        void loadPanels()
        {
            ddlPanels.DataSource = clsMindAdmin.loadPanels(HttpContext.Current.Server.MapPath("~/XML/Panels.xml"));
            ddlPanels.DataBind();
        }

        // save the changes made by Admin to enable or disable the sections on UI
        protected void btnSave_Click(object sender, EventArgs e)
        {
            string panelsid = string.Empty;
            foreach (DataListItem dlitem in ddlPanels.Items)
            {
                CheckBox chkPanel = dlitem.FindControl("chkPanel") as CheckBox;
                if (chkPanel.Checked)
                {
                    Label lblID = dlitem.FindControl("lblID") as Label;

                    if (string.IsNullOrEmpty(panelsid))
                    {
                        panelsid = lblID.Text;
                    }
                    else
                    {
                        panelsid = panelsid + "," + lblID.Text;
                    }
                }
            }

            // Temporarily we are disabling the Sections thru session only 
            if (!string.IsNullOrEmpty(panelsid))
            {
                Session["panel"] = panelsid;
            }

            lblMsgPanel.Text = "Changes got saved successfully";
            lblMsgPanel.Visible = true;
        }

        // save the count of questions need to be display in Quiz section
        protected void btnSaveQues_Click(object sender, EventArgs e)
        {
            clsMindAdmin.saveDisplay(HttpContext.Current.Server.MapPath("~/XML/Quiz.xml"), ddlDisplayQuiz.SelectedValue);
        }

        // create the new Node in XML for creation of New section on UI
        protected void btnCreate_Click(object sender, EventArgs e)
        {
            lblMsg.Visible = false;
            if (txtHeader.Value != "" && txtEditor.Text != "")
            {
                clsMindAdmin.createNewPanel(HttpContext.Current.Server.MapPath("~/XML/Panels.xml"), txtHeader.Value, " <![CDATA[" + txtEditor.Text + "]]>");
                lblMsg.Text = "New section added successfully!!";
                lblMsg.Visible = true;
                loadPanels();
            }
            else
            {
                lblMsg.Text = "Please enter Header and Content for new Section!!";
                lblMsg.Visible = true;
            }

        }

        // binding the checkboxes to enable or disable based on details saved in XML file
        protected void ddlPanels_ItemDataBound(object sender, DataListItemEventArgs e)
        {
            Label lblEnable = e.Item.FindControl("lblEnable") as Label;
            CheckBox chkPanel = e.Item.FindControl("chkPanel") as CheckBox;
            if (lblEnable.Text.Trim().ToUpper()=="TRUE")
            {
                chkPanel.Checked = true;
            }
        }
    }
}