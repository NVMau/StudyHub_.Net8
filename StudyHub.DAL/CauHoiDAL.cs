using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Migrations.Operations;
using StudyHub.DAL.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace StudyHub.DAL
{
    public class CauHoiDAL
    {
        HeThongQuanLyHocTapContext context = new HeThongQuanLyHocTapContext();


        //public CauHoi? GetCauHoiById(int cauHoiId)
        //{
        //    // Lấy câu hỏi mà không tải đáp án
        //    var cauHoi = context.CauHois
        //        .FirstOrDefault(ch => ch.IdCauHoi == cauHoiId);

        //    if (cauHoi != null)
        //    {
        //        // Tải danh sách đáp án riêng biệt
        //        var dapAns = context.DapAns
        //            .Where(da => da.IdCauHoi == cauHoiId)
        //            .ToList();

        //        // Thêm danh sách đáp án vào câu hỏi
        //        cauHoi.DapAns = dapAns;
        //    }

        //    return cauHoi;
        //}


        public CauHoi? GetCauHoiById(int cauHoiId)
        {
            // Sử dụng Include để tải trước danh sách các đáp án
            var cauHoi = context.CauHois
                .Include(ch => ch.DapAns)
                .FirstOrDefault(ch => ch.IdCauHoi == cauHoiId);
            return cauHoi;
        }



        public void AddCauHoi(CauHoi cauHoi)
        {
            // Kiểm tra và gán MonHoc
            var monHoc = context.MonHocs.FirstOrDefault(m => m.IdMonHoc == cauHoi.IdMonHoc);
            if (monHoc == null)
            {
                throw new Exception("Môn học với ID được cung cấp không tồn tại.");
            }
            cauHoi.IdMonHocNavigation = monHoc;

            // Kiểm tra và gán LoaiCauHoi
            var loaiCauHoi = context.LoaiCauHois.FirstOrDefault(l => l.IdLoaiCauHoi == cauHoi.IdLoaiCauHoi);
            if (loaiCauHoi == null)
            {
                throw new Exception("Loại câu hỏi với ID được cung cấp không tồn tại.");
            }
            cauHoi.IdLoaiCauHoiNavigation = loaiCauHoi;

            // Thêm câu hỏi đã cập nhật vào cơ sở dữ liệu
            context.CauHois.Add(cauHoi);
            context.SaveChanges();
        }
        public void UpdateCauHoi(CauHoi cauHoi)
        {
            // Kiểm tra MonHoc
            var monHoc = context.MonHocs.FirstOrDefault(m => m.IdMonHoc == cauHoi.IdMonHoc);
            if (monHoc == null)
            {
                throw new Exception("Môn học với ID được cung cấp không tồn tại.");
            }
            cauHoi.IdMonHocNavigation = monHoc;

            // Kiểm tra LoaiCauHoi
            var loaiCauHoi = context.LoaiCauHois.FirstOrDefault(l => l.IdLoaiCauHoi == cauHoi.IdLoaiCauHoi);
            if (loaiCauHoi == null)
            {
                throw new Exception("Loại câu hỏi với ID được cung cấp không tồn tại.");
            }
            cauHoi.IdLoaiCauHoiNavigation = loaiCauHoi;

            // Cập nhật thông tin câu hỏi
            context.CauHois.Update(cauHoi);
            context.SaveChanges();
        }
        public void DeleteCauHoi(int CauHoiId)
        {
            var cauHoi = context.CauHois.FirstOrDefault(c => c.IdCauHoi == CauHoiId);
            if (cauHoi == null)
            {
                throw new Exception("Câu hỏi với ID được cung cấp không tồn tại.");
            }

            context.CauHois.Remove(cauHoi);
            context.SaveChanges();
        }



    }
}
