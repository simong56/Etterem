using Etterem.Models;
using Etterem.Models.Dto;
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
            using var connection = new MySqlConnection(ConnectionString);
            connection.Open();
            using var cmd = new MySqlCommand(sql, connection);
            using var reader = cmd.ExecuteReader();
            while (reader.Read())
            {
                orders.Add(new Rendeles(reader.GetInt32(0), reader.GetString(1), reader.GetString(2),
                    reader.GetDateTime(3), reader.GetDateTime(4), reader.GetInt32(5)));
            }

            return orders;
        }

        [HttpGet("GetOrder/{id}")]
        public object GetOrder(int id)
        {
            string sql = "SELECT * FROM rendeles WHERE id = " + id + "";
            using var connection = new MySqlConnection(ConnectionString);
            connection.Open();
            using var cmd = new MySqlCommand(sql, connection);
            using var reader = cmd.ExecuteReader();
            reader.Read();
            return new Rendeles(reader.GetInt32(0), reader.GetString(1), reader.GetString(2), reader.GetDateTime(3),
                reader.GetDateTime(4), reader.GetInt32(5));
        }
        
        [HttpPost("AddOrder")]
        public object AddOrder(AddNewOrderDto order)
        {
            string sql = "INSERT INTO rendeles (dish, description, vendegId) VALUES (@dish, @description, @vendegId)";            
            using var connection = new MySqlConnection(ConnectionString);
            connection.Open();
            using var cmd = new MySqlCommand(sql, connection);
            cmd.Parameters.AddWithValue("@dish", order.Dish);
            cmd.Parameters.AddWithValue("@description", order.Description);
            cmd.Parameters.AddWithValue("@vendegId", order.VendegId);
            cmd.ExecuteNonQuery();
            return order;
        }

        [HttpPatch("EditOrder/{idToEdit}")]
        public object EditOrder(int idToEdit, [FromBody] EditOrderDto order)
        {
            string sql = """
                UPDATE rendeles
                SET dish = COALESCE(@dish, dish),
                    description = COALESCE(@description, description),
                    orderTime = COALESCE(@orderTime, orderTime),
                    updateTime = CURRENT_TIMESTAMP,
                    vendegId = COALESCE(@vendegId, vendegId)
                WHERE id = @id
                """;
            using var connection = new MySqlConnection(ConnectionString);
            connection.Open();
            using var cmd = new MySqlCommand(sql, connection);
            cmd.Parameters.AddWithValue("@id", idToEdit);
            cmd.Parameters.AddWithValue("@dish", (object?)order.Dish ?? DBNull.Value);
            cmd.Parameters.AddWithValue("@description", (object?)order.Description ?? DBNull.Value);
            cmd.Parameters.AddWithValue("@orderTime", (object?)order.OrderTime ?? DBNull.Value);
            cmd.Parameters.AddWithValue("@vendegId", (object?)order.VendegId ?? DBNull.Value);
            cmd.ExecuteNonQuery();
            return order;
        }

        [HttpDelete("DeleteOrder/{id}")]
        public object DeleteOrder(int id)
        {
            string sql = "DELETE FROM rendeles WHERE id = " + id;
            using var connection = new MySqlConnection(ConnectionString);
            connection.Open();
            using var cmd = new MySqlCommand(sql, connection);
            if (cmd.ExecuteNonQuery() > 0)
            {
                return "success";
            }
            return "error";
        }

        [HttpGet("GetTotalOrderCount")]
        public object GetTotalOrderCount()
        {
            string sql = "SELECT COUNT(*) FROM rendeles";
            using var connection = new MySqlConnection(ConnectionString);
            connection.Open();
            using var cmd = new MySqlCommand(sql, connection);
            using var reader = cmd.ExecuteReader();
            reader.Read();
            return reader.GetInt32(0);
        }
    }
}
