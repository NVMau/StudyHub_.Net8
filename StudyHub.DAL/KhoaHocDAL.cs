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




        public KhoaHoc? GetKhoaHocById(int idKhoaHoc)
        {
            return _context.KhoaHocs.FirstOrDefault(kh => kh.IdKhoaHoc == idKhoaHoc);
        }



        public HocKy? GetHocKyById(int idKhoaHoc)
        {
            var kh = _context.KhoaHocs.FirstOrDefault(kh => kh.IdKhoaHoc == idKhoaHoc);


            return _context.HocKies.FirstOrDefault(ky => ky.IdHocKy == kh.IdHocKy);


        }
    }
}
