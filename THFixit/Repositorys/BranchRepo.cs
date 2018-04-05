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
    public class BranchRepo : IDisposable
    {
        private IDbConnection dbConnection;

        public BranchRepo(string connectionString)
        {
            Dapper.DefaultTypeMap.MatchNamesWithUnderscores = true;
            dbConnection = new NpgsqlConnection(connectionString);
        }

        public IEnumerable<Branch> GetAll()
        {
            DbHelper.OpenCon(ref dbConnection);
            var ret = dbConnection.Query<Branch>("select * from branchs");
            dbConnection.Close();
            return ret;
        }

        public IEnumerable<Branch> GetAllActive()
        {
            DbHelper.OpenCon(ref dbConnection);
            var ret = dbConnection.Query<Branch>("select * from branchs where active = true");
            dbConnection.Close();
            return ret;
        }

        public Branch FindById(int id)
        {
            DbHelper.OpenCon(ref dbConnection);
            var ret = dbConnection.QueryFirstOrDefault<Branch>("select * from branchs where id = @id;", new { id = id });
            dbConnection.Close();
            return ret;
        }

        public void Dispose()
        {
            dbConnection.Close();
        }
    }
}
