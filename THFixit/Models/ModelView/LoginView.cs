using Microsoft.AspNetCore.Mvc.Rendering;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using THFixit.Models.ModelView;

namespace THFixit.Models
{
    public class LoginView
    {
        public Ret Ret { get; set; }
        public string Username { get; set; }
        public string Password { get; set; }
        public string Href { get; set; }
        public IEnumerable<SelectListItem> Branch { get; set; }

        public LoginView()
        {
            Ret = new Ret();
        }
    }
}
