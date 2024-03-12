using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Entities;
using DAL;

namespace BLL
{
    public class XLHoadonnhap : Xuly
    {
        public XLHoadonnhap() : base()
        {
            data = new Dulieuhoadonnhap();
        }
        public List<Hoadonnhap> Timkiem(string tukhoa)
        {
            List<Hoadonnhap> dsHoadonnhap = data.Doc().Cast<Hoadonnhap>().ToList();
            return dsHoadonnhap.FindAll(ketqua => ketqua.Ten.Contains(tukhoa));
        }

    }
}
