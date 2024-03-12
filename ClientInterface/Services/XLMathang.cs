using System;
using Entities;
using DAL;
using System.Collections.Generic;
using System.Linq;

namespace BLL
{
    public class XLMathang : Xuly
    {
        public XLMathang() : base()
        {
            data = new Dulieumathang();
        }
        
        public List<Mathang> Timkiem(string tukhoa)
        {
            List<Mathang> dsMathang = data.Doc().Cast<Mathang>().ToList();
            return dsMathang.FindAll(ketqua => ketqua.Ten.Contains(tukhoa));
        }
        public List<Mathang> TimkiemMH(string tukhoa)
        {
            List<Mathang> dsMathang = data.Doc().Cast<Mathang>().ToList();
            if (dsMathang.FindAll(ketqua => ketqua.CongTy.Contains(tukhoa)).Count > 0)
            {
                return dsMathang.FindAll(ketqua => ketqua.CongTy.Contains(tukhoa));
            }
            else if (dsMathang.FindAll(ketqua => ketqua.Ten.Contains(tukhoa)).Count > 0)
            {
                return dsMathang.FindAll(ketqua => ketqua.Ten.Contains(tukhoa));
            }
            return dsMathang.FindAll(ketqua => ketqua.Ten.Contains(tukhoa));

        }
    }
}
