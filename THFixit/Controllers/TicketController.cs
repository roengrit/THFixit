using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using THFixit.Models.ModelView;

namespace THFixit.Controllers
{
    public class TicketController : Controller
    {
        public IActionResult Index(TicketView ticket)
        {
            return View(ticket);
        }

        public IActionResult List(TicketView ticket)
        {
            return View(ticket);
        }
    }
}