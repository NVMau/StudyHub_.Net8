using StudyHub.DAL.Models;
using StudyHub.DAL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace StudyHub.BLL
{
    public class KhoaHocBLL
    {
        private readonly KhoaHocDAL _khoaHocDAL;

        public KhoaHocBLL()
        {
            _khoaHocDAL = new KhoaHocDAL();
        }

        public IEnumerable<KhoaHoc> GetKhoaHocByTen(string tenKhoaHoc)
        {
            return _khoaHocDAL.GetKhoaHocByTen(tenKhoaHoc);
        }
    }
}
