using StudyHub.DAL.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace StudyHub.DAL
{
    public class MonHocDAL
    {
        private readonly HeThongQuanLyHocTapContext _context = new HeThongQuanLyHocTapContext();

        public IEnumerable<CauHoi> GetCauHoiByMonHoc(int idMonHoc)
        {
            // Lấy danh sách câu hỏi theo môn học bằng `IdMonHoc`
            return _context.MonHocs
                .Where(m => m.IdMonHoc == idMonHoc)
                .SelectMany(m => m.CauHois) // Giả định 'm.CauHois' là danh sách các 'CauHoi'
                .ToList();
        }


        public MonHoc AddMonHoc(MonHoc monHoc)
        {
            _context.MonHocs.Add(monHoc);
            _context.SaveChanges();
            return monHoc;
        }

        public bool UpdateMonHoc(int id, MonHoc monHoc)
        {
            var existingMonHoc = _context.MonHocs.FirstOrDefault(m => m.IdMonHoc == id);
            if (existingMonHoc == null)
            {
                return false;
            }

            existingMonHoc.TenMonHoc = monHoc.TenMonHoc;

            _context.SaveChanges();
            return true;
        }

        public bool DeleteMonHoc(int id)
        {
            var existingMonHoc = _context.MonHocs.FirstOrDefault(m => m.IdMonHoc == id);
            if (existingMonHoc == null)
            {
                return false;
            }

            _context.MonHocs.Remove(existingMonHoc);
            _context.SaveChanges();
            return true;
        }

        public MonHoc? GetMonHocById(int id)
        {
            return _context.MonHocs.FirstOrDefault(m => m.IdMonHoc == id);
        }
    }
}