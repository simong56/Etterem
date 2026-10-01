namespace Etterem.Models;

public class Vendeg
{
    int Id { get; set; }
    string Name { get; set; }
    string Email { get; set; }
    int Age { get; set; }
    string Password { get; set; }
    DateTime RegistrationTime { get; set; }

    public Vendeg(int id, string name, string email, int age, string password, DateTime registrationTime)
    {
        Id = id;
        Name = name;
        Email = email;
        Age = age;
        Password = password;
        RegistrationTime = registrationTime;
    }
}