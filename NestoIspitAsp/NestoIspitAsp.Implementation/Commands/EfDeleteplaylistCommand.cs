using NestoIspitAsp.Application.Commands;
using NestoIspitAsp.DataAccess;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace NestoIspitAsp.Implementation.Commands
{
    public class EfDeleteplaylistCommand : IDeletePlaylistCommand
    {
        private readonly ChinookContext context;

        public EfDeleteplaylistCommand(ChinookContext context)
        {
            this.context = context;
        }

        public int Id => 2;

        public string Opis => "Brisanje play liste pomocu Ef-a";

        public void Execute(int request)
        {
            var sadzajPesme = context.PlaylistTrack.Count(x=>x.PlaylistId == request);
            if(sadzajPesme == 0)
            {
                var playlista = context.Playlist.Find(request);
                context.Playlist.Remove(playlista);
                context.SaveChanges();
            }
            else
            {
                throw new ArgumentException("Ne moze da se izbrise ova play lista zato sto u njoj postoje pesme!");
            }
        }
    }
}
