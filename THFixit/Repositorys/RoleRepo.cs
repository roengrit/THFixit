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
        private IDbConnection dbConnection;

        public RoleRepo(string connectionString)
        {
            Dapper.DefaultTypeMap.MatchNamesWithUnderscores = true;
            dbConnection = new NpgsqlConnection(connectionString);
        }

        public IEnumerable<Role> GetAll()
        {
            DbHelper.OpenCon(ref dbConnection);
            var ret = dbConnection.Query<Role>("select * from roles");
            dbConnection.Close();
            return ret;
        }

        public Role FindById(int id)
        {
            DbHelper.OpenCon(ref dbConnection);
            var ret = dbConnection.QueryFirstOrDefault<Role>("select * from roles where id = @id;", new { id = id });
            dbConnection.Close();
            return ret;
        }

        public IEnumerable<RoleAccess> FindAcessAllByRoleId(int id)
        {
            DbHelper.OpenCon(ref dbConnection);
            var ret = dbConnection.Query<RoleAccess>("select * from role_access where role_id = @id;", new { id = id });
            dbConnection.Close();
            return ret;
        } 
    }
}
