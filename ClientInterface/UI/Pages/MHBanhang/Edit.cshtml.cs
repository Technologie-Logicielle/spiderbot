using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;
using Entities;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using BLL;

namespace DoAn.Pages.MHBanhang
{
    public class EditModel : PageModel
    {
        [Key]
        [Required]
        [BindProperty(SupportsGet = true)]
        public int Ma { get; set; }
        [Key]
        [Required]
        [BindProperty]
        public string Ten { get; set; }
        [Required]
        [BindProperty]
        public int Mamathang { get; set; }        
        [Required]
        [BindProperty]
        public int Soluong { get; set; }
        [Required]
        [BindProperty]
        [DataType(DataType.Date)]
        public DateTime Ngayban { get; set; }
        public List<Mathang> dsMathang { get; set; } = new List<Mathang>();
        private XLHoadonban Xulyhoadonban = new XLHoadonban();
        private XLHoadonnhap Xulyhoadonnhap = new XLHoadonnhap();
        private XLMathang Xulymathang = new XLMathang();
        public string ErrorMessage { get; set; }
        private Hoadonban ketqua { get; set; }
        public void OnGet()
        {            
            ketqua = (Hoadonban)Xulyhoadonban.Timkiem(Ma);
            if (ketqua != null)
            {
                this.Ma = ketqua.Ma;
                this.Ten = ketqua.Ten;
                this.Mamathang = ketqua.MaMathang;
                this.Soluong = ketqua.Soluong;
                this.Ngayban = ketqua.Ngayban;
                dsMathang = Xulymathang.Doc().Cast<Mathang>().ToList();
            }
            else
            {
                Response.StatusCode = 404;
            }
        }

        public void OnPost()
        {
            ketqua = (Hoadonban)Xulyhoadonban.Timkiem(Ma);
            Hoadonban hoadonban = new Hoadonban(Ma, Ten, Mamathang, Soluong, Ngayban);
            var Dshoadonnhap = Xulyhoadonnhap.Doc().Cast<Hoadonnhap>().ToList();            
            foreach (var hoadonnhap in Dshoadonnhap)
            {
                if(hoadonnhap.MaMathang==ketqua.MaMathang)
                {
                    if (this.Ngayban>hoadonnhap.Ngaynhap)
                    {                        
                        hoadonban.MaMathang = ketqua.MaMathang;
                        hoadonban.Soluong = ketqua.Soluong;
                        Xulyhoadonban.Sua(hoadonban);
                        Response.Redirect("/MHBanhang/");
                    }
                    else
                    {
                        ErrorMessage = "Ngày bán không hợp lệ với ngày nhập";
                    }    
                }    
            }    
                      
        }
    }
}
