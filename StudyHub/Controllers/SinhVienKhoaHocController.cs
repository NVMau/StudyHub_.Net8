using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using StudyHub.BLL;
using StudyHub.DAL;
using StudyHub.DAL.Models;

namespace StudyHub.Controllers
{



    public class SinhVienKhoaHocDto
    {
        public int IdSinhVien { get; set; }

        public int IdKhoaHoc { get; set; }
    }

    [Route("api/[controller]")]
    [ApiController]
    public class SinhVienKhoaHocController : ControllerBase
    {
        private readonly SinhVienKhoaHocBLL _sinhVienKhoaHocBLL;

        public SinhVienKhoaHocController()
        {
            _sinhVienKhoaHocBLL =  new SinhVienKhoaHocBLL();
        }

        // Đăng ký môn học
        [HttpPost("dangky")]
        public IActionResult DangKyMonHoc([FromBody] SinhVienKhoaHocDto sinhVienKhoaHocDto)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            var sinhVienKhoaHoc = new SinhVienKhoaHoc
            {
                IdKhoaHoc = sinhVienKhoaHocDto.IdKhoaHoc,
                IdSinhVien = sinhVienKhoaHocDto.IdSinhVien
            };

            var result = _sinhVienKhoaHocBLL.AddSinhVienKhoaHoc(sinhVienKhoaHoc);
            if (result == null)
            {
                return BadRequest("Không thể đăng ký môn học.");
            }

            return Ok(result);
        }

        // Hủy đăng ký môn học
        [HttpDelete("huydangky/{id}")]
        public IActionResult HuyDangKyMonHoc(int id)
        {
            if (!_sinhVienKhoaHocBLL.DeleteSinhVienKhoaHoc(id))
            {
                return NotFound("Không tìm thấy đăng ký môn học để hủy.");
            }

            return NoContent();
        }
    }
}
