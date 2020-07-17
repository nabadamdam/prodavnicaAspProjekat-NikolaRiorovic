using NestoIspitAsp.Application.Commands;
using NestoIspitAsp.Application.DataTransfer;
using NestoIspitAsp.DataAccess;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace NestoIspitAsp.Implementation.Commands
{
    public class EfInsertTrackCommand : IInsertTrackCommand
    {
        private readonly ChinookContext context;

        public EfInsertTrackCommand(ChinookContext context)
        {
            this.context = context;
        }

        public int Id => 3;

        public string Opis => "Dodavanje pemse pomocu Ef-a";

        public void Execute(TrackDto request)
        {
            var lastId = context.Track.OrderByDescending(x => x.TrackId).FirstOrDefault().TrackId;
            var pesma = new Track
            {
                TrackId = lastId + 1,
                Name = request.Naziv,
                AlbumId = request.AlbumId,
                MediaTypeId = request.MediaTypeId,
                GenreId = request.GenreId,
                Composer = request.Composer,
                Milliseconds = (int)request.Sekunde * 1000,
                Bytes = (int)request.Megabajti * 1024 * 1024,
                UnitPrice = request.Cena

            };

            context.Track.Add(pesma);
            context.SaveChanges();
        }
    }
}
