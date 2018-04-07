using Microsoft.AspNetCore.Mvc.Rendering;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using THFixit.Models.Model;

namespace THFixit.Models.ModelView
{
    public class TicketView
    {
        public Ret Ret { get; set; }
        public Int32 Id { get; set; }
        public Int32 No { get; set; }
        public Int32 NoRef { get; set; }
        public string DocNo { get; set; }
        public string Title { get; set; }        
        public string Description { get; set; }
        public string SerialNumber { get; set; }
        public Int32 RequestorId { get; set; }
        public string RequestorName { get; set; }
        public Int32 BranchId { get; set; }
        public Int32 DepartId { get; set; }
        public Int32 BuildingId { get; set; }
        public Int32 ClassId { get; set; }
        public Int32 RoomId { get; set; }
        public Int32 PriorityId { get; set; }
        public Int32 StatusId { get; set; }
        public string Contact { get; set; }
        public string DocDate { get; set; }
        public IEnumerable<SelectListItem> Prioritys  { get; set; }
        public IEnumerable<SelectListItem> Status { get; set; }
        public IEnumerable<SelectListItem> Departs { get; set; }
        public IEnumerable<SelectListItem> Buildings { get; set; }
        public IEnumerable<SelectListItem> Class { get; set; }
        public IEnumerable<SelectListItem> Rooms { get; set; }

        public TicketView()
        {
            this.Ret = new Ret();             
        }
    }
}
