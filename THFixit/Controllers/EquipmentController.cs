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

        [HttpGet]
        [Authorize]
        public IActionResult GetEquipmentBySerialNumberOrNameJson(string q, int branchId)
        {
            var list = new List<Select2View>();
            var eqRepo = new EquipmentRepo(this.configuration);
             var listEquipment = eqRepo.FindBySerialNumberOrName(q, branchId).Select(x => new Select2View { id = x.SerialId.ToString(), text = "["+ x.SerialNumber + "] " + x.Name }).ToList();
            if (listEquipment.Count>0)
            {
                if (string.IsNullOrEmpty(q))
                {
                    list.Add(new Select2View { id = "0", text = "Serial Number/Register Number/Machine Number" });
                }
                list.AddRange(listEquipment);
            }
            return Json(new { items = list });
        }
    }
}