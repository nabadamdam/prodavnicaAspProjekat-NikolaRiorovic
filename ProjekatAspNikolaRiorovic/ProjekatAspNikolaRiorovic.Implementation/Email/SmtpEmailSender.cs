using ProjekatAspNikolaRiorovic.Application.Email;
using System;
using System.Collections.Generic;
using System.Net;
using System.Net.Mail;
using System.Text;

namespace ProjekatAspNikolaRiorovic.Implementation.Email
{
    public class SmtpEmailSender : IEmailSender
    {
        public void Send(EmailDto dto)
        {
            var smtp = new SmtpClient
            {
                Host = "smtp.gmail.com",
                Port = 587,
                EnableSsl = true,
                DeliveryMethod = SmtpDeliveryMethod.Network,
                UseDefaultCredentials = false,
                Credentials = new NetworkCredential("nikola.riorovic1998@gmail.com", "kolonija98")
            };

            var message = new MailMessage("nikola.riorovic1998@gmail.com", dto.PosaljiNaEmail);
            message.Subject = dto.Naslov;
            message.Body = dto.Sadrzaj;
            message.IsBodyHtml = true;
            smtp.Send(message);
        }
    }
}
