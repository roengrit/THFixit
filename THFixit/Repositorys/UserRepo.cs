﻿using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Threading.Tasks;
using Dapper;
using Npgsql;
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
                                                     class_id = @class_id
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
                                                 });
                dbConnection.Close();
                return new Ret { Ok = true , Messsage = "Success" };
            }
            catch (Exception ex)
            {
                return new Ret { Ok = false, Messsage = ex.Message };
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
                return new Ret { Ok = true, Messsage = "Success" };
            }
            catch (Exception ex)
            {
                return new Ret { Ok = false, Messsage = ex.Message };
            }
        }

        public void Dispose()
        {
            dbConnection.Close();
        }
    }
}
