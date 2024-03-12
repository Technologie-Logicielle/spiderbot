using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DAL;
using Entities;

namespace BLL
{
    public class Xuly
    {        
        protected Dulieucoso data;

        public List<Loaihang> Doc()
        {
            return data.Doc();
        }

        public void Them(Loaihang Loaihang)
        {
            data.Them(Loaihang);
        }

        public void Sua(Loaihang Loaihang)
        {
            data.Sua(Loaihang);
        }

        public Loaihang Timkiem(int Ma)
        {
            return data.Timkiem(Ma);
        }

        public void Xoa(int Ma)
        {
            data.Xoa(Ma);
        }
    }
}
