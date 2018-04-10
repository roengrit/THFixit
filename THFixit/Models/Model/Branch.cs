using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace THFixit.Models.Model
{
    public class Branch
    {
        public Int32 Id { get; set; }
        public bool IsLock { get; set; }
        public string Code { get; set; }
        public string Name { get; set; }
        public string Address { get; set; }
        public string Tel { get; set; }
        public string Email { get; set; }
        public string Image { get; set; }
        public int UserLimit { get; set; }
        public string TokenLine { get; set; }
        public string TicketPrefix1 { get; set; }
        public string TicketPrefix2 { get; set; }
        public string TicketPrefix3 { get; set; }
        public string TicketPrefix4 { get; set; }
        public string TicketPrefix5 { get; set; }
        public string TicketPrefix6 { get; set; }
        public bool Active { get; set; }
        public Int32 CreatorId { get; set; }
        public DateTime CreatedAt { get; set; }
        public Int32 EditorId { get; set; }
        public DateTime EditedAt { get; set; }
    }
}
