using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Configuration;
using THFixit.Models.ModelView;
using THFixit.Repositorys;

namespace THFixit.Controllers
{
    public class EquipmentController : Controller
    {
        public string configuration { get; set; }

        public EquipmentController(IConfiguration configuration)
        {
            this.configuration = configuration.GetConnectionString("DefaultConnection");
        }

        public IActionResult Index()
        {
            return View();
        }

        [HttpGet]
        [Authorize]
        public IActionResult GetEquipmentJson(string query)
        {
            var list = new List<Select2View>();
            var eqRepo = new EquipmentRepo(this.configuration);
            list = eqRepo.FindByName(query).Select(x => new Select2View { id = x.Code, text = x.Name }).ToList();
            return Json(new { items = list });
        }

        [HttpPost]
        [Authorize]
        public IActionResult GetEquipmentBySnJson([FromBody]EquipmentView eq )
        {
            var eqRepo = new EquipmentRepo(this.configuration);
            var ret = eqRepo.FindBySerial(eq.SerialNumber, eq.BranchId);
            return Json(new { ok = (ret != null), item = ret });
        }
    }
}