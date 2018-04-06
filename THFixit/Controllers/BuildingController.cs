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

namespace THFixit.Controllers
{
    public class BuildingController : Controller
    {
        public string configuration { get; set; }

        public BuildingController(IConfiguration configuration)
        {
            this.configuration = configuration.GetConnectionString("DefaultConnection");
        }

        public IActionResult Index()
        {
            return View();
        }

        [HttpPost]
        [Authorize]
        public JsonResult GetBuildingJSON([FromBody]Branch branch)
        {
            try
            {
                var buildingRepo = new BuildingRepo(this.configuration);
                var ret = buildingRepo.GetAllActive(branch.Id).ToArray();
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
        public IActionResult GetBuildingJson(string q,int branchId)
        {
            var list = new List<Select2View>();
            var buildingRepo = new BuildingRepo(this.configuration);
            list = buildingRepo.FindByName(q, branchId).Select(x => new Select2View { id = x.Id, text = x.Name }).ToList();
            return Json(new { items = list });
        }
    }
}