using Microsoft.EntityFrameworkCore;
using StudyHub.DAL;
using StudyHub.DAL.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace StudyHub.BLL
{
    public class SinhVienKhoaHocBLL
    {
        private readonly SinhVienKhoaHocDAL _sinhVienKhoaHocDAL;

        public SinhVienKhoaHocBLL()
        {
            _sinhVienKhoaHocDAL = new SinhVienKhoaHocDAL();
        }

        public SinhVienKhoaHoc AddSinhVienKhoaHoc(SinhVienKhoaHoc sinhVienKhoaHoc)
        {
            return _sinhVienKhoaHocDAL.AddSinhVienKhoaHoc( sinhVienKhoaHoc);
        }

        public bool DeleteSinhVienKhoaHoc(int id)
        {
            return _sinhVienKhoaHocDAL.DeleteSinhVienKhoaHoc(id);
        }


    }
}
