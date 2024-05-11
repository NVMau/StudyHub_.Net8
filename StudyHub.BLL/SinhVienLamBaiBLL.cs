using StudyHub.DAL;
using StudyHub.DAL.Models;

namespace StudyHub.BLL
{
    public class SinhVienLamBaiBLL
    {
        private readonly SinhVienLamBaiDAL _sinhVienLamBaiDAL;

        public SinhVienLamBaiBLL()
        {
            _sinhVienLamBaiDAL = new SinhVienLamBaiDAL();
        }

        public SinhVienLamBai? GetSinhVienLamBaiById(int id)
        {
            return _sinhVienLamBaiDAL.GetSinhVienLamBaiById(id);
        }

        public SinhVienLamBai? AddSinhVienLamBai(SinhVienLamBai sinhVienLamBai)
        {
            return _sinhVienLamBaiDAL.AddSinhVienLamBai(sinhVienLamBai);
        }

        // Các phương thức khác như Add, Update, Delete có thể được thêm vào đây nếu cần
    }
}
