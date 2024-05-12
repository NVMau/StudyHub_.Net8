using StudyHub.DAL.Models;
using System.Linq;

namespace StudyHub.DAL
{
    public class SinhVienLamBaiDAL
    {
        private readonly HeThongQuanLyHocTapContext _context;

        public SinhVienLamBaiDAL()
        {
            _context = new HeThongQuanLyHocTapContext();
        }

        public SinhVienLamBai GetSinhVienLamBaiById(int id)
        {
            return _context.SinhVienLamBais.FirstOrDefault(slb => slb.IdBaiLam == id);
        }

        // Các phương thức khác như Add, Update, Delete có thể được thêm vào đây nếu cần
    }
}
