using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Configuration;
using THFixit.Models.ModelView;
using THFixit.Repositorys;

// For more information on enabling MVC for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace THFixit.Controllers
{
    public class StatusController : Controller
    {
        public string configuration { get; set; }


        public StatusController(IConfiguration configuration)
        {
            this.configuration = configuration.GetConnectionString("DefaultConnection");
        }

        // GET: /<controller>/
        public IActionResult Index()
        {
            return View();
        }

        [HttpGet]
        [Authorize]
        public IActionResult GetStatusJson(string q)
        {
            var list = new List<Select2View>();
            var statusRepo = new StatusRepo(this.configuration);
            list = statusRepo.FindByName(q).Select(x => new Select2View { id = x.Id, text = x.Name }).ToList();
            return Json(new { items = list });
        }
    }
}
