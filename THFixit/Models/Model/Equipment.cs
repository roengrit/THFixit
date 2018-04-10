using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace THFixit.Models.Model
{
    public class Equipment
    {
        public int Id { get; set; }
        public bool IsLock { get; set; }
        public string Code { get; set; }
        public string Name { get; set; }
        public string Model { get; set; }
        public string SupplierName { get; set; }
        public string SupplierContact { get; set; }
        public int BranchId { get; set; }
        public int DepartId { get; set; }
        public int BuildingId { get; set; }
        public int ClassId { get; set; }
        public int RoomId { get; set; }
        public int SystemId { get; set; }
        public int EquipmentGroupId { get; set; }
        public int EquipmentTypeId { get; set; }
        public string Image1 { get; set; }
        public string Image2 { get; set; }
        public string Image3 { get; set; }
        public string Image4 { get; set; }
        public string Image5 { get; set; }
        public string Image6 { get; set; }
        public string Image7 { get; set; }
        public string Image8 { get; set; }
        public string Image9 { get; set; }
        public bool Active { get; set; }
        public int StatusId { get; set; }
        public int CreatorId { get; set; }
        public DateTime CreatedAt { get; set; }
        public int EditorId { get; set; }
        public DateTime EditedAt { get; set; }
    }
}
