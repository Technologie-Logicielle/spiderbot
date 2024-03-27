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
using DoAn.Pages.MHMathang;

namespace DoAn.Pages.MHLoaihang
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
        public string ErrorMessage { get; set; }
        private XLLoaihang Xulyloaihang = new XLLoaihang();
        private XLMathang Xulymathang = new XLMathang();
        public void OnGet()
        {
            Loaihang loaihang = Xulyloaihang.Timkiem(Ma);
            if (loaihang != null)
            {
                this.Ten = loaihang.Ten;
            }
            else
            {
                Response.StatusCode = 404;
            }
        }
        public void OnPost()
        {
            bool x = true;
                      
            var Products = Xulymathang.Doc().Cast<Mathang>().ToList();            
            foreach(var ds in Products)
            {
                if (ds.Loaihang == this.Ma)
                {
                    x = false;
                }
            }                      
            //return ketqua.Ten;
            if (x==false)
            {
                ErrorMessage = "Mã loại hàng này đã sử dụng. Vui lòng không xóa";
            }
            else
            {
                Xulyloaihang.Xoa(Ma);
                Response.Redirect("/MHLoaihang/");
            }
        }
        
    }
}
