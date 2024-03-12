using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Entities;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using BLL;

namespace DoAn.Pages.MHBanhang
{
    public class IndexModel : PageModel
    {
        public List<Hoadonban> dsHoadonban { get; set; }
        private XLHoadonban Xulyhoadonban = new XLHoadonban();
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
            dsHoadonban = Xulyhoadonban.Doc().Cast<Hoadonban>().ToList();
        }
        public void OnPost()
        {
            dsHoadonban = Xulyhoadonban.Timkiem(Keyword).Cast<Hoadonban>().ToList();
        }

        public string GetProductName(int productId)
        {
            Mathang ketqua = (Mathang)Xulymathang.Timkiem(productId);
            return ketqua.Ten;
        }
    }
}
