using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;


namespace MindShift.Models
{
    public class clsMindshiftAdmin
    {

        MindShift.DataAccess.clsMindshiftAdmin clsMindAdmin = new DataAccess.clsMindshiftAdmin();

        public string getDisplayQues(string sLocation)
        {
            return clsMindAdmin.getDisplayQues(sLocation);
        }

        public DataTable loadPanels(string sLocation)
        {
            return clsMindAdmin.loadPanels(sLocation);
        }
        public void saveDisplay(string sLocation, string number)
        {
            clsMindAdmin.saveDisplay(sLocation, number);
        }

        public void createNewPanel(string sLocation, string sHeader, string sContent)
        {
            clsMindAdmin.createNewPanel(sLocation, sHeader, sContent);
        }
    }
}
