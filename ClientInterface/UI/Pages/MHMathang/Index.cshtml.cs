using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Entities;
using BLL;

namespace DoAn.Pages.MHMathang
{
    public class IndexModel : PageModel
    {
        public List<Mathang> dsMathang { get; set; }
        private XLLoaihang Xulyloaihang;
        private XLMathang Xulymathang;

        private string keyword;
        [BindProperty]
        public string Keyword
        {
            get => keyword;
            set
            {
                if (value == null)
                {
                    keyword = "";
                } else
                {
                    keyword = value;
                }
            }
        }
        public List<Loaihang> dsLoaihang { get; set; }
        public IndexModel() : base()
        {
            Xulymathang = new XLMathang();
            Xulyloaihang = new XLLoaihang();
        }
        public void OnGet()
        {
            dsMathang = Xulymathang.Doc().Cast<Mathang>().ToList();
            dsLoaihang = Xulyloaihang.Doc().Cast<Loaihang>().ToList();
        }

        public void OnPost()
        {
            dsMathang = Xulymathang.TimkiemMH(Keyword);
            dsLoaihang = Xulyloaihang.Doc().Cast<Loaihang>().ToList();
        }

        public string TimtenLoaihangtheoma(int Maloaihang)
        {
            Loaihang ketqua = dsLoaihang.Find(ketqua => ketqua.Ma == Maloaihang);
            return ketqua.Ten;
        }
    }
}
