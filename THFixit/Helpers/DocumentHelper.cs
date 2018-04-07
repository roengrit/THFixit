using Npgsql;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Threading.Tasks;
using Dapper;
using THFixit.Repositorys;

namespace THFixit.Helpers
{
    public class DocumentHelper
    {
        private IDbConnection dbConnection;

        public DocumentHelper(string connectionString)
        {
            Dapper.DefaultTypeMap.MatchNamesWithUnderscores = true;
            dbConnection = new NpgsqlConnection(connectionString);
        }

        public int GenTicketNo(int branchId,string prefix)
        {
            DbHelper.OpenCon(ref dbConnection);
            var ret = dbConnection.QueryFirstOrDefault<int>(
                "select coalesce(max(no),0) from tickets where branch_id = @branch_id and doc_no like '%" + prefix + "%'  and date_part('month',  created_at) = " + DateTime.Now.Month,
                new { username = branchId });
            dbConnection.Close();
            return ret == 0? 1 : ret+1;
        }
    }
}
