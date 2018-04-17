using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.Extensions.Configuration;
using THFixit.Helpers;
using THFixit.Models.Model;
using THFixit.Models.ModelView;
using THFixit.Repositorys;

namespace THFixit.Controllers
{
    public class TicketController : Controller
    {
        public string configuration { get; set; }

        public TicketController(IConfiguration configuration)
        {
            this.configuration = configuration.GetConnectionString("DefaultConnection");
        }

        [Authorize]
        public IActionResult Index(TicketView ticket)
        {
            if (ticket.Id != 0)
            {
                var tiketRepo = new TicketRepo(this.configuration);
                var document = tiketRepo.FindById(ticket.Id);
                ticket.DocNo = document.DocNo;
                ticket.Id = document.Id;
                ticket.PriorityId = document.PriorityId;
                ticket.StatusId = document.StatusId;
                ticket.DepartId = document.DepartId;
                ticket.BranchId = document.BranchId;
                ticket.BuildingId = document.BuildingId;
                ticket.ClassId = document.ClassId;
                ticket.RoomId = document.RoomId;
                ticket.RequestorId = document.RequestorId;
                ticket.RequestorName = document.RequestorName;
                ticket.Title = document.Title;
                ticket.Description = document.Description;
                ticket.Contact = document.Contact;
                ticket.DocDate = document.CreatedAt.ToString("dd/MM/yyyy HH:mm");
                ticket.SerialNumber = document.SerialNumber;
                var departRepo = new DepartRepo(this.configuration);
                var buildingRepo = new BuildingRepo(this.configuration);
                var classRepo = new ClassRepo(this.configuration);
                var roomRepo = new RoomRepo(this.configuration);

                ticket.Departs = departRepo.GetAllActive().Select(x => new SelectListItem { Value = x.Id.ToString(), Text = x.Name, Selected = ticket.DepartId == x.Id });
                ticket.Buildings = buildingRepo.GetAllActive(ticket.BranchId).Select(x => new SelectListItem { Value = x.Id.ToString(), Text = x.Name, Selected = ticket.BuildingId == x.Id });
                ticket.Class = classRepo.GetAllActive(ticket.BuildingId).Select(x => new SelectListItem { Value = x.Id.ToString(), Text = x.Name, Selected = ticket.ClassId == x.Id });
                ticket.Rooms = roomRepo.GetAllActive(ticket.ClassId).Select(x => new SelectListItem { Value = x.Id.ToString(), Text = x.Name, Selected = ticket.RoomId == x.Id });
            }
            
            ticket.Prioritys = new PriorityRepo(this.configuration).GetAllActive().Select(x => new SelectListItem { Value = x.Id.ToString(), Text = x.Name, Selected = ticket.PriorityId == x.Id });
            ticket.Status = new StatusRepo(this.configuration).GetAllActive().Select(x => new SelectListItem { Value = x.Id.ToString(), Text = x.Name, Selected = ticket.StatusId == x.Id });
            return View(ticket);
        }

        [HttpPost]
        [Authorize]
        public IActionResult Index([FromBody]TicketView ticket, bool isPost)
        {
            ticket.Ret = new Models.Ret { Ok = true };
            var tiketRepo = new TicketRepo(this.configuration);
            var branch = new BranchRepo(this.configuration).FindById(ticket.BranchId);
            if (!string.IsNullOrEmpty(ticket.SerialNumber))
            {
                var eq = new EquipmentRepo(this.configuration).FindBySerial(ticket.SerialNumber, ticket.BranchId);
                if (eq == null)
                {
                    ticket.Ret.Message = "Serial not found!";
                    ticket.Ret.Ok = false;
                }
            }
            if (ticket.Id == 0)
            {
                var no = new DocumentHelper(this.configuration).GenTicketNo(ticket.BranchId, branch.TicketPrefix1);
                var docNo = branch.TicketPrefix1 + '-' + DateTime.Now.Year.ToString() + DateTime.Now.Month.ToString("0000") + "-" + no.ToString("00000");
                if (ticket.Ret.Ok)
                    ticket.Ret = tiketRepo.Create(new Ticket
                    {
                        DocNo = docNo,
                        BranchId = ticket.BranchId,
                        BuildingId = ticket.BuildingId,
                        ClassId = ticket.ClassId,
                        Contact = ticket.Contact,
                        CreatorId = Convert.ToInt32(User.Claims.First(x => x.Type == "Id").Value),
                        DepartId = ticket.DepartId,
                        Description = ticket.Description,
                        PriorityId = ticket.PriorityId,
                        RequestorId = ticket.RequestorId,
                        RoomId = ticket.RoomId,
                        StatusId = ticket.StatusId,
                        Title = ticket.Title,
                        SerialNumber = ticket.SerialNumber
                    });
                if (ticket.Ret.Ok)
                {
                    var document = tiketRepo.FindByDocNo(docNo);
                    ticket.DocNo = docNo;
                    ticket.Id = document.Id;
                }
            }
            else
            {
                if (ticket.Ret.Ok)
                    ticket.Ret = tiketRepo.Update(new Ticket
                    {
                        BuildingId = ticket.BuildingId,
                        ClassId = ticket.ClassId,
                        Contact = ticket.Contact,
                        EditorId = Convert.ToInt32(User.Claims.First(x => x.Type == "Id").Value),
                        DepartId = ticket.DepartId,
                        Description = ticket.Description,
                        RequestorId = ticket.RequestorId,
                        RoomId = ticket.RoomId,
                        Title = ticket.Title,
                        SerialNumber = ticket.SerialNumber
                    });
            }
            return Json(ticket);
        }

        public IActionResult List(TicketView ticket)
        {
            ticket.Prioritys = new PriorityRepo(this.configuration).GetAllActive().Select(x => new SelectListItem { Value = x.Id.ToString(), Text = x.Name, Selected = ticket.PriorityId == x.Id });
            ticket.Status = new StatusRepo(this.configuration).GetAllActive().Select(x => new SelectListItem { Value = x.Id.ToString(), Text = x.Name, Selected = ticket.StatusId == x.Id });
            return View(ticket);
        }
    }
}