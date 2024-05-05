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

        //Bước 2 tạo hàm và gọi tới hàm DAL, chú ý trước đó là kiểu Object nên bên đây cũng trả về kiểu Object -> tới Controller
        public List<Object> GetAllUsers()
        {
            return _userDAL.GetAllUsers();
        }

        public Object GetUserById(int userId)
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
    }
}
