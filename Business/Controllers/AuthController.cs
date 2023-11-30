using Data;
using Entities;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Data.SqlClient;
using Microsoft.EntityFrameworkCore;

namespace Business.Controllers
{
  [Route("api/[controller]")]
  [ApiController]
  public class AuthController : ControllerBase
  {
    private readonly DBContext _context;

    public AuthController(DBContext context)
    {
      _context = context;
    }

    [HttpPost]
    [Route("login")]
    public ResultBool Login(LoginCredentials loginCredentials)
    {
      var nombre = new SqlParameter("@nombre", loginCredentials.Nombre);
      var apellidoPaterno = new SqlParameter("@apellidoPaterno", loginCredentials.ApellidoPaterno);

      var result = _context.Database
          .SqlQueryRaw<int>("pseudoLogin @nombre, @apellidoPaterno", nombre, apellidoPaterno).ToList();
      if (result[0] == 1)
      {
        return new ResultBool { result = true };
      }
      return new ResultBool { result = false };
    }
  }
}
