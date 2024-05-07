using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using StudyHub.BLL;
using StudyHub.DAL.Models;

namespace StudyHub.Controllers
{





    public class CauHoiDto
    {
        public string NoiDung { get; set; } = "";
        public int IdMonHoc { get; set; }
        public int IdLoaiCauHoi { get; set; }
    }


    [Route("api/[controller]")]
    [ApiController]
    public class CauHoiController : ControllerBase
    {
        private readonly CauHoiBLL _cauHoiBLL;

        public CauHoiController()
        {
            _cauHoiBLL = new CauHoiBLL();
        }

        [HttpGet("{id}")]
        public IActionResult GetCauHoiById(int id)
        {
            var cauHoi = _cauHoiBLL.GetCauHoiById(id);
            if (cauHoi == null)
            {
                return NotFound();
            }
            return Ok(cauHoi);
        }


        [HttpPost]
        public IActionResult AddCauHoi([FromBody] CauHoiDto cauHoiDto)
        {

            var cauHoi = new CauHoi
            {
                NoiDung = cauHoiDto.NoiDung,
                IdMonHoc = cauHoiDto.IdMonHoc,
                IdLoaiCauHoi = cauHoiDto.IdLoaiCauHoi
            };

            try
            {
                _cauHoiBLL.AddCauHoi(cauHoi);
            }
            catch (Exception ex)
            {
                return BadRequest(ex.Message);
            }

            return CreatedAtAction(nameof(GetCauHoiById), new { id = cauHoi.IdCauHoi }, cauHoi);
        }

        [HttpPut("{id}")]
        public IActionResult UpdateCauHoi(int id, [FromBody] CauHoiDto cauHoiDto)
        {
            var cauHoi = _cauHoiBLL.GetCauHoiById(id);
            if (cauHoi == null)
            {
                return NotFound();
            }

            cauHoi.NoiDung = cauHoiDto.NoiDung;
            cauHoi.IdMonHoc = cauHoiDto.IdMonHoc;
            cauHoi.IdLoaiCauHoi = cauHoiDto.IdLoaiCauHoi;

            try
            {
                _cauHoiBLL.UpdateCauHoi(cauHoi);
            }
            catch (Exception ex)
            {
                return BadRequest(ex.Message);
            }

            return NoContent();
        }
        [HttpDelete("{id}")]
        public IActionResult DeleteCauHoi(int id)
        {
            var cauHoi = _cauHoiBLL.GetCauHoiById(id);
            if (cauHoi == null)
            {
                return NotFound();
            }

            try
            {
                _cauHoiBLL.DeleteCauHoi(id);
            }
            catch (Exception ex)
            {
                return BadRequest(ex.Message);
            }

            return NoContent();
        }
    }
}
