using Data;
using Microsoft.EntityFrameworkCore;

var builder = WebApplication.CreateBuilder(args);

// Add services to the container.

//string connection
string connectionString = builder.Configuration.GetConnectionString("DatabaseStringConnection");
builder.Services.AddDbContext<DBContext>(x => x.UseSqlServer(connectionString));

//cors
var AllowedOrigins = "_AllowedOrigins";
builder.Services.AddCors(options =>
{
  options.AddPolicy(name: AllowedOrigins, builder =>
  {
    builder.WithOrigins("http://localhost:4200").AllowAnyMethod().AllowAnyHeader();
  });
});

builder.Services.AddControllers();
// Learn more about configuring Swagger/OpenAPI at https://aka.ms/aspnetcore/swashbuckle
builder.Services.AddEndpointsApiExplorer();
builder.Services.AddSwaggerGen();
builder.Services.AddScoped<DBContext>();

var app = builder.Build();

// Configure the HTTP request pipeline.
if (app.Environment.IsDevelopment())
{
    app.UseSwagger();
    app.UseSwaggerUI();
}

app.UseCors(AllowedOrigins);
app.UseAuthorization();

app.MapControllers();

app.Run();
