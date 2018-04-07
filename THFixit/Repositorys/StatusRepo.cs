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
    public class StatusRepo : IDisposable
    {
        private IDbConnection dbConnection;

        public StatusRepo(string connectionString)
        {
            Dapper.DefaultTypeMap.MatchNamesWithUnderscores = true;
            dbConnection = new NpgsqlConnection(connectionString);
        }

        public IEnumerable<Status> GetAll()
        {
            DbHelper.OpenCon(ref dbConnection);
            var ret = dbConnection.Query<Status>("select * from status" );
            dbConnection.Close();
            return ret;
        }

        public IEnumerable<Status> GetAllActive()
        {
            DbHelper.OpenCon(ref dbConnection);
            var ret = dbConnection.Query<Status>("select * from status where active = true");
            dbConnection.Close();
            return ret;
        }

        public Status FindById(int id)
        {
            DbHelper.OpenCon(ref dbConnection);
            var ret = dbConnection.QueryFirstOrDefault<Status>("select * from status where id = @id;", new { id = id });
            dbConnection.Close();
            return ret;
        }

        public IEnumerable<Status> FindByName(string term)
        {
            DbHelper.OpenCon(ref dbConnection);
            var ret = dbConnection.Query<Status>("select * from status where lower(name) like lower(@term);", new { term = "%" + term + "%" });
            dbConnection.Close();
            return ret;
        }

        public void Dispose()
        {
            dbConnection.Close();
        }
    }
}
