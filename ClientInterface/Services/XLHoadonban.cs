using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DAL;
using Entities;

namespace BLL
{
    public class XLHoadonban : Xuly
    {
        public XLHoadonban() : base()
        {
            data = new Dulieuhoandonban();
        }
        public List<Hoadonban> Timkiem(string tukhoa)
        {
            List<Hoadonban> dsHoadonban = data.Doc().Cast<Hoadonban>().ToList();
            return dsHoadonban.FindAll(ketqua => ketqua.Ten.Contains(tukhoa));
        }        
    }
}
