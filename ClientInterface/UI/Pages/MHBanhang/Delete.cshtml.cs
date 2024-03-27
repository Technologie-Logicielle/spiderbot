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
        public int Mamathang { get; set; }
        [Required]
        [BindProperty]
        public int Soluong { get; set; }
        [Required]
        [BindProperty]
        [DataType(DataType.Date)]
        public DateTime Ngayban { get; set; }
        public List<Mathang> dsMathang { get; set; }
        private XLHoadonban Xulyhoadonban = new XLHoadonban();
        private XLMathang Xulymathang = new XLMathang();
        public void OnGet()
        {            
            Hoadonban ketqua = (Hoadonban)Xulyhoadonban.Timkiem(Ma);
            if (ketqua != null)
            {
                Ten = ketqua.Ten;
                Mamathang = ketqua.MaMathang;
                Soluong = ketqua.Soluong;
                Ngayban = ketqua.Ngayban;
                dsMathang = Xulymathang.Doc().Cast<Mathang>().ToList();
            }
            else
            {
                Response.StatusCode = 404;
            }
        }
        public void OnPost()
        {
            dsMathang = Xulymathang.Doc().Cast<Mathang>().ToList();
            Hoadonban saleInvoice = new Hoadonban(Ma, Ten, Mamathang, Soluong, Ngayban);
            Xulyhoadonban.Xoa(saleInvoice.Ma);
            Response.Redirect("/MHBanhang/");
        }
    }
}
