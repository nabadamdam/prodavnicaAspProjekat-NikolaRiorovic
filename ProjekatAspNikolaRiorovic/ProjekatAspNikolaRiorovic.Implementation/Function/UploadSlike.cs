using Microsoft.AspNetCore.Http;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;

namespace ProjekatAspNikolaRiorovic.Implementation.Function
{
    public class UploadSlike
    {
        public static string[] Upload(ICollection<IFormFile> slike)
        {
            var brojac = 0;
            foreach(var n in slike)
            {
                brojac++;
            }
            string[] niz = new String[brojac];
            int i = 0;
            foreach(var s in slike)
            {
                
                var guid = Guid.NewGuid();
                var extension = Path.GetExtension(s.FileName);
                var newName = guid + extension;

                var path = Path.Combine("wwwroot", "images", newName);

                using (var fileStream = new FileStream(path, FileMode.Create))
                {
                    s.CopyTo(fileStream);
                }

                niz[i] = newName;
                i++;
            }
            return niz;
        }
    }
}
