namespace Etterem.Models;

public class Rendeles
{
    public int Id { get; set; }
    public string Dish { get; set; }
    public string Description { get; set; }
    public DateTime OrderTime { get; set; }
    public DateTime UpdateTime { get; set; }
    public int VendegId { get; set; }

    public Rendeles(int id, string dish, string description, DateTime orderTime, DateTime updateTime, int vendegId)
    {
        Id = id;
        Dish = dish;
        Description = description;
        OrderTime = orderTime;
        UpdateTime = updateTime;
        VendegId = vendegId;
    }
}