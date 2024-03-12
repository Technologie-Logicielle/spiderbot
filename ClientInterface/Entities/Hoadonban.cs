using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entities
{
    /// <summary>
    /// Hoá đơn bán hàng
    /// </summary>
    public class Hoadonban : Loaihang
    {
        public Hoadonban() 
        {

        }
        public Hoadonban(int ma, string ten, int mamathang, int soluong, DateTime ngayban)
        {
            this.Ma = ma;
            this.Ten = ten;
            this.MaMathang = mamathang;
            this.Soluong = soluong;
            this.Ngayban = ngayban;
        }        

        public int MaMathang { get; set; }
        public int Soluong { get; set; }
        public DateTime Ngayban { get; set; }
    }
}
