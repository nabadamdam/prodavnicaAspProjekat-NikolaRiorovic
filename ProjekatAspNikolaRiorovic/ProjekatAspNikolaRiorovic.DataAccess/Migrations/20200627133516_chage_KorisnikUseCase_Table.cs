using System;
using Microsoft.EntityFrameworkCore.Migrations;

namespace ProjekatAspNikolaRiorovic.EFDataAccess.Migrations
{
    public partial class chage_KorisnikUseCase_Table : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropColumn(
                name: "CreatedAt",
                table: "KorisnikUseCases");

            migrationBuilder.DropColumn(
                name: "DeletedAt",
                table: "KorisnikUseCases");

            migrationBuilder.DropColumn(
                name: "IsActive",
                table: "KorisnikUseCases");

            migrationBuilder.DropColumn(
                name: "IsDeleted",
                table: "KorisnikUseCases");

            migrationBuilder.DropColumn(
                name: "ModifiedAt",
                table: "KorisnikUseCases");
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.AddColumn<DateTime>(
                name: "CreatedAt",
                table: "KorisnikUseCases",
                type: "datetime2",
                nullable: false,
                defaultValue: new DateTime(1, 1, 1, 0, 0, 0, 0, DateTimeKind.Unspecified));

            migrationBuilder.AddColumn<DateTime>(
                name: "DeletedAt",
                table: "KorisnikUseCases",
                type: "datetime2",
                nullable: true);

            migrationBuilder.AddColumn<bool>(
                name: "IsActive",
                table: "KorisnikUseCases",
                type: "bit",
                nullable: false,
                defaultValue: false);

            migrationBuilder.AddColumn<bool>(
                name: "IsDeleted",
                table: "KorisnikUseCases",
                type: "bit",
                nullable: false,
                defaultValue: false);

            migrationBuilder.AddColumn<DateTime>(
                name: "ModifiedAt",
                table: "KorisnikUseCases",
                type: "datetime2",
                nullable: true);
        }
    }
}
