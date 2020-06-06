using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using System.Xml;
using MindShift.DataAccess;

namespace MindShift.Models
{
    public class clsMindshiftEmployee
    {
        DataAccess.clsMindshiftEmployee clsMind = new DataAccess.clsMindshiftEmployee();
        public DataView readPanels(string sID, string sLocation)
        {
            return clsMind.readPanels(sID, sLocation);

        }
        public DataView readQuiz(string sLocation)
        {
            return clsMind.readQuiz(sLocation);
        }

        public void updateQues(string sID, string sLocation)
        {
            clsMind.updateQues(sID, sLocation);
        }
        public string getJokeImage(string sLocation)
        {
            return clsMind.getJokeImage(sLocation);
        }
        public void updateImage(string sID, string sLocation)
        {
            clsMind.updateImage(sID, sLocation);
        }
    }
}
