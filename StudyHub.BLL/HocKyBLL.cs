using StudyHub.DAL;
using StudyHub.DAL.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace StudyHub.BLL
{
    public class HocKyBLL
    {
        private readonly HocKyDAL hocKyDAL;

        public HocKyBLL()
        {
            hocKyDAL = new HocKyDAL();
        }


        public List<HocKy> GetListHocKy()
        {
            return hocKyDAL.GetListHocKy();
        }

    }
}
