using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Entities;
using DAL;

namespace BLL
{
    public class XLLoaihang : Xuly
    {
        public XLLoaihang() : base()
        {
            data = new Dulieuloaihang();
        }
        public List<Loaihang> Timkiem(string tukhoa)
        {
            List<Loaihang> dsLoaihang = data.Doc().Cast<Loaihang>().ToList();
            return dsLoaihang.FindAll(ketqua => ketqua.Ten.Contains(tukhoa));
        }
    }
}
