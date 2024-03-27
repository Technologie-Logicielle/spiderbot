using System;
using System.ComponentModel.DataAnnotations;
using Entities;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using BLL;

namespace DoAn.Pages.MHLoaihang
{
    public class CreateModel : PageModel
    {
        [Required]
        [BindProperty]
        public string Ten { get; set; }
        private XLLoaihang Xulyloaihang = new XLLoaihang();
        public void OnGet()
        {

        }
        public void OnPost()
        {
            Loaihang loaihang = new Loaihang();
            loaihang.Ten = Ten;
            Xulyloaihang.Them(loaihang);
            Response.Redirect("/MHLoaihang/");
        }
    }
}
