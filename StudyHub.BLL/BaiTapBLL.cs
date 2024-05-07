using StudyHub.DAL;
using StudyHub.DAL.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace StudyHub.BLL
{
    public class BaiTapBLL
    {
        private readonly BaiTapDAL _baiTapDAL;

        public BaiTapBLL()
        {
            _baiTapDAL = new BaiTapDAL();
        }

        public IEnumerable<BaiTap> GetBaiTapByKhoaHoc(int idKhoaHoc)
        {
            return _baiTapDAL.GetBaiTapByKhoaHoc(idKhoaHoc);
        }

        public BaiTap AddBaiTap(BaiTap baiTap)
        {
            return _baiTapDAL.AddBaiTap(baiTap);
        }

        public bool UpdateBaiTap(int id, BaiTap baiTap)
        {
            return _baiTapDAL.UpdateBaiTap(id, baiTap);
        }

        public BaiTap? GetBaiTapById(int id)
        {
            return _baiTapDAL.GetBaiTapById(id);
        }
    }
}
