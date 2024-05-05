using StudyHub.Common.BLL;
using StudyHub.Common.Rsp;
using StudyHub.DAL.Models;
using StudyHub.DAL;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using StudyHub.Common.Req;

namespace StudyHub.BLL
{
    public class CauHoiSvc : GenericSvc<CauHoiRep, CauHoi>
    {
        private CauHoiRep cauHoiRep;
        #region -- Overrides --

        public override SingleRsp Read(int id)
        {
            var res = new SingleRsp();

            var m = _rep.Read(id);
            res.Data = m;

            return res;
        }

        public override SingleRsp Update(CauHoi m)
        {
            var res = new SingleRsp();

            var m1 = m.IdCauHoi > 0 ? _rep.Read(m.IdCauHoi) : _rep.Read(m.NoiDung);
            if (m1 == null)
            {
                res.SetError("EZ103", "No data.");
            }
            else
            {
                res = base.Update(m);
                res.Data = m;
            }

            return res;
        }
        #endregion
        public CauHoiSvc()
        {
            cauHoiRep = new CauHoiRep();
        }




        public SingleRsp CreateCauhoi(CauHoiReq cauHoiReq)
        {
            var res = new SingleRsp();
            CauHoi cauHoi = new CauHoi();
            cauHoi.NoiDung = cauHoiReq.NoiDung;
            cauHoi.IdLoaiCauHoi = cauHoiReq.IdLoaiCauHoi;
            cauHoi.IdMonHoc = cauHoiReq.IdMonHoc;
            res = cauHoiRep.CreateCauhoi(cauHoi);
            return res;
        }

        public SingleRsp GetCauHoisByMonHoc(int idMonHoc)
        {
            var res = new SingleRsp();
            var cauhois = cauHoiRep.GetCauHoisByMonHoc(idMonHoc);
            if (cauhois == null || cauhois.Count == 0)
            {
                res.SetError("No questions found for the given subject.");
            }
            else
            {
                res.Data = cauhois;
            }
            return res;
        }


        public SingleRsp SearchCauhoi(SearchCauHoiReq s)
        {
            var res = new SingleRsp();
            //Lấy danh sách câu hỏi theo keyword
            string keyword = s.Keyword ?? string.Empty;
            var cauhois = cauHoiRep.SearchCauhoi(keyword);
            //Xử lý phân trang
            int pCount, totalPages, offset;
            pCount = cauhois.Count;
            totalPages = (pCount % s.Size) == 0 ? pCount / s.Size : 1 + (pCount / s.Size);
            offset = s.Size * (s.Page - 1);
            var p = new
            {
                Data = cauhois.Skip(offset).Take(s.Size).ToList(),
                Page = s.Page,
                Size = s.Size
            };
            res.Data = p;
            return res;

        }

    }
}
