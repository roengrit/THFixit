using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace THFixit.Models.Model
{
    public class Building
    {
        public Int32 Id { get; set; }
        public Int32 BranchId { get; set; }
        public bool IsLock { get; set; }
        public string Code { get; set; }
        public string Name { get; set; }
        public bool Active { get; set; }
        public Int32 CreatorId { get; set; }
        public DateTime CreatedAt { get; set; }
        public Int32 EditorId { get; set; }
        public DateTime EditedAt { get; set; }
    }

    public class Class
    {
        public Int32 Id { get; set; }
        public Int32 BranchId { get; set; }
        public Int32 BuildingId { get; set; }
        public bool IsLock { get; set; }
        public string Code { get; set; }
        public string Name { get; set; }
        public bool Active { get; set; }
        public Int32 CreatorId { get; set; }
        public DateTime CreatedAt { get; set; }
        public Int32 EditorId { get; set; }
        public DateTime EditedAt { get; set; }
    }

    public class Room
    {
        public Int32 Id { get; set; }
        public Int32 BranchId { get; set; }
        public Int32 BuildingId { get; set; }
        public Int32 ClassId { get; set; }
        public bool IsLock { get; set; }
        public string Code { get; set; }
        public string Name { get; set; }
        public bool Active { get; set; }
        public Int32 CreatorId { get; set; }
        public DateTime CreatedAt { get; set; }
        public Int32 EditorId { get; set; }
        public DateTime EditedAt { get; set; }
    }
}
