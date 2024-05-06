using Microsoft.AspNetCore.Mvc;
using StudyHub.BLL;
using StudyHub.DAL.Models;
//MVC
namespace AdminStudyHub.Controllers
{
    public class UserController : Controller
    {
        private readonly UserBLL userService;

        public UserController()
        {
            userService = new UserBLL();
        }


        public IActionResult Index()
        {
            //var user = ;
            return View(userService.GetAllUsers());  
        }


        //public IActionResult Details(int userId)
        //{
        //    var user = _userBLL.GetUserById(userId);
        //    if (user == null)
        //    {
        //        return NotFound();
        //    }
        //    return View(user);
        //}

        //[HttpGet]
        //public IActionResult Create()
        //{
        //    return View();
        //}

        //[HttpPost]
        //public IActionResult Create(UserOu user)
        //{
        //    if (ModelState.IsValid)
        //    {
        //        _userBLL.AddUser(user);
        //        return RedirectToAction(nameof(Index));
        //    }
        //    return View(user);
        //}

        //[HttpGet]
        //public IActionResult Edit(int userId)
        //{
        //    var user = _userBLL.GetUserById(userId);
        //    if (user == null)
        //    {
        //        return NotFound();
        //    }
        //    return View(user);
        //}

        //[HttpPost]
        //public IActionResult Edit(UserOu user)
        //{
        //    if (ModelState.IsValid)
        //    {
        //        _userBLL.UpdateUser(user);
        //        return RedirectToAction(nameof(Index));
        //    }
        //    return View(user);
        //}

        //[HttpGet]
        //public IActionResult Delete(int userId)
        //{
        //    var user = _userBLL.GetUserById(userId);
        //    if (user == null)
        //    {
        //        return NotFound();
        //    }
        //    return View(user);
        //}

        //[HttpPost, ActionName("Delete")]
        //public IActionResult DeleteConfirmed(int userId)
        //{
        //    _userBLL.DeleteUser(userId);
        //    return RedirectToAction(nameof(Index));
        //}
    }
}
