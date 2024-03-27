using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DAL;
using Entities;

namespace BLL
{   
    public class Thongke
    {
        private XLMathang Xulymathang = new XLMathang();
        private XLHoadonnhap Xulyhoadonnhap = new XLHoadonnhap();        //
        private XLHoadonban Xulyhoadonban = new XLHoadonban();
        public Dictionary<int, int> Soluonghangtontheomathang()
        {
            var dsMathangs = Xulymathang.Doc().Cast<Mathang>().ToList();            
            var dsHoadonnhaps = Xulyhoadonnhap.Doc().Cast<Hoadonnhap>().ToList();
            var dsHoadonbans = Xulyhoadonban.Doc().Cast<Hoadonban>().ToList();
            Dictionary<int, int> ketqua = new Dictionary<int, int>();            
            foreach (var mathang in dsMathangs)
            {
                int soluonghangton = 0;
                foreach(var hoadonnhap in dsHoadonnhaps)
                {
                    if (mathang.Ma == hoadonnhap.MaMathang)
                    {
                        soluonghangton += hoadonnhap.Soluong;
                    }
                }
                foreach (var hoadonban in dsHoadonbans)
                {
                    if (mathang.Ma == hoadonban.MaMathang)
                    {
                        soluonghangton -= hoadonban.Soluong;
                    }
                }
                ketqua.Add(mathang.Ma, soluonghangton);
            }
            return ketqua;
            //mathang.Ma - soluong
        }
        public Dictionary<int, int> Thongketheoloaihang(int Maloaihang)
        {
            var Dshangtontheoloaihang = new Dictionary<int, int>();
            var Dshangtontheomathang = Soluonghangtontheomathang();
            foreach (var (Mamathang, Soluong) in Dshangtontheomathang)
            {
                var mathang = (Mathang)Xulymathang.Timkiem(Mamathang);
                if (mathang.Loaihang == Maloaihang)
                {
                    Dshangtontheoloaihang.Add(Mamathang, Soluong);
                }
            }
            return Dshangtontheoloaihang;
            //mamathang - so luong (key loai hang)
        }
        
        public Dictionary<Mathang, int>  Kiemtrahanghethan(DateTime date)
        {
            var dsMathangton = Soluonghangtontheomathang();
            var ketqua = new Dictionary<Mathang, int>();
            foreach (var (mamathang, soluong) in dsMathangton)
            {
                if (soluong > 0)
                {
                    Mathang mathang = (Mathang)Xulymathang.Timkiem(mamathang);
                    if (mathang.HanDung < date)
                    {
                        ketqua.Add(mathang, soluong);
                    }
                }
            }
            return ketqua;
        }
    }
}
