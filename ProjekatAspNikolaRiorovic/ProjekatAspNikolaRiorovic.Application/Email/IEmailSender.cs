using System;
using System.Collections.Generic;
using System.Text;

namespace ProjekatAspNikolaRiorovic.Application.Email
{
    public interface IEmailSender
    {
        void Send(EmailDto dto);
    }
    public class EmailDto
    {
        public string Sadrzaj { get; set; }
        public string Naslov { get; set; }
        public string PosaljiNaEmail { get; set; }
    }
}
