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


        public List<UserOu> GetAllUsers()
        {
            var users = context.UserOus
                        .Select(i => new UserOu
                        {
                            IdUser = i.IdUser,
                            Username = i.Username,
                            FirstName = i.FirstName,
                            LastName = i.LastName,
                            Email = i.Email,
                            Address = i.Address,
                            Avatar = i.Avatar,
                            Role = i.Role
                        })
                        .ToList<UserOu>();
            return users;
        }

        public UserOu GetUserById(int userId)
        {
            var user = context.UserOus
                .FirstOrDefault(u => u.IdUser == userId);
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
