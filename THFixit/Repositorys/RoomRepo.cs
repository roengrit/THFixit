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
    public class RoomRepo : IDisposable
    {
        private IDbConnection dbConnection;

        public RoomRepo(string connectionString)
        {
            Dapper.DefaultTypeMap.MatchNamesWithUnderscores = true;
            dbConnection = new NpgsqlConnection(connectionString);
        }

        public IEnumerable<Room> GetAll(int branchId, int buildingId, int classId)
        {
            DbHelper.OpenCon(ref dbConnection);
            var ret = dbConnection.Query<Room>("select * from rooms where branch_id = @branch_id and building_id = @building_id and class_id = @class_id", new { branch_id = branchId, building_id = buildingId, class_id = classId });
            dbConnection.Close();
            return ret;
        }

        public IEnumerable<Room> GetAllActive(int classId)
        {
            DbHelper.OpenCon(ref dbConnection);
            var ret = dbConnection.Query<Room>("select * from rooms where active = true and class_id = @class_id", new { class_id = classId });
            dbConnection.Close();
            return ret;
        }

        public IEnumerable<Room> GetAllActive(int branchId, int buildingId, int classId)
        {
            DbHelper.OpenCon(ref dbConnection);
            var ret = dbConnection.Query<Room>("select * from rooms where active = true and branch_id = @branch_id and building_id = @building_id and class_id = @class_id", new { branch_id = branchId, building_id = buildingId, class_id = classId });
            dbConnection.Close();
            return ret;
        }

        public Room FindById(int id)
        {
            DbHelper.OpenCon(ref dbConnection);
            var ret = dbConnection.QueryFirstOrDefault<Room>("select * from rooms where id = @id;", new { id = id });
            dbConnection.Close();
            return ret;
        }

        public void Dispose()
        {
            dbConnection.Close();
        }
    }
}
