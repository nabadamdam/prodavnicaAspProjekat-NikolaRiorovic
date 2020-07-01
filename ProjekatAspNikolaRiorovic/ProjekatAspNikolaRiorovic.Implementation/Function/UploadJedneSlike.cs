using Microsoft.AspNetCore.Http;
using System;
using System.Collections.Generic;
using System.IO;
using System.Text;

namespace ProjekatAspNikolaRiorovic.Implementation.Function
{
    public class UploadJedneSlike
    {
        public static string UploadJednaSlika(IFormFile slika)
        {
            
            var guid = Guid.NewGuid();
            var extension = Path.GetExtension(slika.FileName);
            var newName = guid + extension;

            var path = Path.Combine("wwwroot", "images", newName);

            using (var fileStream = new FileStream(path, FileMode.Create))
            {
                slika.CopyTo(fileStream);
            }

          
            return newName;
        }
    }
}
