USE [master]
GO
/****** Object:  Database [ControlEscolar]    Script Date: 30/11/2023 10:53:48 ******/
CREATE DATABASE [ControlEscolar]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ControlEscolar', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\ControlEscolar.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'ControlEscolar_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\ControlEscolar_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [ControlEscolar] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ControlEscolar].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ControlEscolar] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ControlEscolar] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ControlEscolar] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ControlEscolar] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ControlEscolar] SET ARITHABORT OFF 
GO
ALTER DATABASE [ControlEscolar] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [ControlEscolar] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ControlEscolar] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ControlEscolar] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ControlEscolar] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ControlEscolar] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ControlEscolar] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ControlEscolar] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ControlEscolar] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ControlEscolar] SET  ENABLE_BROKER 
GO
ALTER DATABASE [ControlEscolar] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ControlEscolar] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ControlEscolar] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ControlEscolar] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ControlEscolar] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ControlEscolar] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ControlEscolar] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ControlEscolar] SET RECOVERY FULL 
GO
ALTER DATABASE [ControlEscolar] SET  MULTI_USER 
GO
ALTER DATABASE [ControlEscolar] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ControlEscolar] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ControlEscolar] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ControlEscolar] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [ControlEscolar] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [ControlEscolar] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'ControlEscolar', N'ON'
GO
ALTER DATABASE [ControlEscolar] SET QUERY_STORE = ON
GO
ALTER DATABASE [ControlEscolar] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [ControlEscolar]
GO
/****** Object:  Table [dbo].[AlumnoMaterias]    Script Date: 30/11/2023 10:53:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AlumnoMaterias](
	[idAlumnoMaterias] [int] IDENTITY(1,1) NOT NULL,
	[idAlumno] [int] NULL,
	[idMateria] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[idAlumnoMaterias] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Alumnos]    Script Date: 30/11/2023 10:53:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Alumnos](
	[idAlumno] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](50) NULL,
	[apellidoPaterno] [varchar](50) NULL,
	[apellidoMaterno] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[idAlumno] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AlumnosBaja]    Script Date: 30/11/2023 10:53:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AlumnosBaja](
	[idAlumno] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](50) NULL,
	[apellidoPaterno] [varchar](50) NULL,
	[apellidoMaterno] [varchar](50) NULL,
	[fechaBaja] [datetime] NULL,
 CONSTRAINT [PK__AlumnosB__43FBBAC7DFD2084C] PRIMARY KEY CLUSTERED 
(
	[idAlumno] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Materias]    Script Date: 30/11/2023 10:53:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Materias](
	[idMateria] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](50) NULL,
	[costo] [decimal](9, 2) NULL,
PRIMARY KEY CLUSTERED 
(
	[idMateria] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[AlumnoMaterias]  WITH CHECK ADD FOREIGN KEY([idAlumno])
REFERENCES [dbo].[Alumnos] ([idAlumno])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AlumnoMaterias]  WITH CHECK ADD FOREIGN KEY([idMateria])
REFERENCES [dbo].[Materias] ([idMateria])
ON DELETE CASCADE
GO
/****** Object:  StoredProcedure [dbo].[alta]    Script Date: 30/11/2023 10:53:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create   proc [dbo].[alta]
@nombre varchar(50),
@apellidoPaterno varchar(50),
@apellidoMaterno varchar(50)
as
begin
insert into Alumnos(nombre, apellidoPaterno, apellidoMaterno) values(@nombre, @apellidoPaterno, @apellidoMaterno)
end
GO
/****** Object:  StoredProcedure [dbo].[baja]    Script Date: 30/11/2023 10:53:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create   proc [dbo].[baja]
@idAlumno int
as
begin
	delete from Alumnos where idAlumno = @idAlumno
end
GO
/****** Object:  StoredProcedure [dbo].[costoMaterias]    Script Date: 30/11/2023 10:53:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create   proc [dbo].[costoMaterias]
@idAlumno int
as
begin
	select 
	sum(mat.costo) as [total]
	from Alumnos alu
	join AlumnoMaterias ama on alu.idAlumno = ama.idAlumno
	join Materias mat on mat.idMateria = ama.idMateria
	where alu.idAlumno = @idAlumno
end
GO
/****** Object:  StoredProcedure [dbo].[mostrarMaterias]    Script Date: 30/11/2023 10:53:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create   proc [dbo].[mostrarMaterias]
@idAlumno int
as
begin
	select 
	mat.*
	from Alumnos alu
	join AlumnoMaterias ama on alu.idAlumno = ama.idAlumno
	join Materias mat on mat.idMateria = ama.idMateria
	where alu.idAlumno = @idAlumno
end
GO
/****** Object:  StoredProcedure [dbo].[pseudoLogin]    Script Date: 30/11/2023 10:53:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create   proc [dbo].[pseudoLogin]
@nombre varchar(50),
@apellidoPaterno varchar(50)
as
begin
	select count(idAlumno) as [Registros] from Alumnos where nombre = @nombre and apellidoPaterno = @apellidoPaterno
end
GO
/****** Object:  StoredProcedure [dbo].[registrarMateria]    Script Date: 30/11/2023 10:53:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create   proc [dbo].[registrarMateria]
@idAlumno int,
@idMateria int
as
begin
	declare @yaEstaRegistrado int = (
		select count(idAlumnoMaterias) 
		from AlumnoMaterias 
		where idAlumno = @idAlumno and idMateria = @idMateria
	)
	if @yaEstaRegistrado = 0
	begin
		insert into AlumnoMaterias values (@idAlumno, @idMateria)
		select 1
	end
	else
	begin
		select 0
	end
end
GO
USE [master]
GO
ALTER DATABASE [ControlEscolar] SET  READ_WRITE 
GO
