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
    public class RoomController : Controller
    {
        public string configuration { get; set; }

        public RoomController(IConfiguration configuration)
        {
            this.configuration = configuration.GetConnectionString("DefaultConnection");
        }

        public IActionResult Index()
        {
            return View();
        }

        [HttpPost]
        [Authorize]
        public JsonResult GetRoomJSON([FromBody]Class fclass)
        {
            try
            {
                var roomRepo = new RoomRepo(this.configuration);
                var ret = roomRepo.GetAllActive(fclass.Id).ToArray();
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