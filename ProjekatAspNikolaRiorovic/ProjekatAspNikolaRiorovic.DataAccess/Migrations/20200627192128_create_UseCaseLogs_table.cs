using System;
using Microsoft.EntityFrameworkCore.Migrations;

namespace ProjekatAspNikolaRiorovic.EFDataAccess.Migrations
{
    public partial class create_UseCaseLogs_table : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.CreateTable(
                name: "UseCaseLogs",
                columns: table => new
                {
                    Id = table.Column<int>(nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    NazivUseCase = table.Column<string>(nullable: true),
                    Datum = table.Column<DateTime>(nullable: false),
                    Podaci = table.Column<string>(nullable: true),
                    Actor = table.Column<string>(nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_UseCaseLogs", x => x.Id);
                });
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropTable(
                name: "UseCaseLogs");
        }
    }
}
