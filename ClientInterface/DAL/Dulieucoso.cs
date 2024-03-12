using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Entities;


namespace DAL
{
    public abstract class Dulieucoso
    {
        protected string filename;
        public Dulieucoso(string filename)
        {
            this.filename = filename;
        }
        public abstract void Luu(List<Loaihang> dsLoaihang);
        public abstract List<Loaihang> Doc();

        public void Them(Loaihang theloai)
        {
            var dsTheloai = Doc();
            int maxId = 0;
            foreach (var p in dsTheloai)
            {
                maxId = Math.Max(p.Ma, maxId);
            }
            theloai.Ma = maxId + 1;
            dsTheloai.Add(theloai);
            Luu(dsTheloai);
        }

        public void Sua(Loaihang theloai)
        {
            var dsTheloai = Doc();
            int idx = dsTheloai.FindIndex(p => p.Ma == theloai.Ma);
            if (idx != -1)
            {
                dsTheloai.RemoveAt(idx);
                dsTheloai.Insert(idx, theloai);
                Luu(dsTheloai);
            }
        }
        public Loaihang Timkiem(int ma)
        {
            var dsTheloai = Doc();
            Loaihang kq = dsTheloai.Find(kq => kq.Ma == ma);
            return kq;
        }
        public void Xoa(int Ma)
        {
            var dsTheloai = Doc();
            dsTheloai.RemoveAll(p => p.Ma == Ma);
            Luu(dsTheloai);
        }
    }
}
