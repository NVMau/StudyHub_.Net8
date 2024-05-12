using Microsoft.EntityFrameworkCore;
using StudyHub.DAL.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace StudyHub.DAL
{
    public class KhoaHocDAL
    {
        HeThongQuanLyHocTapContext context = new HeThongQuanLyHocTapContext();

        //lấy list KhocHoc
        //public List<KhoaHoc> GetListKhoaHoc()
        //{
        //    return context.KhoaHocs.ToList();
        //}
        public List<object> GetListKhoaHoc()
        {
            var khoaHocs = context.KhoaHocs
                .Select(kh => new
                {
                    IdKhoaHoc = kh.IdKhoaHoc,
                    TenKhoaHoc = kh.TenKhoaHoc,
                    TenGiangVien = kh.IdGiangVienNavigation.FirstName + " " + kh.IdGiangVienNavigation.LastName,
                    SoTinChi = kh.IdMonHocNavigation.SoTinChi
                })
                .ToList<object>();

            return khoaHocs;
        }


        public List<object> GetListKhoaHocByUserAndByHocKy(int userId, int hocKyId)
        {
            var khoaHocs = context.KhoaHocs
                .Where(kh => kh.IdHocKy == hocKyId && kh.SinhVienKhoaHocs.Any(svk => svk.IdSinhVien == userId))
                .Select(kh => new
                {
                    kh.IdKhoaHoc,
                    kh.TenKhoaHoc,
                    TenGiangVien = kh.IdGiangVienNavigation.FirstName + " " + kh.IdGiangVienNavigation.LastName,
                    SoLuongSinhVien = kh.SinhVienKhoaHocs.Count,
                    TenMonHoc = kh.IdMonHocNavigation.TenMonHoc,
                    SoTinChi = kh.IdMonHocNavigation.SoTinChi
                })
                .ToList<object>();
            return khoaHocs;
        }

        // Hàm để lấy danh sách khóa học theo ID user là giảng viên và ID học kỳ
        public List<object> LayDanhSachKhoaHocTheoGiangVienVaHocKy(int idGiangVien, int idHocKy)
        {
            var query = from khoaHoc in context.KhoaHocs
                        where khoaHoc.IdGiangVien == idGiangVien && khoaHoc.IdHocKy == idHocKy
                        select new
                        {
                            IdKhoaHoc = khoaHoc.IdKhoaHoc,
                            TenKhoaHoc = khoaHoc.TenKhoaHoc,
                            IdMonHoc = khoaHoc.IdMonHoc, // Thêm trường IdMonHoc vào biểu thức projection
                            TenMonHoc = khoaHoc.IdMonHocNavigation.TenMonHoc,
                            TenGiangVien = khoaHoc.IdGiangVienNavigation.FirstName + " " + khoaHoc.IdGiangVienNavigation.LastName,
                            SoLuongSinhVien = khoaHoc.SinhVienKhoaHocs.Count
                        };

            return query.ToList<object>();
        }

        public IEnumerable<KhoaHoc> GetKhoaHocByTen(string tenKhoaHoc)
        {
            return context.KhoaHocs
                .Where(kh => kh.TenKhoaHoc.Contains(tenKhoaHoc))
                .ToList();
        }

        // lấy khóa học theo user
        public List<object> GetListKhoaHocByUser(int userId)
        {
            var khoaHocs = context.KhoaHocs
                .Where(kh => kh.SinhVienKhoaHocs.Any(svk => svk.IdSinhVien == userId))
                .Select(kh => new
                {
                    kh.IdKhoaHoc,
                    kh.TenKhoaHoc,
                    TenGiangVien = kh.IdGiangVienNavigation.FirstName + " " + kh.IdGiangVienNavigation.LastName,
                    SoLuongSinhVien = kh.SinhVienKhoaHocs.Count,
                    TenMonHoc = kh.IdMonHocNavigation.TenMonHoc,
                    SoTinChi = kh.IdMonHocNavigation.SoTinChi // Lấy số tín chỉ từ MonHoc
                })
                .ToList<object>();
            return khoaHocs;
        }

    }
}
