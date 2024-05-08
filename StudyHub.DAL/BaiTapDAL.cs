using Microsoft.EntityFrameworkCore;
using StudyHub.DAL.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace StudyHub.DAL
{
    public class BaiTapDAL
    {
        private readonly HeThongQuanLyHocTapContext _context = new HeThongQuanLyHocTapContext();

        public IEnumerable<BaiTap> GetBaiTapByKhoaHoc(int idKhoaHoc)
        {
            return _context.BaiTaps.Where(b => b.IdKhoaHoc == idKhoaHoc).ToList();
        }

        public BaiTap AddBaiTap(BaiTap baiTap)
        {
            _context.BaiTaps.Add(baiTap);
            _context.SaveChanges();
            return baiTap;
        }

        public bool UpdateBaiTap(int id, BaiTap baiTap)
        {
            var existingBaiTap = _context.BaiTaps.FirstOrDefault(b => b.IdBaiTap == id);
            if (existingBaiTap == null)
            {
                return false;
            }

            existingBaiTap.TenBaiTap = baiTap.TenBaiTap;
            existingBaiTap.ThoiGian = baiTap.ThoiGian;
            existingBaiTap.IdLoaiBaiTap = baiTap.IdLoaiBaiTap;
            existingBaiTap.IdKhoaHoc = baiTap.IdKhoaHoc;

            _context.SaveChanges();
            return true;
        }

        public BaiTap? GetBaiTapById(int id)
        {
            return _context.BaiTaps.FirstOrDefault(b => b.IdBaiTap == id);
        }


        public IEnumerable<CauHoi> GetCauHoiByBaiTap(int idBaiTap)
        {
            return _context.ListTracNghiems
            .Where(ln => ln.IdBaiTap == idBaiTap)
            .Select(ln => ln.IdCauHoiNavigation)
            .ToList();
        }
    }
}
