namespace Etterem.Models.Dto;

public class EditOrderDto
{
    public string? Dish { get; set; }
    public string? Description { get; set; }
    public DateTime? OrderTime { get; set; }
    public int? VendegId { get; set; }
}
