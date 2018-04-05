using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Security.Claims;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.Extensions.Configuration;
using THFixit.Models;
using THFixit.Models.ModelView;
using THFixit.Repositorys;

namespace THFixit.Controllers
{
    public class UserController : Controller
    {
        public string configuration { get; set; }

        BranchRepo branchRepo { get; set; }
        DepartRepo departRepo { get; set; }
        BuildingRepo buildingRepo { get; set; }
        ClassRepo classRepo { get; set; }
        RoomRepo roomRepo { get; set; }

        public UserController(IConfiguration configuration)
        {
            this.configuration = configuration.GetConnectionString("DefaultConnection");
            branchRepo = new BranchRepo(this.configuration);
            departRepo = new DepartRepo(this.configuration);
            buildingRepo = new BuildingRepo(this.configuration);
            classRepo = new ClassRepo(this.configuration);
            roomRepo = new RoomRepo(this.configuration);
        }
   
        public IActionResult Profile(ProfileView user)
        {
            var userRepo = new UserRepo(this.configuration);
            var userEdit = userRepo.FindById(Convert.ToInt32(User.Claims.First(x => x.Type == "Id").Value));
            user.Branch = branchRepo.GetAllActive().Select(x => new SelectListItem { Value = x.Id.ToString(), Text = x.Name, Selected = userEdit.BranchId == x.Id });
            user.Depart = departRepo.GetAllActive().Select(x => new SelectListItem { Value = x.Id.ToString(), Text = x.Name, Selected = userEdit.DepartId == x.Id });
            user.Building = buildingRepo.GetAllActive(userEdit.BranchId).Select(x => new SelectListItem { Value = x.Id.ToString(), Text = x.Name, Selected = userEdit.BuildingId == x.Id });
            user.Class = classRepo.GetAllActive(userEdit.BuildingId).Select(x => new SelectListItem { Value = x.Id.ToString(), Text = x.Name, Selected = userEdit.ClassId == x.Id });
            user.Room = roomRepo.GetAllActive(userEdit.ClassId).Select(x => new SelectListItem { Value = x.Id.ToString(), Text = x.Name, Selected = userEdit.RoomId == x.Id });
            user.Name = userEdit.Name;
            user.Username = userEdit.Username;
            user.Tel = userEdit.Tel;
            user.Email = userEdit.Email;
            user.Image = userEdit.ImageAvatar;
            return View(user);
        }
         
        [HttpPost]
        [Authorize]
        public IActionResult Profile(ProfileView user, bool post)
        {
            var userRepo = new UserRepo(this.configuration);
            var userEdit = userRepo.FindById(Convert.ToInt32(User.Claims.First(x => x.Type == "Id").Value));
            user.Image = userEdit.ImageAvatar;
            user.Username = userEdit.Username;
            user.BranchId = userEdit.BranchId;
            user.DepartId = userEdit.DepartId;
            user.Branch = branchRepo.GetAllActive().Select(x => new SelectListItem { Value = x.Id.ToString(), Text = x.Name, Selected = userEdit.BranchId == x.Id });
            user.Depart = departRepo.GetAllActive().Select(x => new SelectListItem { Value = x.Id.ToString(), Text = x.Name, Selected = userEdit.DepartId == x.Id });
            user.Building = buildingRepo.GetAllActive(user.BranchId).Select(x => new SelectListItem { Value = x.Id.ToString(), Text = x.Name, Selected = user.BuildingId == x.Id });
            user.Class = classRepo.GetAllActive(user.BuildingId).Select(x => new SelectListItem { Value = x.Id.ToString(), Text = x.Name, Selected = user.ClassId == x.Id });
            user.Room = roomRepo.GetAllActive(user.ClassId).Select(x => new SelectListItem { Value = x.Id.ToString(), Text = x.Name, Selected = user.RoomId == x.Id });
            userEdit.Name = user.Name;
            userEdit.BuildingId = user.BuildingId;
            userEdit.ClassId = user.ClassId;
            userEdit.RoomId = user.RoomId;
            userEdit.Tel = user.Tel;
            userEdit.Email = user.Email;
            user.Ret = userRepo.UpdateProfile(userEdit);
            return View(user);
        }

        [HttpPost]
        [Authorize]
        public async Task<IActionResult> UploadAvatar(IFormFile imageAvatar)
        {
            try
            {
                if (imageAvatar.Length > 0)
                {
                    var fileSave = Guid.NewGuid();
                    var fileEx = Path.GetExtension(imageAvatar.FileName);
                    var path = Path.Combine(Directory.GetCurrentDirectory(), "wwwroot\\image\\user", fileSave + fileEx);

                    using (var stream = new FileStream(path, FileMode.Create))
                    {
                        await imageAvatar.CopyToAsync(stream);
                    }
                    UserRepo userRepo = new UserRepo(this.configuration);
                    userRepo.UpdateAvatar(new User { Id = Convert.ToInt32(User.Claims.First(x => x.Type == "Id").Value), ImageAvatar = "/image/user/" + fileSave + fileEx });
                    return Ok(new { Ok = true, Message = "", ImagePath = "/image/user/" + fileSave + fileEx });
                }
                else
                {
                    return Ok(new { Ok = false, Message = "File not found!!" });
                }
            }
            catch (Exception)
            {
                return Ok(new { Ok = false, Message = "Something wrong!!" });
            }
        }

        public IActionResult ChangePass()
        {
            return View();
        }
    }
}
