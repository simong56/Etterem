using Etterem.Models;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using MySqlConnector;

namespace Etterem.Controllers
{
    [ApiController]
    [Route("api/[controller]")]
    public class RendelesController : ControllerBase
    {
        public string ConnectionString = "server=localhost;database=etterem;uid=root;password=";

        [HttpGet("GetAllOrders")]
        public object GetAllOrders()
        {
            List<Rendeles> orders = new List<Rendeles>();
            string sql = "SELECT * FROM rendeles";
            var connection = new MySqlConnection(ConnectionString);
            connection.Open();
            var cmd = new MySqlCommand(sql, connection);
            var reader = cmd.ExecuteReader();
            while (reader.Read())
            {
                orders.Add(new Rendeles(reader.GetInt32(0), reader.GetString(1), reader.GetString(2),
                    reader.GetDateTime(3), reader.IsDBNull(4) ? null : reader.GetDateTime(4), reader.GetInt32(5)));
            }

            return orders;
        }

        [HttpGet("GetOrder/{id}")]
        public object GetOrder(int id)
        {
            string sql = "SELECT * FROM rendeles WHERE id = " + id + "";
            var connection = new MySqlConnection(ConnectionString);
            connection.Open();
            var cmd = new MySqlCommand(sql, connection);
            var reader = cmd.ExecuteReader();
            reader.Read();
            return new Rendeles(reader.GetInt32(0), reader.GetString(1), reader.GetString(2), reader.GetDateTime(3),
                reader.IsDBNull(4) ? null : reader.GetDateTime(4), reader.GetInt32(5));
        }
    }
}