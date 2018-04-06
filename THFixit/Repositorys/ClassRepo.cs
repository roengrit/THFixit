using Npgsql;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Threading.Tasks;
using Dapper;
using THFixit.Models.Model;
namespace THFixit.Repositorys
{
    public class ClassRepo : IDisposable
    {
        private IDbConnection dbConnection;

        public ClassRepo(string connectionString)
        {
            Dapper.DefaultTypeMap.MatchNamesWithUnderscores = true;
            dbConnection = new NpgsqlConnection(connectionString);
        }

        public IEnumerable<Class> GetAll(int branchId, int buildingId)
        {
            DbHelper.OpenCon(ref dbConnection);
            var ret = dbConnection.Query<Class>("select * from class where branch_id = @branch_id and building_id = @building_id", new { branch_id = branchId, building_id = buildingId });
            dbConnection.Close();
            return ret;
        }

        public IEnumerable<Class> GetAllActive(int branchId, int buildingId)
        {
            DbHelper.OpenCon(ref dbConnection);
            var ret = dbConnection.Query<Class>("select * from class where active = true and branch_id = @branch_id and building_id = @building_id", new { branch_id = branchId, building_id = buildingId });
            dbConnection.Close();
            return ret;
        }

        public IEnumerable<Class> GetAllActive(int buildingId)
        {
            DbHelper.OpenCon(ref dbConnection);
            var ret = dbConnection.Query<Class>("select * from class where active = true and  building_id = @building_id", new { building_id = buildingId });
            dbConnection.Close();
            return ret;
        }

        public Class FindById(int id)
        {
            DbHelper.OpenCon(ref dbConnection);
            var ret = dbConnection.QueryFirstOrDefault<Class>("select * from class where id = @id;", new { id = id });
            dbConnection.Close();
            return ret;
        }

        public IEnumerable<Class> FindByName(string term,int buildingId)
        {
            DbHelper.OpenCon(ref dbConnection);
            var ret = dbConnection.Query<Class>("select * from class where building_id = @building_id and lower(name) like lower(@term);", new { term = "%" + term + "%" , building_id = buildingId });
            dbConnection.Close();
            return ret;
        }

        public void Dispose()
        {
            dbConnection.Close();
        }
    }
}
