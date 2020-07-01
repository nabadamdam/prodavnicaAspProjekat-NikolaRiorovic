using System;
using Microsoft.EntityFrameworkCore.Migrations;

namespace ProjekatAspNikolaRiorovic.EFDataAccess.Migrations
{
    public partial class added_Porudzbine_DetaljiPorudzbine_tables : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.AlterColumn<string>(
                name: "Putanja",
                table: "Slike",
                maxLength: 100,
                nullable: false,
                oldClrType: typeof(string),
                oldType: "nvarchar(max)",
                oldNullable: true);

            migrationBuilder.CreateTable(
                name: "Porudzbine",
                columns: table => new
                {
                    Id = table.Column<int>(nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    CreatedAt = table.Column<DateTime>(nullable: false),
                    IsDeleted = table.Column<bool>(nullable: false),
                    DeletedAt = table.Column<DateTime>(nullable: true),
                    ModifiedAt = table.Column<DateTime>(nullable: true),
                    IsActive = table.Column<bool>(nullable: false),
                    DatumPorudzbine = table.Column<DateTime>(nullable: false),
                    Adresa = table.Column<string>(maxLength: 50, nullable: false),
                    StatusPorudzbine = table.Column<int>(nullable: false, defaultValue: 1),
                    NacinPlacanja = table.Column<int>(nullable: false, defaultValue: 0),
                    IdKorisnik = table.Column<int>(nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Porudzbine", x => x.Id);
                    table.ForeignKey(
                        name: "FK_Porudzbine_Korisnici_IdKorisnik",
                        column: x => x.IdKorisnik,
                        principalTable: "Korisnici",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Restrict);
                });

            migrationBuilder.CreateTable(
                name: "DetaljiPorudzbina",
                columns: table => new
                {
                    Id = table.Column<int>(nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    CreatedAt = table.Column<DateTime>(nullable: false),
                    IsDeleted = table.Column<bool>(nullable: false),
                    DeletedAt = table.Column<DateTime>(nullable: true),
                    ModifiedAt = table.Column<DateTime>(nullable: true),
                    IsActive = table.Column<bool>(nullable: false),
                    NazivProizvoda = table.Column<string>(nullable: true),
                    Kolicina = table.Column<int>(nullable: false),
                    Cena = table.Column<string>(nullable: true),
                    IdPorudzbina = table.Column<int>(nullable: false),
                    IdProizvod = table.Column<int>(nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_DetaljiPorudzbina", x => x.Id);
                    table.ForeignKey(
                        name: "FK_DetaljiPorudzbina_Porudzbine_IdPorudzbina",
                        column: x => x.IdPorudzbina,
                        principalTable: "Porudzbine",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Restrict);
                    table.ForeignKey(
                        name: "FK_DetaljiPorudzbina_Proizvodi_IdProizvod",
                        column: x => x.IdProizvod,
                        principalTable: "Proizvodi",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Restrict);
                });

            migrationBuilder.CreateIndex(
                name: "IX_DetaljiPorudzbina_IdPorudzbina",
                table: "DetaljiPorudzbina",
                column: "IdPorudzbina");

            migrationBuilder.CreateIndex(
                name: "IX_DetaljiPorudzbina_IdProizvod",
                table: "DetaljiPorudzbina",
                column: "IdProizvod");

            migrationBuilder.CreateIndex(
                name: "IX_Porudzbine_IdKorisnik",
                table: "Porudzbine",
                column: "IdKorisnik");
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropTable(
                name: "DetaljiPorudzbina");

            migrationBuilder.DropTable(
                name: "Porudzbine");

            migrationBuilder.AlterColumn<string>(
                name: "Putanja",
                table: "Slike",
                type: "nvarchar(max)",
                nullable: true,
                oldClrType: typeof(string),
                oldMaxLength: 100);
        }
    }
}
