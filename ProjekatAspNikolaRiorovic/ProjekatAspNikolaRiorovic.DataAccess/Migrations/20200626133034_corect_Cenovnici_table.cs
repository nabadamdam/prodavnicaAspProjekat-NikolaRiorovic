using Microsoft.EntityFrameworkCore.Migrations;

namespace ProjekatAspNikolaRiorovic.EFDataAccess.Migrations
{
    public partial class corect_Cenovnici_table : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropColumn(
                name: "CenaProzivod",
                table: "Cenovnici");

            migrationBuilder.AlterColumn<decimal>(
                name: "Cena",
                table: "DetaljiPorudzbina",
                nullable: false,
                oldClrType: typeof(string),
                oldType: "nvarchar(max)",
                oldNullable: true);

            migrationBuilder.AddColumn<decimal>(
                name: "CenaProizvod",
                table: "Cenovnici",
                nullable: false,
                defaultValue: 0m);
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropColumn(
                name: "CenaProizvod",
                table: "Cenovnici");

            migrationBuilder.AlterColumn<string>(
                name: "Cena",
                table: "DetaljiPorudzbina",
                type: "nvarchar(max)",
                nullable: true,
                oldClrType: typeof(decimal));

            migrationBuilder.AddColumn<decimal>(
                name: "CenaProzivod",
                table: "Cenovnici",
                type: "decimal(18,2)",
                nullable: false,
                defaultValue: 0m);
        }
    }
}
