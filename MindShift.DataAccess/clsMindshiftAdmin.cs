using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Xml.Linq;
using System.Xml;
using System.Data;

namespace MindShift.DataAccess
{
   public class clsMindshiftAdmin
    {
        public string getDisplayQues(string sLocation)
        {           
            System.Xml.XmlDocument xmlDoc = new System.Xml.XmlDocument();
            xmlDoc.Load(sLocation);
            return xmlDoc.SelectSingleNode("QUIZ/Display/Number").InnerText;
        }

        public DataTable loadPanels(string sLocation)
        {
            DataTable dt = new DataTable();
            DataSet dsPanels = new DataSet();
            dsPanels.ReadXml(sLocation);
            if(dsPanels.Tables.Count>0)
            {
                dt = dsPanels.Tables[0];
            }
            return dt;
        }

        public void saveDisplay(string sLocation, string number)
        {
            System.Xml.XmlDocument xmlDoc = new System.Xml.XmlDocument();
            xmlDoc.Load(sLocation);
            xmlDoc.SelectSingleNode("QUIZ/Display/Number").InnerText = number;
            xmlDoc.Save(sLocation);
        }

        public void createNewPanel(string sLocation,string sHeader,string sContent)
        {
            //create new instance of XmlDocument
            XmlDocument doc = new XmlDocument();

            doc.Load(sLocation);
            XmlElement root = doc.DocumentElement;
            XmlNodeList elemList = root.GetElementsByTagName("Panel");
            //create node and add value

            XmlNode node = doc.CreateNode(XmlNodeType.Element, "Panel", null);

           
            XmlNode nodeID = doc.CreateElement("ID");

            nodeID.InnerText = Convert.ToString(elemList.Count + 2);

            
            XmlNode nodeContent = doc.CreateElement("Text");
            nodeContent.InnerText = sContent;

            
            XmlNode nodeHeader = doc.CreateElement("Header");
            nodeHeader.InnerText = sHeader;

           
            XmlNode nodeName = doc.CreateElement("Name");
            nodeName.InnerText = sHeader;


           
            XmlNode nodeEnable = doc.CreateElement("Enable");
            nodeEnable.InnerText = "true";

            
            node.AppendChild(nodeID);
            node.AppendChild(nodeName);
            node.AppendChild(nodeEnable);
            node.AppendChild(nodeHeader);
            node.AppendChild(nodeContent);


            
            doc.DocumentElement.AppendChild(node);

           
            doc.Save(sLocation);
        }

    }
}
