using Etterem.Models.Dto;
using Microsoft.AspNetCore.Mvc;
using MySqlConnector;
using Mysqlx.Crud;

namespace Etterem.Controllers
{
    [ApiController]
    [Route("api/[controller]")]
    public class VendegController : ControllerBase
    {
        public string ConnectionString = "server=localhost;database=etterem;uid=root;password=";

        [HttpGet("GetGuestNameEmail/{id}")]
        public object GetGuestNameEmail(int id)
        {
            string sql = "SELECT name, email FROM vendeg WHERE id = " + id;
            using var connection = new MySqlConnection(ConnectionString);
            connection.Open();
            using var cmd = new MySqlCommand(sql, connection);
            using var reader = cmd.ExecuteReader();
            if (!reader.Read())
            {
                return "not found";
            }
            return new {name = reader.GetString(0), email = reader.GetString(1)};
        }

        [HttpGet("GetGuestOrders/{id}")]
        public object GetGuestOrders(int id)
        {
            string sql = "SELECT dish, description FROM rendeles WHERE vendegId = " + id;
            List<GetGuestOrdersDto> orders = new List<GetGuestOrdersDto>();
            using var connection = new MySqlConnection(ConnectionString);
            connection.Open();
            using var cmd = new MySqlCommand(sql, connection);
            using var reader = cmd.ExecuteReader();
            while (reader.Read())
            {
                orders.Add(new GetGuestOrdersDto
                {
                    Dish = reader.GetString(0),
                    Description = reader.GetString(1)
                });
            }
            return orders;
        }
        
        [HttpGet("GetOrderCountOfGuest/{id}")]
        public object GetOrderCountOfGuest(int id)
        {
            string sql = "SELECT COUNT(*) FROM rendeles WHERE vendegId = " + id;
            using var connection = new MySqlConnection(ConnectionString);
            connection.Open();
            using var cmd = new MySqlCommand(sql, connection);
            using var reader = cmd.ExecuteReader();
            reader.Read();
            return reader.GetInt32(0);
        }
    }
}
