package com.ute.ecwebapp.models;

import com.ute.ecwebapp.beans.User;

import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import java.io.IOException;
import java.net.PasswordAuthentication;
import java.util.Properties;
import java.util.Random;
import javax.mail.Transport;
import javax.mail.Message;
import javax.servlet.ServletException;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import java.io.IOException;
import java.net.PasswordAuthentication;
import java.util.Properties;
import java.util.Random;
import javax.mail.Transport;
import javax.mail.Message;
import javax.servlet.ServletException;
public class SendMail {
    public String getRandom(){
        Random rnd = new Random();
        int number = rnd.nextInt(999999);
        return String.format("%06d",number);
    }
    public boolean Sendmail(String Email, String code) throws ServletException, IOException, MessagingException {
        boolean test =false;

        Properties mailServerProperties;
        Session getMailSession;
        MimeMessage mailMessage;
        // Step1: setup Mail Server
        mailServerProperties = System.getProperties();
        mailServerProperties.put("mail.smtp.port", "587");
        mailServerProperties.put("mail.smtp.auth", "true");
        mailServerProperties.put("mail.smtp.starttls.enable", "true");
        // Step2: get Mail Session
        getMailSession = Session.getDefaultInstance(mailServerProperties, null);
        mailMessage = new MimeMessage(getMailSession);
        mailMessage.addRecipient(Message.RecipientType.TO, new InternetAddress(Email)); //Thay abc bằng địa chỉ người nhận
        // Bạn có thể chọn CC, BCC
//    generateMailMessage.addRecipient(Message.RecipientType.CC, new InternetAddress("cc@gmail.com")); //Địa chỉ cc gmail
        mailMessage.setSubject("Demo send gmail from Java");
        mailMessage.setText(code);
        // Step3: Send mail
        Transport transport = getMailSession.getTransport("smtp");
        // Thay your_gmail thành gmail của bạn, thay your_password thành mật khẩu gmail của bạn
        transport.connect("smtp.gmail.com", "phucngoc0109@gmail.com", "Baophuc123");
        transport.sendMessage(mailMessage, mailMessage.getAllRecipients());
        transport.close();
        test = true;
        return test;
    }
}
