using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entities
{
    public class Hoadonnhap : Loaihang
    {
        public Hoadonnhap()
        {

        }
        public Hoadonnhap(int ma, string ten, int mamathang, int soluong, DateTime ngaynhap)
        {
            this.Ma = ma;
            this.Ten = ten;
            this.MaMathang = mamathang;
            this.Soluong = soluong;
            this.Ngaynhap = ngaynhap;
        }
        public int MaMathang { get; set; }
        public int Soluong { get; set; }
        public DateTime Ngaynhap { get; set; }
    }
}
