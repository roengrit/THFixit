using Microsoft.AspNetCore.Mvc.Rendering;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace THFixit.Models.ModelView
{
    public class ProfileView
    {
        public Ret Ret { get; set; }
        public Int32 Id { get; set; }
        public bool IsLock { get; set; }
        public string Username { get; set; }
        public string CurrentPassword { get; set; }
        public string NewPassword { get; set; }
        public string ReTypePassword { get; set; }
        public string Password { get; set; }
        public string TryPassword { get; set; }
        public string Name { get; set; }
        public string Tel { get; set; }
        public string Email { get; set; }
        public string Image { get; set; }
        public string Contact { get; set; }
        public int DeleteImage { get; set; }
        public Int32 RoleId { get; set; }
        public Int32 BranchId { get; set; }
        public Int32 DepartId { get; set; }
        public Int32 BuildingId { get; set; }
        public Int32 ClassId { get; set; }
        public Int32 RoomId { get; set; }
        public IEnumerable<SelectListItem> Role { get; set; }
        public IEnumerable<SelectListItem> Branch { get; set; }
        public IEnumerable<SelectListItem> Depart { get; set; }
        public IEnumerable<SelectListItem> Building { get; set; }
        public IEnumerable<SelectListItem> Room { get; set; }
        public IEnumerable<SelectListItem> Class { get; set; }

        public ProfileView()
        {
            this.Ret = new Ret();
        } 
    }
}
