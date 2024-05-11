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


        public IEnumerable<CauHoi> GetCauhoisByIdMon(int IdMon)
        {
            return _cauHoiDAL.GetCauhoisByIdMon(IdMon);
        }



        public CauHoi? GetCauHoiById(int IdCauHoi)
        {
            return _cauHoiDAL.GetCauHoiById(IdCauHoi);
        }


        public CauHoi? GetCauHoiByIdDapAn(int IdDapAn)
        {
            return _cauHoiDAL.GetCauHoiByIdDapAn(IdDapAn);
        }

        public DapAn? GetDapAnDungById(int IdCauHoi)
        {
            return _cauHoiDAL.GetDapAnDungById(IdCauHoi);

        }


        public void UpdateCauHoi(CauHoi cauHoi)
        {
            _cauHoiDAL.UpdateCauHoi(cauHoi);
        }



        public void DeleteCauHoi(int idCauHoi)
        {
            _cauHoiDAL.DeleteCauHoi(idCauHoi);
        }

        public string? GetTenBaiTapByCauHoiId(int cauHoiId)
        {
            return _cauHoiDAL.GetTenBaiTapByCauHoiId(cauHoiId);
        }

        public int GetIdBaiTapByCauHoiId(int cauHoiId)
        {
            return _cauHoiDAL.GetIdBaiTapByCauHoiId(cauHoiId);
        }

    }
}
