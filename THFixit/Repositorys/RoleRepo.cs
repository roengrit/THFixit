using Npgsql;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Threading.Tasks;
using Dapper;
using THFixit.Models;

namespace THFixit.Repositorys
{
    public class RoleRepo
    {
        private readonly IDbConnection dbConnection;

        public RoleRepo(string connectionString)
        {
            Dapper.DefaultTypeMap.MatchNamesWithUnderscores = true;
            dbConnection = new NpgsqlConnection(connectionString);
            dbConnection.Open();
        }

        public IEnumerable<Role> GetAll()
        {
            return dbConnection.Query<Role>("select * from roles");
        }

        public Role FindById(int id)
        {
            return dbConnection.QueryFirstOrDefault<Role>("select * from roles where id = @id;", new { id = id });
        }

        public IEnumerable<RoleAccess> FindAcessAllByRoleId(int id)
        {
            return dbConnection.Query<RoleAccess>("select * from role_access where role_id = @id;", new { id = id });
        }

        public void Dispose()
        {
            dbConnection.Close();
        }
    }
}
