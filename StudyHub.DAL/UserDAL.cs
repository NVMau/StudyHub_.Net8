using StudyHub.DAL.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace StudyHub.DAL
{
    public class UserDAL
    {

        HeThongQuanLyHocTapContext context = new HeThongQuanLyHocTapContext();

        //Bước 1
        //lấy list users ra trong đó context là nơi chứa các bảng thi đi tới UserOus để lấy list, 
        public List<object> GetAllUsers()
        {
            // do chỉ định các trường muốn lấy tránh lấy các dữ liệu thừa, sử dụng kiểu Object để chứng từng user và bọc trong list<> để trả về danh sách kiểu Object thay vì UserOus
            var users = context.UserOus
                        .Select(i => new { i.IdUser, i.Username,  i.FirstName, i.LastName, i.Email, i.Role, i.Avatar })
                        .ToList<object>();
            return users;
            //đi đến phần BLL  
        }

        public object GetUserById(int userId)
        {
            var user = context.UserOus
                .Where(u => u.IdUser == userId)
                .Select(u => new
                {
                    u.IdUser,
                    u.Username,
                    u.FirstName,
                    u.LastName,
                    u.Email,
                    u.Role,
                    u.Avatar
                })
                .FirstOrDefault();
            return user;
        }

        public void AddUser(UserOu user)
        {
            context.UserOus.Add(user);
            context.SaveChanges();
        }

        public void UpdateUser(UserOu user)
        {
            var existingUser = context.UserOus.Find(user.IdUser);
            if (existingUser != null)
            {
                // Update existing user properties
                existingUser.Username = user.Username;
                existingUser.Email = user.Email;
                // Update other properties as needed
                context.SaveChanges();
            }
        }

        public void DeleteUser(int userId)
        {
            var userToDelete = context.UserOus.Find(userId);
            if (userToDelete != null)
            {
                context.UserOus.Remove(userToDelete);
                context.SaveChanges();
            }
        }
    }
}
