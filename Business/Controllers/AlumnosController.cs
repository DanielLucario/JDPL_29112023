using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Data;
using Entities;
using Microsoft.Data.SqlClient;
using static System.Runtime.InteropServices.JavaScript.JSType;

namespace Business.Controllers
{
  [Route("api/[controller]")]
  [ApiController]
  public class AlumnosController : ControllerBase
  {
    private readonly DBContext _context;

    public AlumnosController(DBContext context)
    {
      _context = context;
    }

    // GET: api/Alumnos
    [HttpGet]
    public async Task<ActionResult<IEnumerable<Alumno>>> GetAlumnos()
    {
      return await _context.Alumnos.ToListAsync();
    }

    // GET: api/Alumnos/5
    [HttpGet("{id}")]
    public async Task<ActionResult<Alumno>> GetAlumno(int id)
    {
      var alumno = await _context.Alumnos.FindAsync(id);

      if (alumno == null)
      {
        return NotFound();
      }

      return alumno;
    }

    // PUT: api/Alumnos/5
    // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
    [HttpPut("{id}")]
    public async Task<IActionResult> PutAlumno(int id, Alumno alumno)
    {
      if (id != alumno.IdAlumno)
      {
        return BadRequest();
      }

      _context.Entry(alumno).State = EntityState.Modified;

      try
      {
        await _context.SaveChangesAsync();
      }
      catch (DbUpdateConcurrencyException)
      {
        if (!AlumnoExists(id))
        {
          return NotFound();
        }
        else
        {
          throw;
        }
      }

      return NoContent();
    }

    // POST: api/Alumnos
    // To protect from overposting attacks, see https://go.microsoft.com/fwlink/?linkid=2123754
    [HttpPost]
    public async Task<ActionResult<Alumno>> PostAlumno(Alumno alumno)
    {
      _context.Alumnos.Add(alumno);
      await _context.SaveChangesAsync();

      return CreatedAtAction("GetAlumno", new { id = alumno.IdAlumno }, alumno);
    }

    // DELETE: api/Alumnos/5
    [HttpDelete("{id}")]
    public async Task<IActionResult> DeleteAlumno(int id)
    {
      var alumno = await _context.Alumnos.FindAsync(id);
      if (alumno == null)
      {
        return NotFound();
      }

      _context.Alumnos.Remove(alumno);
      await _context.SaveChangesAsync();

      return NoContent();
    }

    private bool AlumnoExists(int id)
    {
      return _context.Alumnos.Any(e => e.IdAlumno == id);
    }

    [HttpGet]
    [Route("materias/{id}")]
    public List<Materia> ShowMateriasByAlumno(int id)
    {
      var idAlumno = new SqlParameter("@idAlumno", id);
      var materias = _context.Database
                      .SqlQueryRaw<Materia>("mostrarMaterias @idAlumno", idAlumno).ToList();
      return materias;
    }

    [HttpGet]
    [Route("costo/{id}")]
    public ResultDecimal CalculateMateriasTotalCost(int id)
    {
      var idAlumno = new SqlParameter("@idAlumno", id);
      var result = _context.Database
                      .SqlQueryRaw<decimal>("costoMaterias @idAlumno", idAlumno).ToList();
      return new ResultDecimal { result = result[0] };
    }

    [HttpPost]
    [Route("registrarMateria")]
    public ResultBool Login(AlumnoMateria alumnoMateria)
    {
      try
      {
        var idAlumno = new SqlParameter("@idAlumno", alumnoMateria.IdAlumno);
        var idMateria = new SqlParameter("@idMateria", alumnoMateria.IdMateria);

        var result = _context.Database
            .SqlQueryRaw<int>("registrarMateria @idAlumno, @idMateria", idAlumno, idMateria).ToList();
        if (result[0] == 1)
        {
          return new ResultBool { result = true };
        }
      }
      catch (Exception)
      {
        return new ResultBool { result = false };
      }
      return new ResultBool { result = false };
    }
  }
}
