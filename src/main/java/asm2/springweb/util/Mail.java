package asm2.springweb.util;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;

public class Mail {
	@Autowired
    private JavaMailSender javaMailSender;

    public String sendEmail() {
        try {
            SimpleMailMessage message = new SimpleMailMessage();
            message.setFrom("trucnguyen100697@gmail.com");
            message.setTo("duykind2904@gmail.com");
            message.setSubject("Test Email");
            message.setText("This is a test email from Spring MVC.");
            
            javaMailSender.send(message);
            return "Email sent successfully.";
        } catch (Exception ex) {
            return "Error sending email: " + ex.getMessage();
        }
    }
}
