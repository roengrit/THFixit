using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Configuration;
using THFixit.Models.Model;
using THFixit.Models.ModelView;
using THFixit.Repositorys;

// For more information on enabling MVC for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace THFixit.Controllers
{
    public class DepartController : Controller
    {
        public string configuration { get; set; }

        public DepartController(IConfiguration configuration)
        {
            this.configuration = configuration.GetConnectionString("DefaultConnection");
        }
        // GET: /<controller>/
        public IActionResult Index()
        {
            return View();
        }

        [HttpPost]
        [Authorize]
        public IActionResult GetDepartJson([FromBody]Branch branch)
        {
            try
            {
                var departRepo = new DepartRepo(this.configuration);
                var ret = departRepo.GetAllActive().ToArray();
                return Json(new
                {
                    Ok = true,
                    Message = string.Empty,
                    ListData = ret
                });
            }
            catch (Exception)
            {
                return Json(new
                {
                    Ok = false,
                    Message = "Something wrong!!"
                });
            }
        }

        [HttpGet]
        [Authorize]
        public IActionResult GetDepartJson(string q)
        {
            var list = new List<Select2View>();
            var departRepo = new DepartRepo(this.configuration);
            list = departRepo.FindByName(q).Select(x => new Select2View { id = x.Id, text = x.Name }).ToList();
            return Json(new { items = list });
        }
    }
}
