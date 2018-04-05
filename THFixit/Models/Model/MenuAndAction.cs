using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace THFixit.Models
{
    public class MenuAndAction
    {
        public int Id { get; set; }
        public string Text { get; set; }
        public List<MenuAndAction> ListMenu { get; set; }

        public MenuAndAction()
        {
            this.ListMenu = new List<MenuAndAction>() {
                 new MenuAndAction{ Id = 1 , Text = ""},
                 new MenuAndAction{ Id = 2 , Text = ""},
                 new MenuAndAction{ Id = 2 , Text = ""},
                 new MenuAndAction{ Id = 2 , Text = ""},
                 new MenuAndAction{ Id = 2 , Text = ""},
                 new MenuAndAction{ Id = 2 , Text = ""},
                 new MenuAndAction{ Id = 2 , Text = ""},
                 new MenuAndAction{ Id = 2 , Text = ""},
                 new MenuAndAction{ Id = 2 , Text = ""},
                 new MenuAndAction{ Id = 2 , Text = ""},
                 new MenuAndAction{ Id = 2 , Text = ""},
                 new MenuAndAction{ Id = 2 , Text = ""},
                 new MenuAndAction{ Id = 2 , Text = ""},
                 new MenuAndAction{ Id = 2 , Text = ""},
                 new MenuAndAction{ Id = 2 , Text = ""},
                 new MenuAndAction{ Id = 2 , Text = ""},
                 new MenuAndAction{ Id = 2 , Text = ""},
                 new MenuAndAction{ Id = 2 , Text = ""},
                 new MenuAndAction{ Id = 2 , Text = ""},
                 new MenuAndAction{ Id = 2 , Text = ""},
                 new MenuAndAction{ Id = 2 , Text = ""},
                 new MenuAndAction{ Id = 2 , Text = ""},
                 new MenuAndAction{ Id = 2 , Text = ""},
                 new MenuAndAction{ Id = 2 , Text = ""},
                 new MenuAndAction{ Id = 2 , Text = ""},
                 new MenuAndAction{ Id = 2 , Text = ""},
                 new MenuAndAction{ Id = 2 , Text = ""},
                 new MenuAndAction{ Id = 2 , Text = ""},
                 new MenuAndAction{ Id = 2 , Text = ""},
                 new MenuAndAction{ Id = 2 , Text = ""},
                 new MenuAndAction{ Id = 2 , Text = ""},
                 new MenuAndAction{ Id = 2 , Text = ""},
                 new MenuAndAction{ Id = 2 , Text = ""},
                 new MenuAndAction{ Id = 2 , Text = ""},
                 new MenuAndAction{ Id = 2 , Text = ""},
                 new MenuAndAction{ Id = 2 , Text = ""},
                 new MenuAndAction{ Id = 2 , Text = ""},
                 new MenuAndAction{ Id = 2 , Text = ""},
                 new MenuAndAction{ Id = 2 , Text = ""},
                 new MenuAndAction{ Id = 2 , Text = ""},
                 new MenuAndAction{ Id = 2 , Text = ""},
                 new MenuAndAction{ Id = 2 , Text = ""},
                 new MenuAndAction{ Id = 2 , Text = ""},
                 new MenuAndAction{ Id = 2 , Text = ""},
                 new MenuAndAction{ Id = 2 , Text = ""},
                 new MenuAndAction{ Id = 2 , Text = ""},
                 new MenuAndAction{ Id = 2 , Text = ""},
                 new MenuAndAction{ Id = 2 , Text = ""},
            };
        }
    }
}
