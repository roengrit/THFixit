using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace THFixit.Models.ModelView
{
    public class TicketView
    {
        public Ret Ret { get; set; }

        public TicketView()
        {
            this.Ret = new Ret();
        }
    }
}
