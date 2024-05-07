using StudyHub.DAL;
using System;
using System.Collections.Generic;
using System.Linq;
using StudyHub.DAL.Models;

using System.Text;
using System.Threading.Tasks;

namespace StudyHub.BLL
{
    public class CauHoiBLL
    {
        public readonly CauHoiDAL _cauHoiDAL;
        public CauHoiBLL()
        {
            _cauHoiDAL = new CauHoiDAL();
        }

        public void AddCauHoi(CauHoi cauHoi)
        {
            _cauHoiDAL.AddCauHoi(cauHoi);

        }


        public CauHoi? GetCauHoiById(int IdCauHoi)
        {
            return _cauHoiDAL.GetCauHoiById(IdCauHoi);
        }


        public void UpdateCauHoi(CauHoi cauHoi)
        {
            _cauHoiDAL.UpdateCauHoi(cauHoi);
        }



        public void DeleteCauHoi(int idCauHoi)
        {
            _cauHoiDAL.DeleteCauHoi(idCauHoi);
        }

    }
}
