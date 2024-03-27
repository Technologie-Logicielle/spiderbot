using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entities
{
    public class Loaihang
    {
        public int Ma { get; set; }
        public string Ten { get; set; }
        public Loaihang()
        {

        }
        public Loaihang(int ma, string ten)
        {
            this.Ma = ma;
            this.Ten = ten;
        }
    }
}
