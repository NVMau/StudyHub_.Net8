using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using StudyHub.BLL;
using StudyHub.DAL.Models;

namespace StudyHub.Controllers
{
    public class SinhVienLamBaiDto
    {
        public int IdSinhVien { get; set; }
        public int IdBaiTap { get; set; }
        public string? NoiDungBaiLam { get; set; }
        public double Diem { get; set; } // Thêm thuộc tính Diem
    }

    [Route("api/[controller]")]
    [ApiController]
    public class CotDiemController : ControllerBase
    {
        private readonly CotDiemBLL _cotDiemBLL;
        private readonly BaiTapBLL _baiTapBLL;
        private readonly SinhVienLamBaiBLL _sinhVienLamBaiBLL;


        public CotDiemController()
        {
            _cotDiemBLL = new CotDiemBLL();
            _baiTapBLL = new BaiTapBLL();
            _sinhVienLamBaiBLL = new SinhVienLamBaiBLL();
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
