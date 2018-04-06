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
    public class BuildingRepo : IDisposable
    {
        private IDbConnection dbConnection;

        public BuildingRepo(string connectionString)
        {
            Dapper.DefaultTypeMap.MatchNamesWithUnderscores = true;
            dbConnection = new NpgsqlConnection(connectionString);
        }

        public IEnumerable<Building> GetAll(int branchId)
        {
            DbHelper.OpenCon(ref dbConnection);
            var ret = dbConnection.Query<Building>("select * from buildings where branch_id = @branch_id", new { branch_id = branchId });
            dbConnection.Close();
            return ret;
        }

        public IEnumerable<Building> GetAllActive(int branchId)
        {
            DbHelper.OpenCon(ref dbConnection);
            var ret = dbConnection.Query<Building>("select * from buildings where active = true and branch_id =@branch_id", new { branch_id = branchId });
            dbConnection.Close();
            return ret;
        }

        public Building FindById(int id)
        {
            DbHelper.OpenCon(ref dbConnection);
            var ret = dbConnection.QueryFirstOrDefault<Building>("select * from buildings where id = @id;", new { id = id });
            dbConnection.Close();
            return ret;
        }

        public IEnumerable<Building> FindByName(string term , int branchId)
        {
            DbHelper.OpenCon(ref dbConnection);
            var ret = dbConnection.Query<Building>("select * from buildings where branch_id = @branch_id and lower(name) like lower(@term);", new { term = "%" + term + "%", branch_id = branchId });
            dbConnection.Close();
            return ret;
        }

        public void Dispose()
        {
            dbConnection.Close();
        }
    }
}
