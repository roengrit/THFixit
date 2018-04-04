using Microsoft.AspNetCore.Mvc.Filters;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace THFixit.Filters
{
    public class RoleAction : Attribute, IActionFilter
    {
        public string menuId { get; set; }

        public void OnActionExecuting(ActionExecutingContext context)
        {
            if (!string.IsNullOrEmpty(context.HttpContext.User.Identity.Name))
            {
                if (context.HttpContext.User.Identity.Name.ToLower().Contains("admin"))
                {
                    return;
                }
            }
            var CanAccess = context.HttpContext.User.Claims.FirstOrDefault(x => x.Type == "CanAccess")?.Value;
            if (string.IsNullOrEmpty(CanAccess))
            {
                context.HttpContext.Response.Redirect("/Home/Error?ErrType=Per&Err=Permision is denied");
            }
        }

        public void OnActionExecuted(ActionExecutedContext context)
        {
            // do something after the action executes
        }
    }
}
