using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Threading.Tasks;
using Dapper;
using Npgsql;
using THFixit.Models.Model;

namespace THFixit.Repositorys
{
    public class EquipmentRepo  
    {
        private IDbConnection dbConnection;

        public EquipmentRepo(string connectionString)
        {
            Dapper.DefaultTypeMap.MatchNamesWithUnderscores = true;
            dbConnection = new NpgsqlConnection(connectionString);
        }

        public IEnumerable<Equipment> GetAll()
        {
            DbHelper.OpenCon(ref dbConnection);
            var ret = dbConnection.Query<Equipment>("select * from equipments");
            dbConnection.Close();
            return ret;
        }

        public IEnumerable<Equipment> GetAllActive()
        {
            DbHelper.OpenCon(ref dbConnection);
            var ret = dbConnection.Query<Equipment>("select * from equipments where active = true ");
            dbConnection.Close();
            return ret;
        }

        public Equipment FindById(int id)
        {
            DbHelper.OpenCon(ref dbConnection);
            var ret = dbConnection.QueryFirstOrDefault<Equipment>("select * from equipments where id = @id;", new { id = id });
            dbConnection.Close();
            return ret;
        }

        public IEnumerable<Equipment> FindByName(string term)
        {
            term = term ?? string.Empty;
            DbHelper.OpenCon(ref dbConnection);
            var ret = dbConnection.Query<Equipment>("select * from equipments where lower(name) like lower(@term);", new { term = "%" + term + "%" });
            dbConnection.Close();
            return ret;
        }

        public Equipment FindBySerial(string term, int branchId)
        {
            term = term ?? string.Empty;
            DbHelper.OpenCon(ref dbConnection);
            var ret = dbConnection.QueryFirstOrDefault<Equipment>(
                @"select equipments.* from equipment_serials join equipments on equipment_serials.eq_id = equipments.id 
                  where equipment_serials.branch_id = @branch_id and lower(equipment_serials.serial_number) = lower(@term); ", new { term = term, branch_id = branchId });
            dbConnection.Close();
            return ret;
        }


        public IEnumerable<Equipment> FindBySerialNumberOrName(string term, int branchId)
        {
            term = term ?? string.Empty;
            DbHelper.OpenCon(ref dbConnection);
            var ret = dbConnection.Query<Equipment>(
                @"select equipments.*,equipment_serials.id as  serial_id , equipment_serials.serial_number from equipment_serials join equipments on equipment_serials.eq_id = equipments.id 
                  where equipment_serials.branch_id = @branch_id and (lower(equipment_serials.serial_number) like lower(@term) or lower(equipments.name) like lower(@term)); ", new { term = "%" + term + "%", branch_id = branchId });
            dbConnection.Close();
            return ret;
        }
    }
}
