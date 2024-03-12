using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Net;
using System.Threading.Tasks;
using Entities;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using BLL;

namespace DoAn.Pages.MHMathang
{
    public class EditModel : PageModel
    {
        [Key]
        [Required]
        [BindProperty(SupportsGet = true)]
        public int Ma { get; set; }
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
            Mathang ketqua = (Mathang)Xulymathang.Timkiem(Ma);
            if (ketqua != null)
            {
                Ten = ketqua.Ten;
                HanDung = ketqua.HanDung;
                CongTy = ketqua.CongTy;
                NamSX = ketqua.NamSX;
                Loaihang = ketqua.Loaihang;
            } else
            {
                Response.StatusCode = 404;
            }
        }

        public void OnPost()
        {
            dsLoaihang = Xulyloaihang.Doc().Cast<Loaihang>().ToList();
            Mathang mathang = new Mathang(Ma, Ten, HanDung, CongTy, NamSX, Loaihang);
            if (int.Parse(mathang.HanDung.ToString("yyyy")) < mathang.NamSX)
            {
                ErrorMessage = "Năm Sản Xuất phải nhỏ hơn hạn dùng";
            }   
            else
            {
                Xulymathang.Sua(mathang);
                Response.Redirect("/MHMathang/");
            }    
                
        }
    }
}
