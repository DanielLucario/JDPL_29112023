﻿using System;
using System.Collections.Generic;

namespace Entities;

public partial class Alumno
{
    public int IdAlumno { get; set; }

    public string Nombre { get; set; }

    public string ApellidoPaterno { get; set; }

    public string? ApellidoMaterno { get; set; }
}
