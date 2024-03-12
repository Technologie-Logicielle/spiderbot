using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Entities;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using BLL;

namespace DoAn.Pages.MHNhaphang
{
    public class IndexModel : PageModel
    {
        public List<Hoadonnhap> dsHoadonnhap { get; set; }
        public List<Mathang> dsmathang { get; set; } = new List<Mathang>();
        private XLHoadonnhap Xulyhoadonnhap = new XLHoadonnhap();
        private XLMathang Xulymathang = new XLMathang();        
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
                }
                else
                {
                    keyword = value;
                }
            }
        }
        public void OnGet()
        {
            dsHoadonnhap = Xulyhoadonnhap.Doc().Cast<Hoadonnhap>().ToList();
        }
        public void OnPost()
        {
            dsHoadonnhap = Xulyhoadonnhap.Timkiem(Keyword).Cast<Hoadonnhap>().ToList();
        }
        public string TimtenmathangtheoMa(int Mamathang)
        {
            var ketqua = (Mathang)Xulymathang.Timkiem(Mamathang);
            return ketqua.Ten;            
        }
    }
}
