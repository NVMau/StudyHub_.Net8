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
        private readonly HeThongQuanLyHocTapContext _context = new HeThongQuanLyHocTapContext();

        public IEnumerable<KhoaHoc> GetKhoaHocByTen(string tenKhoaHoc)
        {
            return _context.KhoaHocs
                .Where(kh => kh.TenKhoaHoc.Contains(tenKhoaHoc))
                .ToList();
        }
    }
}
