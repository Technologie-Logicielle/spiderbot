using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;
using Entities;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using BLL;

namespace DoAn.Pages.MHLoaihang
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
        private XLLoaihang Xulyloaihang = new XLLoaihang();
        public void OnGet()
        {
            Loaihang kq = Xulyloaihang.Timkiem(Ma);            
            if (kq != null)
            {
                this.Ten = kq.Ten;
            }
            else
            {
                Response.StatusCode = 404;
            }
        }

        public void OnPost()
        {
            Loaihang loaihang = new Loaihang(Ma, Ten);
            Xulyloaihang.Sua(loaihang);
            Response.Redirect("/MHLoaihang/");
        }
    }
}
