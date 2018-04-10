using Npgsql;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Threading.Tasks;
using THFixit.Models;
using Dapper;
using THFixit.Models.Model;

namespace THFixit.Repositorys
{
    public class TicketRepo
    {
        private IDbConnection dbConnection;

        public TicketRepo(string connectionString)
        {
            Dapper.DefaultTypeMap.MatchNamesWithUnderscores = true;
            dbConnection = new NpgsqlConnection(connectionString);
        }

        public Ticket FindByDocNo(string docNo)
        {
            DbHelper.OpenCon(ref dbConnection);
            var ret = dbConnection.QueryFirstOrDefault<Ticket>("select *,(select name from users where id = requestor_id) as requestor_name from tickets where doc_no = @doc_no;", new { doc_no = docNo });
            dbConnection.Close();
            return ret;
        }

        public Ticket FindById(int Id)
        {
            DbHelper.OpenCon(ref dbConnection);
            var ret = dbConnection.QueryFirstOrDefault<Ticket>("select *,(select name from users where id = requestor_id) as requestor_name from tickets where id = @id;", new { id = Id });
            dbConnection.Close();
            return ret;
        }

        public Ret Create(Ticket Ticket)
        {
            DbHelper.OpenCon(ref dbConnection);
            try
            {
                var ret = dbConnection.Execute(
                    @"insert into tickets(no,doc_no,title,description,branch_id,depart_id,building_id,room_id,class_id,priority_id,status_id,contact,requestor_id,creator_id,created_at)
                                   values(@no,@doc_no,@title,@description,@branch_id,@depart_id,@building_id,@room_id,@class_id,@priority_id,@status_id,@contact,@requestor_id,@creator_id,current_timestamp);
                    ",
                                                 new
                                                 {
                                                     no = Ticket.No,
                                                     no_ref = Ticket.NoRef,
                                                     doc_no = Ticket.DocNo ,
                                                     title = Ticket.Title,
                                                     depart_id = Ticket.DepartId,
                                                     description = Ticket.Description,
                                                     branch_id = Ticket.BranchId,
                                                     building_id = Ticket.BuildingId,
                                                     room_id = Ticket.RoomId,
                                                     class_id = Ticket.ClassId,
                                                     priority_id = Ticket.PriorityId,
                                                     status_id = Ticket.StatusId,
                                                     contact = Ticket.Contact,
                                                     requestor_id = Ticket.RequestorId,
                                                     creator_id = Ticket.CreatorId
                                                 });
                dbConnection.Close();
                return new Ret { Ok = true, Message = "Success" , Id = ret};
            }
            catch (Exception ex)
            {
                dbConnection.Close();
                return new Ret { Ok = false, Message = ex.Message };
            }
        }
    }
}
