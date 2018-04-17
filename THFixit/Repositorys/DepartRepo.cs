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
    public class DepartRepo  
    {
        private IDbConnection dbConnection;

        public DepartRepo(string connectionString)
        {
            Dapper.DefaultTypeMap.MatchNamesWithUnderscores = true;
            dbConnection = new NpgsqlConnection(connectionString);
        }

        public IEnumerable<Department> GetAll()
        {
            DbHelper.OpenCon(ref dbConnection);
            var ret = dbConnection.Query<Department>("select * from departments");
            dbConnection.Close();
            return ret;
        }

        public IEnumerable<Department> GetAllActive()
        {
            DbHelper.OpenCon(ref dbConnection);
            var ret = dbConnection.Query<Department>("select * from departments where active = true");
            dbConnection.Close();
            return ret;
        }

        public Department FindById(int id)
        {
            DbHelper.OpenCon(ref dbConnection);
            var ret = dbConnection.QueryFirstOrDefault<Department>("select * from departments where id = @id;", new { id = id });
            dbConnection.Close();
            return ret;
        }

        public IEnumerable<Department> FindByName(string term)
        {
            DbHelper.OpenCon(ref dbConnection);
            var ret = dbConnection.Query<Department>("select * from departments where lower(name) like lower(@term);", new { term = "%" + term + "%" });
            dbConnection.Close();
            return ret;
        } 
    }
}
