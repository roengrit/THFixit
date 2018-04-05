using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Threading.Tasks;

namespace THFixit.Repositorys
{
    public static class DbHelper
    {
        public static void OpenCon(ref IDbConnection dbConnection)
        {
            if (!dbConnection.State.Equals("Open"))
            {
                dbConnection.Open();
            }
        }
    }
}
