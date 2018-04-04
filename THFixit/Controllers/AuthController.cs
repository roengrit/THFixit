using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Claims;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Authentication;
using Microsoft.AspNetCore.Authentication.Cookies;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Configuration;
using THFixit.Models;

namespace THFixit.Controllers
{
    public class AuthController : Controller
    {
        public IConfiguration configuration { get; set; }

        public AuthController(IConfiguration configuration)
        {
            this.configuration = configuration;
        }

        public IActionResult Index(Login login)
        {
            login.Ret.Ok = true;
            login.Ret.Messsage = "Sign In";
            return View(login);
        }

        [HttpPost]
        public async Task<IActionResult> Index(Login login,string href)
        {
            UserRepo userRepo = new UserRepo(configuration.GetConnectionString("DefaultConnection"));
            var user = userRepo.FindByUser(login.Username);
            if (user != null)
            {
                if (BCrypt.Net.BCrypt.Verify(login.Password, user.Password))
                {
                    user.Role = userRepo.RoleRepo.FindById(user.RoleId);
                    user.ListAccess = userRepo.RoleRepo.FindAcessAllByRoleId(user.RoleId);
                    var CanAccess = string.Join(",", user.ListAccess.Where(x => x.Active).Select(x => x.MenuId).ToArray());

                    List<Claim> claims = new List<Claim>
                    {
                        new Claim(ClaimTypes.Name, user.Name),
                        new Claim(ClaimTypes.Email, user.Username),
                        new Claim("UserImage", user.Name.Contains("admin")? "/image/matureman.png": string.IsNullOrEmpty(user.Image)? "/image/avatar5.png" : user.Image),
                        new Claim("RoleId",user.RoleId.ToString()),
                        new Claim("RoleName",user.Role.Name),
                        new Claim("CanAccess",CanAccess),
                        new Claim("Id",user.Id.ToString())
                    };
                    ClaimsIdentity identity = new ClaimsIdentity(claims, "cookie");
                    ClaimsPrincipal principal = new ClaimsPrincipal(identity);
                    await HttpContext.SignInAsync(scheme: "Fixman", principal: principal);
                    return RedirectToAction("Index", "Home");
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
            return View("Index", login);
        }

        public IActionResult SignOut()
        {
            Microsoft.AspNetCore.Authentication.AuthenticationHttpContextExtensions.SignOutAsync(HttpContext);
            return RedirectToAction("Index", "Auth");
        }
    }
}
