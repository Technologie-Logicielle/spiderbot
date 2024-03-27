using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;
using Entities;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using BLL;

namespace DoAn.Pages.MHNhaphang
{
    public class CreateModel : PageModel
    {
        [Required]
        [BindProperty]
        public string Ten { get; set; }
        [Required]
        [BindProperty]
        public int Mamathang { get; set; }
        [Required]
        [BindProperty]
        [Range(1,int.MaxValue, ErrorMessage = "Số lượng phải lớn hơn 0")]
        public int Soluong { get; set; }
        [Required]
        [BindProperty]
        [DataType(DataType.Date)]
        public DateTime Ngaynhap { get; set; }
        public List<Mathang> dsMathang { get; set; }
        private XLLoaihang Xulyloaihang = new XLLoaihang();
        private XLMathang Xulymathang = new XLMathang();
        private XLHoadonnhap Xulyhoadonnhap = new XLHoadonnhap();
        public void OnGet()
        {
            dsMathang = Xulymathang.Doc().Cast<Mathang>().ToList();
        }

        public void OnPost()
        {
            dsMathang = Xulymathang.Doc().Cast<Mathang>().ToList();
            Hoadonnhap hoadonnhap = new Hoadonnhap();
            hoadonnhap.Ten = Ten;
            hoadonnhap.Soluong = Soluong;
            hoadonnhap.MaMathang = Mamathang;
            hoadonnhap.Ngaynhap = Ngaynhap;           
            Xulyhoadonnhap.Them(hoadonnhap);
            Response.Redirect("/MHNhaphang/");
        }

    }
}
