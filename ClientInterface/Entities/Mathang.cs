using System;

namespace Entities
{
    public class Mathang : Loaihang
    {
        public Mathang()
        {

        }
        public Mathang(int ma, string ten, DateTime handung, string congty, int namsx, int loaihang)
        {
            this.Ma = ma;
            this.Ten = ten;
            this.HanDung = handung;
            this.CongTy = congty;
            this.NamSX = namsx;
            this.Loaihang = loaihang;
        }
        public DateTime HanDung { get; set; }
        public string CongTy { get; set; }
        public int NamSX { get; set; }
        public int Loaihang { get; set; }
    }
}
