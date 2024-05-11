using StudyHub.DAL.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace StudyHub.DAL
{
    public class SinhVienKhoaHocDAL
    {
        private readonly HeThongQuanLyHocTapContext _context = new HeThongQuanLyHocTapContext();
        public SinhVienKhoaHoc AddSinhVienKhoaHoc(SinhVienKhoaHoc sinhVienKhoaHoc)
        {
            _context.SinhVienKhoaHocs.Add(sinhVienKhoaHoc);
            _context.SaveChanges();
            return sinhVienKhoaHoc;
        }

        public bool DeleteSinhVienKhoaHoc(int id)
        {
            var svkh = _context.SinhVienKhoaHocs.Find(id);
            if (svkh == null)
            {
                return false;
            }

            _context.SinhVienKhoaHocs.Remove(svkh);
            _context.SaveChanges();
            return true;
        }


        public IEnumerable<SinhVienKhoaHoc> GetSinhVienKhoaHocBySV(int idSinhhVien)
        {
             


            return _context.SinhVienKhoaHocs.Where(svkh => svkh.IdSinhVien == idSinhhVien).ToList();
        }

    }
}
