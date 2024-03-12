using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Entities;
using BLL;

namespace DoAn.Pages.MHMathang
{
    public class CreateModel : PageModel
    {
        [Required]
        [BindProperty]
        public string Ten { get; set; }
        [Required]
        [BindProperty]
        [DataType(DataType.Date)]
        public DateTime HanDung { get; set; }
        [Required]
        [BindProperty]
        public string CongTy { get; set; }
        [Required]
        [BindProperty]
        public int NamSX { get; set; }
        [Required]
        [BindProperty]
        public int Loaihang { get; set; }
        public List<Loaihang> dsLoaihang { get; set; }
        public string ErrorMessage { get; set; }
        private XLLoaihang Xulyloaihang = new XLLoaihang();
        private XLMathang Xulymathang = new XLMathang();
        public void OnGet()
        {
            dsLoaihang = Xulyloaihang.Doc().Cast<Loaihang>().ToList();
        }

        public void OnPost()
        {
            Mathang mathang = new Mathang();            
            dsLoaihang = Xulyloaihang.Doc().Cast<Loaihang>().ToList();
            mathang.Ten = Ten;
            mathang.HanDung = HanDung;
            mathang.CongTy = CongTy;
            mathang.NamSX = NamSX;
            mathang.Loaihang = Loaihang;
            if (int.Parse(mathang.HanDung.ToString("yyyy"))<mathang.NamSX)
            {
                ErrorMessage = "Năm Sản Xuất phải nhỏ hơn hạn dùng";
            } 
            else
            {                   
                Xulymathang.Them(mathang);
                Response.Redirect("/MHMathang/");
            }    
            
        }
    }
}
