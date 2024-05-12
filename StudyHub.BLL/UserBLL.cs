using StudyHub.DAL;
using StudyHub.DAL.Models;
using System;
using System.Collections.Generic;

namespace StudyHub.BLL
{
    public class UserBLL
    {
        private readonly UserDAL _userDAL;

        public UserBLL()
        {
            _userDAL = new UserDAL();
        }

        public List<UserOu> GetAllUsers()
        {
            return _userDAL.GetAllUsers();
        }

        public UserOu GetUserById(int userId)
        {
            return _userDAL.GetUserById(userId);
        }

        public void AddUser(UserOu user)
        {
            _userDAL.AddUser(user);
        }

        public void UpdateUser(UserOu user)
        {
            _userDAL.UpdateUser(user);
        }

        public void DeleteUser(int userId)
        {
            _userDAL.DeleteUser(userId);
        }

        public UserOu GetUserByUsernameAndPassword(string username, string password)
        {
            return _userDAL.GetUserByUsernameAndPassword(username, password);
        }

        public UserOu GetUserByusername(string username)
        { 
            return _userDAL.GetUserByUsername(username);
        }
        // cap nhat pass
        public UserOu ChangePass(int userId, string password)
        {
            return _userDAL.ChangePass(userId, password);
        }
        
    }
}
