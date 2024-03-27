using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Entities;
using BLL;

namespace DoAn.Pages.MHLoaihang
{
    public class IndexModel : PageModel
    {
        public List<Loaihang> dsLoaihang { get; set; }
        private XLLoaihang XulyLoaihang { get; set; }
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
        public IndexModel() : base()
        {
            XulyLoaihang = new XLLoaihang();
        }
        
        public void OnGet()
        {
            dsLoaihang = XulyLoaihang.Doc().Cast<Loaihang>().ToList();
        }

        public void OnPost()
        {
            dsLoaihang = XulyLoaihang.Timkiem(Keyword);
        }
    }
}
