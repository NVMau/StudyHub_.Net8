using StudyHub.DAL;
using StudyHub.DAL.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace StudyHub.BLL
{
    namespace StudyHub.BLL
    {
        public class MonHocBLL
        {
            private readonly MonHocDAL _monHocDAL;

            public MonHocBLL()
            {
                _monHocDAL = new MonHocDAL();
            }


            public IEnumerable<CauHoi> GetCauHoiByMonHoc(int idKhoaHoc)
            {
                return _monHocDAL.GetCauHoiByMonHoc(idKhoaHoc);
            }

            public MonHoc AddMonHoc(MonHoc monHoc)
            {
                return _monHocDAL.AddMonHoc(monHoc);
            }

            public bool UpdateMonHoc(int id, MonHoc monHoc)
            {
                return _monHocDAL.UpdateMonHoc(id, monHoc);
            }

            public bool DeleteMonHoc(int id)
            {
                return _monHocDAL.DeleteMonHoc(id);
            }

            public MonHoc? GetMonHocById(int id)
            {
                return _monHocDAL.GetMonHocById(id);
            }
        }
    }
}