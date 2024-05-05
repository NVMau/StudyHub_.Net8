using StudyHub.Common.DAL;
using StudyHub.Common.Rsp;
using StudyHub.DAL.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace StudyHub.DAL
{
    public class CauHoiRep : GenericRep<HeThongQuanLyHocTapContext, CauHoi>
    {
        #region -- Overrides --


        public override CauHoi Read(int id)
        {
            var res = All.FirstOrDefault(p => p.IdCauHoi == id);
            if (res == null)
            {
                // Xử lý trường hợp không tìm thấy dữ liệu
                throw new Exception("CauHoi not found");
            }
            return res;
        }


        public int Remove(int id)
        {
            var m = base.All.First(i => i.IdCauHoi == id);
            m = base.Delete(m);
            return m.IdCauHoi;
        }

        #endregion

        #region -- Methods --

        public SingleRsp CreateCauhoi(CauHoi cauhoi)
        {
            var res = new SingleRsp();
            using (var context = new HeThongQuanLyHocTapContext())
            {
                using (var tran = context.Database.BeginTransaction())
                {
                    try
                    {
                        var p = context.CauHois.Add(cauhoi);
                        context.SaveChanges();
                        tran.Commit();
                    }
                    catch (Exception ex)
                    {
                        tran.Rollback();
                        string innerMessage = ex.InnerException != null ? ex.InnerException.Message : "No inner exception";
                        res.SetError("Error: " + ex.Message + " Inner Exception: " + innerMessage + " Stack Trace: " + ex.StackTrace);
                        return res;
                    }
                }
            }
            return res;
        }





        public List<CauHoi> SearchCauhoi(string keyWord)
        {

            return All.Where(x => x.NoiDung.Contains(keyWord)).ToList();

        }
        #endregion


    }
}
