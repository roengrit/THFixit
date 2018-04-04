using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Threading.Tasks;
using Dapper;
using Npgsql;
using THFixit.Repositorys;

namespace THFixit.Models
{
    public class UserRepo
    {
        private readonly IDbConnection dbConnection;

        public RoleRepo RoleRepo { get; set; }

        public UserRepo(string connectionString)
        {
            this.RoleRepo = new RoleRepo(connectionString);
            Dapper.DefaultTypeMap.MatchNamesWithUnderscores = true;
            dbConnection = new NpgsqlConnection(connectionString);
            dbConnection.Open();
        }

        public IEnumerable<User> GetAll()
        {
            return dbConnection.Query<User>("select * from users");
        }

        public User FindById(int id)
        {
            return dbConnection.QueryFirstOrDefault<User>("select * from users where id = @id;",new {id = id });
        }

        public User FindByUser(string username)
        {
            return dbConnection.QueryFirstOrDefault<User>("select * from users where username = @username;", new { username = username });
        }

        public void Dispose()
        {
            dbConnection.Close();
        }        
    }
}
