using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Configuration;
using THFixit.Models;
using THFixit.Filters;
using Microsoft.AspNetCore.Authorization;

namespace THFixit.Controllers
{
    public class HomeController : Controller
    {
        public IConfiguration configuration { get; set; }

        public HomeController(IConfiguration configuration)
        {
            this.configuration = configuration;
        }

        [Authorize]
        //[RoleAction(menuId = "1")]
        public IActionResult Index()
        {
            return View();
        }

        public IActionResult Error()
        {
            return View(new ErrorViewModel { RequestId = Activity.Current?.Id ?? HttpContext.TraceIdentifier,
                ErrType = HttpContext.Request.Query["ErrType"] ,
                ErrMessage = HttpContext.Request.Query["Err"] ,
                ErrTitle = HttpContext.Request.Query["Err"],
            });
        }
    }
}
