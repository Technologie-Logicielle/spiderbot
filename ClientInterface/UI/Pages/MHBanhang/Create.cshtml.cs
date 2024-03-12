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
        public int Soluong { get; set; }
        [Required]
        [BindProperty]
        [DataType(DataType.Date)]
        public DateTime Ngayban { get; set; }
        public List<Mathang> dsMathang { get; set; }
        public string ErrorMessage { get; set; }
        private XLHoadonnhap Xulyhoadonnhap = new XLHoadonnhap();
        private XLMathang Xulymathang = new XLMathang();
        private XLHoadonban Xulyhoadonban = new XLHoadonban();
        public void OnGet()
        {
            dsMathang = Xulymathang.Doc().Cast<Mathang>().ToList();
        }

        public void OnPost()
        {
            bool temp = false;
            dsMathang = Xulymathang.Doc().Cast<Mathang>().ToList();
            Hoadonban ketqua = new Hoadonban();
            ketqua.Ten = this.Ten;
            ketqua.Soluong = this.Soluong;
            ketqua.MaMathang = this.Mamathang;
            ketqua.Ngayban = this.Ngayban;
            var thongke = new Thongke();            
            var Dshoadonnhap = Xulyhoadonnhap.Doc().Cast<Hoadonnhap>().ToList();
            if (this.Soluong <= thongke.Soluonghangtontheomathang()[Mamathang])//
            {
                foreach (var kq in Dshoadonnhap)
                {
                    if (this.Ngayban > kq.Ngaynhap)
                    {
                        temp = true;
                    }
                }
                if (temp == true)
                {
                    Xulyhoadonban.Them(ketqua);
                    Response.Redirect("/MHBanhang/");
                }
                else
                {
                    ErrorMessage = "Ngày bán phải lớn hơn ngày nhập";
                }            
            } 
            else
            {
                ErrorMessage = "Không đủ hàng";
            }
        }
    }
}
