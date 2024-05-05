using Microsoft.AspNetCore.Mvc;
using StudyHub.BLL;
using StudyHub.Common.Req;
using StudyHub.Common.Rsp;

namespace StudyHub.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class CauhoiController : ControllerBase
    {

        private CauHoiSvc cauhoiSvc;
        public CauhoiController()
        {
            cauhoiSvc = new CauHoiSvc();

        }

        [HttpPost("create_cauhoi")]
        public IActionResult CreateCauhoi([FromBody] CauHoiReq cauhoiReq)
        {
            if (cauhoiReq.IdMonHoc <= 0 || cauhoiReq.IdLoaiCauHoi <= 0) // Kiểm tra điều kiện cần thiết
            {
                return BadRequest("Idbaitap và Idloaicauhoi không được phép null");
            }
            var res = new SingleRsp();
            res = cauhoiSvc.CreateCauhoi(cauhoiReq);
            return Ok(res);
        }

        [HttpGet("by_monhoc/{idMonHoc}")]
        public IActionResult GetCauHoisByMonHoc(int idMonHoc)
        {
            var res = cauhoiSvc.GetCauHoisByMonHoc(idMonHoc);
            return Ok(res);
        }


        [HttpPost("search_cauhoi")]
        public IActionResult SearchCauhoi([FromBody] SearchCauHoiReq searchCauhoiReq)
        {
            var res = new SingleRsp();
            res = cauhoiSvc.SearchCauhoi(searchCauhoiReq);
            return Ok(res);
        }
    }
}
