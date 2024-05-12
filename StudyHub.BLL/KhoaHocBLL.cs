using StudyHub.DAL;
using StudyHub.DAL.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace StudyHub.BLL
{
    public class KhoaHocBLL
    {
        private readonly KhoaHocDAL khoaHocDAL;

        public KhoaHocBLL()
        {
            khoaHocDAL = new KhoaHocDAL();
        }
        // lấy danh sách khóa học
        public List<object> GetListKhoaHoc()
        {
            return khoaHocDAL.GetListKhoaHoc();
        }

        public List<object> GetListKhoaHocByUserAndByHocKy(int userId, int hocKyId)
        {
            // Lấy danh sách Khóa học dựa trên User và Học Kỳ
            return khoaHocDAL.GetListKhoaHocByUserAndByHocKy(userId, hocKyId);
        }

        public List<object> LayDanhSachKhoaHocTheoGiangVienVaHocKy(int idGiangVien, int idHocKy)
        {
            return khoaHocDAL.LayDanhSachKhoaHocTheoGiangVienVaHocKy(idGiangVien, idHocKy);
        }

        public IEnumerable<KhoaHoc> GetKhoaHocByTen(string tenKhoaHoc)
        {
            return khoaHocDAL.GetKhoaHocByTen(tenKhoaHoc);
        }
        // lấy theo user
        public List<object> GetListKhoaHocByUser(int userId)
        {
            return khoaHocDAL.GetListKhoaHocByUser(userId);
        }
    }
}
