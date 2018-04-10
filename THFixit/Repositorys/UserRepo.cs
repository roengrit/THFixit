using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Threading.Tasks;
using Dapper;
using Npgsql;
using THFixit.Models.Model;
using THFixit.Repositorys;

namespace THFixit.Models
{
    public class UserRepo : IDisposable
    {
        private IDbConnection dbConnection;

        public RoleRepo RoleRepo { get; set; }

        public UserRepo(string connectionString)
        {
            this.RoleRepo = new RoleRepo(connectionString);
            Dapper.DefaultTypeMap.MatchNamesWithUnderscores = true;
            dbConnection = new NpgsqlConnection(connectionString);
        }

        public IEnumerable<User> GetAll()
        {
            DbHelper.OpenCon(ref dbConnection);
            var ret = dbConnection.Query<User>("select * from users");
            dbConnection.Close();
            return ret;
        }

        public IEnumerable<Branch> GetUserBranch(int Id)
        {
            DbHelper.OpenCon(ref dbConnection);
            var ret = dbConnection.Query<Branch>("select branch_id as id , (select name from branchs where id = branch_id) as name  from user_branchs where user_id = @user_id",new { user_id = Id });
            dbConnection.Close();
            return ret;
        }

        public User FindById(int id)
        {
            DbHelper.OpenCon(ref dbConnection);
            var ret = dbConnection.QueryFirstOrDefault<User>("select * from users where id = @id;", new { id = id });
            dbConnection.Close();
            return ret;
        }

        public User FindByUser(string username)
        {
            DbHelper.OpenCon(ref dbConnection);
            var ret = dbConnection.QueryFirstOrDefault<User>("select * from users where username = @username;", new { username = username });
            dbConnection.Close();
            return ret;
        }

        public IEnumerable<User> FindByName(string term)
        {
            DbHelper.OpenCon(ref dbConnection);
            var ret = dbConnection.Query<User>("select * from users where lower(name) like lower(@term);", new { term = "%"+term+"%" });
            dbConnection.Close();
            return ret;
        }

        public bool UpdateAvatar(User user)
        {
            try
            {
                DbHelper.OpenCon(ref dbConnection);
                var ret = dbConnection.Execute("update users set image_avatar = @image_avatar where id = @id;", new { id = user.Id, image_avatar = user.ImageAvatar });
                dbConnection.Close();
                return true;
            }
            catch (Exception)
            {
                return false;
            }
        }

        public Ret UpdateProfile(User user)
        {
            try
            {
                DbHelper.OpenCon(ref dbConnection);
                var ret = dbConnection.Execute(@"update users 
                                                 set name = @name, 
                                                     tel = @tel, 
                                                     email = @email, 
                                                     building_id = @building_id, 
                                                     room_id = @room_id, 
                                                     class_id = @class_id,
                                                     contact = @contact
                                                 where id = @id;",
                                                 new
                                                 {
                                                     id = user.Id,
                                                     name = user.Name,
                                                     tel = user.Tel,
                                                     email = user.Email,
                                                     building_id = user.BuildingId,
                                                     room_id = user.RoomId,
                                                     class_id = user.ClassId,
                                                     contact = user.Contact
                                                 });
                dbConnection.Close();
                return new Ret { Ok = true , Message = "Success" };
            }
            catch (Exception ex)
            {
                return new Ret { Ok = false, Message = ex.Message };
            }
        }

        public Ret ChangePassword(User user)
        {
            try
            {
                DbHelper.OpenCon(ref dbConnection);
                var ret = dbConnection.Execute(@"update users 
                                                 set password = @password
                                                 where id = @id;",
                                                 new
                                                 {
                                                     id = user.Id,
                                                     password = user.Password
                                                 });
                dbConnection.Close();
                return new Ret { Ok = true, Message = "Success" };
            }
            catch (Exception ex)
            {
                return new Ret { Ok = false, Message = ex.Message };
            }
        }

        public void Dispose()
        {
            dbConnection.Close();
        }
    }
}
