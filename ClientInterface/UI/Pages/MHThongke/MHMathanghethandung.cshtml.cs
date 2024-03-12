using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Entities;
using BLL;

namespace DoAn.Pages.MHThongke
{
    public class MHMathanghethandung : PageModel
    {
        [BindProperty]
        [DataType(DataType.Date)]
        public DateTime ngaykiemtra { get; set; }        
        public Dictionary<Mathang, int> dsMathanghethan { get; set; }
        private Thongke thongke = new Thongke();
        public void OnGet()
        {
            ngaykiemtra = DateTime.Today;
            dsMathanghethan = thongke.Kiemtrahanghethan(ngaykiemtra);
        }

        public void OnPost()
        {
            dsMathanghethan = thongke.Kiemtrahanghethan(ngaykiemtra);
        }
    }
}
