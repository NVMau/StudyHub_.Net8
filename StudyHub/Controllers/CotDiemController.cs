using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using StudyHub.BLL;
using StudyHub.DAL;
using StudyHub.DAL.Models;
using System.Drawing;

namespace StudyHub.Controllers
{
    public class SinhVienLamBaiDto
    {
        public int IdSinhVien { get; set; }
        public int IdBaiTap { get; set; }
        public string? NoiDungBaiLam { get; set; }
        public double Diem { get; set; } // Thêm thuộc tính Diem
    }


    public class TraloiSinhVienDTO
    {
        public int IdCauHoi { get; set; }
        public int IdDapan  { get; set; }
    }


    [Route("api/[controller]")]
    [ApiController]
    public class CotDiemController : ControllerBase
    {
        private readonly CotDiemBLL _cotDiemBLL;
        private readonly BaiTapBLL _baiTapBLL;
        private readonly SinhVienLamBaiBLL _sinhVienLamBaiBLL;
        private readonly CauHoiBLL _cauHoiBLL;



        public CotDiemController()
        {
            _cotDiemBLL = new CotDiemBLL();
            _baiTapBLL = new BaiTapBLL();
            _sinhVienLamBaiBLL = new SinhVienLamBaiBLL();
            _cauHoiBLL = new CauHoiBLL();
        }




        [HttpPost("sinhvien/{idSinhVien}/tinhDiem")]
        public IActionResult TinhDiemBaiLam(int idSinhVien, [FromBody] List<TraloiSinhVienDTO> traloiSinhVien)
        {
            var diem = 0.0;
            foreach (var cauhoi  in traloiSinhVien)
            {
                var cauHoi = _cauHoiBLL.GetCauHoiById(cauhoi.IdCauHoi);
                var dapandung = _cauHoiBLL.GetDapAnDungById(cauHoi.IdCauHoi);

                if (cauHoi != null && dapandung != null)
                {

                    if (dapandung.IdDapAn == cauhoi.IdDapan)
                    {
                        diem += 10; // Giả sử mỗi câu trả lời đúng được 1 điểm
                    }
                }




            }
            var tongDiem = diem/ traloiSinhVien.Count; // Tính toán điểm tổng dựa trên số câu trả lời đúng
            var cauHoiCheck = traloiSinhVien.FirstOrDefault();
            var cotDiem = new CotDiem
            {
                TenCotDiem = _cauHoiBLL.GetTenBaiTapByCauHoiId(cauHoiCheck.IdCauHoi),
                Diem = tongDiem
            };


            _cotDiemBLL.AddCotDiem(cotDiem);
            var sinhVienLamBai = new SinhVienLamBai
            {
                IdSinhVien =idSinhVien,
                IdBaiTap = _cauHoiBLL.GetIdBaiTapByCauHoiId(cauHoiCheck.IdCauHoi),
                IdCotDiem = cotDiem.IdCotDiem,
                NoiDungBaiLam = "Trac nghiem"
            };

            var addedSinhVienLamBai = _cotDiemBLL.AddSinhVienLamBai(sinhVienLamBai);

            return Ok(new { Diem = tongDiem });
        }




        [HttpGet("getsinhvienlambai/{id}")]
        public IActionResult GetSinhVienLamBaiById(int id)
        {
            var sinhVienLamBai = _sinhVienLamBaiBLL.GetSinhVienLamBaiById(id);
            if (sinhVienLamBai == null)
            {
                return NotFound();
            }
            return Ok(sinhVienLamBai);
        }

        // API để lưu điểm sinh viên
        [HttpPost("luuDiem")]
        public IActionResult AddCotDiem([FromBody] SinhVienLamBaiDto sinhVienLamBaiDto)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            var baiTap = _baiTapBLL.GetBaiTapById(sinhVienLamBaiDto.IdBaiTap);
            if (baiTap == null)
            {
                return NotFound("Không tìm thấy bài tập với ID được cung cấp.");
            }

            var cotDiem = new CotDiem
            {
                TenCotDiem = baiTap.TenBaiTap, // Sử dụng tên bài tập làm tên cột điểm
                Diem = sinhVienLamBaiDto.Diem

            };

            _cotDiemBLL.AddCotDiem(cotDiem);
            var sinhVienLamBai = new SinhVienLamBai
            {
                IdSinhVien = sinhVienLamBaiDto.IdSinhVien,
                IdBaiTap = sinhVienLamBaiDto.IdBaiTap,
                IdCotDiem = cotDiem.IdCotDiem,
                NoiDungBaiLam = sinhVienLamBaiDto.NoiDungBaiLam
            };

            var addedSinhVienLamBai = _cotDiemBLL.AddSinhVienLamBai(sinhVienLamBai);
            return CreatedAtAction(nameof(GetSinhVienLamBaiById), new { id = sinhVienLamBai.IdBaiLam }, sinhVienLamBai);


        }
        // API để xem các cột điểm của khóa học
        [HttpGet("khoaHoc/{idKhoaHoc}/user/{idUser}")]
        public IActionResult GetCotDiemsByKhoaHoc(int idKhoaHoc, int idUser)
        {
            var cotDiems = _cotDiemBLL.GetCotDiemsByKhoaHocAndUser(idKhoaHoc, idUser);
            if (cotDiems == null || !cotDiems.Any())
            {
                return NotFound("Không tìm thấy cột điểm nào cho khóa học này.");
            }
            return Ok(cotDiems);
        }
    }
}
