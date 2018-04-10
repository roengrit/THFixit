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
    public class EquipmentRepo : IDisposable
    {
        private IDbConnection dbConnection;

        public EquipmentRepo(string connectionString)
        {
            Dapper.DefaultTypeMap.MatchNamesWithUnderscores = true;
            dbConnection = new NpgsqlConnection(connectionString);
        }

        public IEnumerable<Equipment> GetAll(int branchId)
        {
            DbHelper.OpenCon(ref dbConnection);
            var ret = dbConnection.Query<Equipment>("select * from equipments where branch_id = @branch_id ", new { branch_id = branchId });
            dbConnection.Close();
            return ret;
        }

        public IEnumerable<Equipment> GetAllActive(int branchId)
        {
            DbHelper.OpenCon(ref dbConnection);
            var ret = dbConnection.Query<Equipment>("select * from equipments where active = true and branch_id = @branch_id", new { branch_id = branchId });
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

        public IEnumerable<Equipment> FindByName(string term, int branchId)
        {
            term = term ?? string.Empty;
            DbHelper.OpenCon(ref dbConnection);
            var ret = dbConnection.Query<Equipment>("select * from equipments where branch_id = @branch_id and lower(name) like lower(@term);", new { term = "%" + term + "%", branch_id = branchId });
            dbConnection.Close();
            return ret;
        }

        public void Dispose()
        {
            dbConnection.Close();
        }
    }
}
