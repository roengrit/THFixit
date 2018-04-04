using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace THFixit.Models
{
    public class Login
    {
        public Ret Ret { get; set; }
        public string Username { get; set; }
        public string Password { get; set; }
        public string Href { get; set; }

        public Login()
        {
            Ret = new Ret();
        }
    }
}
