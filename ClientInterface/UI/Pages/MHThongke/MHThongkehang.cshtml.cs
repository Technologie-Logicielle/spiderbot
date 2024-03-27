using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.Extensions.Logging;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Entities;
using BLL;

namespace DoAn.Pages.MHThongke
{
    public class MHThongkehang : PageModel
    {
        [BindProperty]
        public int maLoaihang { get; set; }
        public List<Mathang> dsMathang { get; set; }
        public List<Loaihang> dsLoaihang { get; set; }

        private XLLoaihang Xulyloaihang = new XLLoaihang();
        public XLMathang Xulymathang = new XLMathang();
        public Thongke thongke { get; set; } = new Thongke();
        public Dictionary<int, int> Demsoluongmathangtheoloaihang { get; set; }


        public void OnGet()
        {
            dsMathang = Xulymathang.Doc().Cast<Mathang>().ToList();
            dsLoaihang = Xulyloaihang.Doc().Cast<Loaihang>().ToList();

            if (dsLoaihang.Count > 0)
            {
                maLoaihang = dsLoaihang[0].Ma;
                Demsoluongmathangtheoloaihang = thongke.Thongketheoloaihang(maLoaihang);
            }
            else
            {
                maLoaihang = -1;
                Demsoluongmathangtheoloaihang = new();
            }
        }

        public void OnPost()
        {
            dsMathang = Xulymathang.Doc().Cast<Mathang>().ToList();
            dsLoaihang = Xulyloaihang.Doc().Cast<Loaihang>().ToList();
            Demsoluongmathangtheoloaihang = thongke.Thongketheoloaihang(maLoaihang);
        }        
    }
}

