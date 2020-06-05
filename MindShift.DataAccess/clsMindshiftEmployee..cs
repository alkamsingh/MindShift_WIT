using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using System.Xml;


namespace MindShift.DataAccess
{
    public class clsMindshiftEmployee
    {

        public DataView readPanels(string sID,string sLocation)
        {
            DataSet dsPanels = new DataSet();
            DataView dvPanels = new DataView();         
            dsPanels.ReadXml(sLocation);
            if (dsPanels.Tables.Count > 0)
            {
                DataTable dtPanels = dsPanels.Tables[0];
                dvPanels = dtPanels.DefaultView;
                if (!string.IsNullOrEmpty(sID))
                {
                    dvPanels.RowFilter = "id in (" + sID + ")";
                }
            }
            return dvPanels;
        }

        public DataView readQuiz(string sLocation)
        {
            DataSet dsQuiz = new DataSet();
            DataView dvQues = new DataView();
            dsQuiz.ReadXml(sLocation);
            int display = 4;
            if (dsQuiz.Tables.Count > 1)
            {
                DataTable dtQues = dsQuiz.Tables[0];
                DataTable dtDisplay = dsQuiz.Tables[1];
                if (dtDisplay.Rows.Count > 0)
                {
                    display = Convert.ToInt32(dtDisplay.Rows[0][0]);
                }
                if (dtQues.Rows.Count > 0)
                {
                    dvQues = dtQues.DefaultView;
                    dvQues.RowFilter = "status='open'";
                    if (dvQues.Count > 0)
                    {
                        dvQues = GetTopDataViewRows(dvQues, display);                       
                    }
                }
            }
            return dvQues;
        }

        private DataView GetTopDataViewRows(DataView dv, Int32 n)
        {
            DataTable dt = dv.Table.Clone();
            for (int i = 0; i < n; i++)
            {
                if (i >= dv.Count)
                {
                    break;
                }
                dt.ImportRow(dv[i].Row);
            }
            return new DataView(dt, dv.RowFilter, dv.Sort, dv.RowStateFilter);
        }

        public void updateQues(string sID, string sLocation)
        {
            System.Xml.XmlDocument xmlDoc = new System.Xml.XmlDocument();
            xmlDoc.Load(sLocation);
            var node = xmlDoc.DocumentElement.SelectSingleNode(
"/QUIZ/Question[ID='" + sID + "']/Status");
            node.InnerText = "open";
            xmlDoc.Save(sLocation);
        }

       public  string getJokeImage(string sLocation)
        {
            string imageURL = string.Empty;
            DataSet dsImages = new DataSet();
            dsImages.ReadXml(sLocation);
            if (dsImages.Tables.Count > 0)
            {
                DataTable dtImages = dsImages.Tables[0];

                if (dtImages.Rows.Count > 0)
                {
                    DataView dvImages = dtImages.DefaultView;
                    dvImages.RowFilter = "status='open'";
                    if (dvImages.Count > 0)
                    {
                        dvImages = GetTopDataViewRows(dvImages, 1);
                        imageURL = Convert.ToString(dvImages[0]["imageURL"]) + "_" + Convert.ToString(dvImages[0]["ID"]);
                    }
                }
            }
            return imageURL;
        }
       public void updateImage(string sID,string sLocation)
        {
            System.Xml.XmlDocument xmlDoc = new System.Xml.XmlDocument();
            xmlDoc.Load(sLocation);
            var node = xmlDoc.DocumentElement.SelectSingleNode(
"/Jokes/joke[ID='" + sID + "']/status");
            node.InnerText = "open";
            xmlDoc.Save(sLocation);

        }

    }
}
