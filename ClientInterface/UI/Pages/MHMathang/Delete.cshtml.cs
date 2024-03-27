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
    public class DeleteModel : PageModel
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
        public string ErrorMessage { get; set; }
        private XLMathang Xulymathang = new XLMathang();
        private XLHoadonnhap Xulyhoadonnhap = new XLHoadonnhap();
        public void OnGet()
        {
            Mathang ketqua= (Mathang)Xulymathang.Timkiem(Ma);
            if (ketqua != null)
            {
                Ten = ketqua.Ten;
                HanDung = ketqua.HanDung;
                CongTy = ketqua.CongTy;
                NamSX = ketqua.NamSX;
                Loaihang = ketqua.Loaihang;
            }
            else
            {
                Response.StatusCode = 404;
            }
        }

        public void OnPost()
        {
            bool x = true;
            
            var Products = Xulyhoadonnhap.Doc().Cast<Hoadonnhap>().ToList();
            
            foreach (var ds in Products)
            {
                if (ds.MaMathang == this.Ma)
                {
                    x = false;
                }
            }
            if (x == false)
            {
                ErrorMessage = "Mã mặt hàng này đã sử dụng. Vui lòng không xóa";
            }
            else
            {
                Xulymathang.Xoa(Ma);
                Response.Redirect("/MHMathang/");
            }    
            
        }
    }
}
