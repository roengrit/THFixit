using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Claims;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Authentication;
using Microsoft.AspNetCore.Authentication.Cookies;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.Extensions.Configuration;
using THFixit.Models;
using THFixit.Models.ModelView;

namespace THFixit.Controllers
{
    public class AuthController : Controller
    {
        public string configuration { get; set; }

        public AuthController(IConfiguration configuration)
        {
            this.configuration = configuration.GetConnectionString("DefaultConnection");
        }

        public IActionResult Index(LoginView login)
        {
            login.Ret.Ok = true;
            login.Ret.Messsage = "Sign In";
            return View(login);
        }

        public IActionResult Branch(LoginView login)
        {
            UserRepo userRepo = new UserRepo(this.configuration);
            var userBranch = userRepo.GetUserBranch(Convert.ToInt32(User.Claims.First(x => x.Type == "Id").Value)).Select( x => new SelectListItem {  Value = x.Id.ToString(),  Text = x.Name  });
            login.Branch = userBranch;
            return View(login);
        }

        [HttpPost]
        public async Task<IActionResult> Index(LoginView login,string href)
        {
            UserRepo userRepo = new UserRepo(this.configuration);
            var user = userRepo.FindByUser(login.Username);
            if (user != null)
            {
                if (BCrypt.Net.BCrypt.Verify(login.Password, user.Password))
                {
                    user.Role = userRepo.RoleRepo.FindById(user.RoleId);
                    user.ListAccess = userRepo.RoleRepo.FindAcessAllByRoleId(user.RoleId);
                    var CanAccess = user.ListAccess.Count() > 0 ? "(" + string.Join(",", user.ListAccess.Where(x => x.Active).Select(x => x.MenuId).ToArray()) + ")" : "";
                    List<Claim> claims = new List<Claim>
                    {
                        new Claim(ClaimTypes.Name, user.Name),
                        new Claim(ClaimTypes.Email, user.Username),
                        new Claim("ImageAvatar", user.Name.Contains("admin")? "/image/matureman.png": string.IsNullOrEmpty(user.ImageAvatar)? "/image/avatar5.png" : user.ImageAvatar),
                        new Claim("RoleId",user.RoleId.ToString()),
                        new Claim("RoleName",user.Role.Name),
                        new Claim("CanAccess",CanAccess),
                        new Claim("Id",user.Id.ToString()) ,
                        new Claim("BranchId",user.BranchId.ToString())
                    };
                    ClaimsIdentity identity = new ClaimsIdentity(claims, "cookie");
                    ClaimsPrincipal principal = new ClaimsPrincipal(identity);
                    await HttpContext.SignInAsync(scheme: "Fixman", principal: principal);

                    userRepo.Dispose();
                    return RedirectToAction("Branch", "Auth");
                }
                else
                {
                    login.Ret.Ok = false;
                    login.Ret.Messsage = "Username or password is wrong";
                }
            }
            else
            {
                login.Ret.Ok = false;
                login.Ret.Messsage = "Username or password is wrong";
            }
            userRepo.Dispose();
            return View("Index", login);
        }

        public IActionResult SignOut()
        {
            Microsoft.AspNetCore.Authentication.AuthenticationHttpContextExtensions.SignOutAsync(HttpContext);
            return RedirectToAction("Index", "Auth");
        }
    }
}
