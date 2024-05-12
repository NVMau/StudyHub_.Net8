using StudyHub.DAL.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace StudyHub.DAL
{
    public class HocKyDAL
    {
        HeThongQuanLyHocTapContext context = new HeThongQuanLyHocTapContext();

        //lấy list HocKy
        public List<HocKy> GetListHocKy()
        {
            return context.HocKies.ToList();
        }



    }
}
