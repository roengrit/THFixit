using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Threading.Tasks;
using Dapper;
using Npgsql;
using BCrypt;
namespace THFixit.Models
{
    public class User
    {
        public Int32 Id { get; set; }
        public bool IsLock { get; set; }
        public string Username { get; set; }
        public string Password { get; set; }
        public string Name { get; set; }
        public string Tel { get; set; }
        public string Line { get; set; }
        public string Image { get; set; }
        public Int32 RoleId { get; set; }
        public Int32 BranchId { get; set; }
        public Int32 DepartId { get; set; }
        public Int32 BuildingId { get; set; }
        public Int32 RoomId { get; set; }
        public Int32 ClassId { get; set; }
        public bool IsTechnical { get; set; }
        public bool Active { get; set; }
        public Int32 CreatorId { get; set; }
        public DateTime CreatedAt { get; set; }
        public Int32 EditorId { get; set; }
        public DateTime EditedAt { get; set; }
        public Role Role { get; set; }
        public IEnumerable<RoleAccess> ListAccess { get; set; }
    }

    public class Role
    {
        public Int32 Id { get; set; }
        public bool IsLock { get; set; }
        public string Name { get; set; }
        public bool Active { get; set; }
        public bool IsTechnical { get; set; }
        public Int32 CreatorId { get; set; }
        public DateTime CreatedAt { get; set; }
        public Int32 EditorId { get; set; }
        public DateTime EditedAt { get; set; }
    }

    public class RoleAccess
    {
        public Int32 Id { get; set; }
        public bool IsLock { get; set; }
        public Int32 RoleId { get; set; }
        public Int32 MenuId { get; set; }
        public bool Active { get; set; }
        public Int32 CreatorId { get; set; }
        public DateTime CreatedAt { get; set; }
        public Int32 EditorId { get; set; }
        public DateTime EditedAt { get; set; }
    }
}
