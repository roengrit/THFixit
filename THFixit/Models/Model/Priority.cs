using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace THFixit.Models.Model
{
    public class Priority
    {
        public Int32 Id { get; set; }
        public bool IsLock { get; set; }
        public string Name { get; set; }
        public bool Active { get; set; }
        public Int32 CreatorId { get; set; }
        public DateTime CreatedAt { get; set; }
        public Int32 EditorId { get; set; }
        public DateTime EditedAt { get; set; }
    }
}
