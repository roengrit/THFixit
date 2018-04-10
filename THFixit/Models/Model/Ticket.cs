using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace THFixit.Models.Model
{
    public class Ticket
    {
        public Ret Ret { get; set; }
        public Int32 Id { get; set; }
        public Int32 No { get; set; }
        public string DocNo { get; set; }
        public Int32 NoRef { get; set; }
        public string Title { get; set; }
        public string Description { get; set; }
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
        public Int32 CreatorId { get; set; }
        public DateTime CreatedAt { get; set; }
        public Int32 EditorId { get; set; }
        public DateTime EditedAt { get; set; }
    }
}
