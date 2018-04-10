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
    public class PriorityRepo : IDisposable
    {
        private IDbConnection dbConnection;

        public PriorityRepo(string connectionString)
        {
            Dapper.DefaultTypeMap.MatchNamesWithUnderscores = true;
            dbConnection = new NpgsqlConnection(connectionString);
        }

        public IEnumerable<Priority> GetAll()
        {
            DbHelper.OpenCon(ref dbConnection);
            var ret = dbConnection.Query<Priority>("select * from prioritys");
            dbConnection.Close();
            return ret;
        }

        public IEnumerable<Priority> GetAllActive()
        {
            DbHelper.OpenCon(ref dbConnection);
            var ret = dbConnection.Query<Priority>("select * from prioritys where active = true");
            dbConnection.Close();
            return ret;
        }

        public Priority FindById(int id)
        {
            DbHelper.OpenCon(ref dbConnection);
            var ret = dbConnection.QueryFirstOrDefault<Priority>("select * from prioritys where id = @id;", new { id = id });
            dbConnection.Close();
            return ret;
        }

        public IEnumerable<Priority> FindByName(string term)
        {
            DbHelper.OpenCon(ref dbConnection);
            var ret = dbConnection.Query<Priority>("select * from prioritys where lower(name) like lower(@term);", new { term = "%" + term + "%"  });
            dbConnection.Close();
            return ret;
        }

        public void Dispose()
        {
            dbConnection.Close();
        }
    }
}
