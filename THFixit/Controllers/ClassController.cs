using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Configuration;
using THFixit.Models.Model;
using THFixit.Repositorys;

namespace THFixit.Controllers
{
    public class ClassController : Controller
    {
        public string configuration { get; set; }

        public ClassController(IConfiguration configuration)
        {
            this.configuration = configuration.GetConnectionString("DefaultConnection");
        }

        public IActionResult Index()
        {
            return View();
        }

        [HttpPost]
        [Authorize]
        public JsonResult GetClassJSON([FromBody]Building building)
        {
            try
            {
                var classRepo = new ClassRepo(this.configuration);
                var ret = classRepo.GetAllActive(building.Id).ToArray();
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
    }
}