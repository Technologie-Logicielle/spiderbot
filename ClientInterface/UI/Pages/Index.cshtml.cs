using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.Extensions.Logging;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Entities;
using BLL;

namespace DoAn.Pages
{
    public class IndexModel : PageModel
    {
        [BindProperty]
        public int maLoaihang { get; set; }
        public List<Mathang> dsMathang { get; set; }
        public List<Loaihang> dsLoaihang { get; set; }

        public XLMathang Xulymathang = new XLMathang();
        public XLLoaihang Xulyloaihang = new XLLoaihang();
        public Thongke thongke { get; set; } = new Thongke();
        public Dictionary<int, int> Soluonghangtontheomathang { get; set; }
        public void OnGet()
        {
            dsMathang = Xulymathang.Doc().Cast<Mathang>().ToList();
            dsLoaihang = Xulyloaihang.Doc().Cast<Loaihang>().ToList();

            if (dsLoaihang.Count > 0)
            {
                maLoaihang = dsLoaihang[0].Ma;
                Soluonghangtontheomathang = thongke.Thongketheoloaihang(maLoaihang);
            } else
            {
                maLoaihang = -1;
                Soluonghangtontheomathang = new();
            }
        }

        public void OnPost()
        {
            dsMathang = Xulymathang.Doc().Cast<Mathang>().ToList();
            dsLoaihang = Xulyloaihang.Doc().Cast<Loaihang>().ToList();

            Soluonghangtontheomathang = thongke.Thongketheoloaihang(maLoaihang);
        }

        public string GetCategoryName(int categoryId)
        {
            Loaihang loaihang = dsLoaihang.Find(loaihang => loaihang.Ma == categoryId);
            return loaihang.Ten;
        }

        public string GetProductName(int Mamathang)
        {
            Mathang mathang = dsMathang.Find(mathang => mathang.Ma== Mamathang);
            return mathang.Ten;
        }
    }
}
