using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using StudyHub.BLL;

namespace StudyHub.Controllers
{






    [Route("api/[controller]")]
    [ApiController]
    public class KhoaHocController : ControllerBase
    {

        private readonly KhoaHocBLL _khoaHocBLL;

        public KhoaHocController()
        {
            _khoaHocBLL = new KhoaHocBLL();
        }
        // API tìm kiếm khóa học theo tên
        [HttpGet("search")]
        public IActionResult GetKhoaHocByTen([FromQuery] string tenKhoaHoc)
        {
            var khoaHocs = _khoaHocBLL.GetKhoaHocByTen(tenKhoaHoc);
            if (khoaHocs == null || !khoaHocs.Any())
            {
                return NotFound("Không tìm thấy khóa học nào với tên được cung cấp.");
            }
            return Ok(khoaHocs);
        }
    }
}
