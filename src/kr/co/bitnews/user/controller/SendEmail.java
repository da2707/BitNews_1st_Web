package kr.co.bitnews.user.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Properties;
import java.util.Random;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

@WebServlet("/ajax/sendemail")
public class SendEmail extends HttpServlet {
	@Override
	public void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType(
				"text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		  String host     = "smtp.naver.com";
		  final String user   = "bitnewsid";
		  final String password  = "bitnewspw";

		  String to     = request.getParameter("email");
		  

		  
		  // Get the session object
		  Properties props = new Properties();
		  props.put("mail.smtp.host", host);
		  props.put("mail.smtp.auth", "true");

		  Session session = Session.getDefaultInstance(props, new javax.mail.Authenticator() {
		   protected PasswordAuthentication getPasswordAuthentication() {
		    return new PasswordAuthentication(user, password);
		   }
		  });

		  // Compose the message
		  try {
		   MimeMessage message = new MimeMessage(session);
		   message.setFrom(new InternetAddress(user));
		   message.addRecipient(Message.RecipientType.TO, new InternetAddress(to));

		   // Subject
		   message.setSubject("[BitNews] 인증번호 입니다.");
		   
		   Random random = new Random();
	        
		   int result = random.nextInt(10000)+1000;
		    
		   if(result>10000){
		       result = result - 1000;
		   }
		 
		   // Text
		   message.setText("비트뉴스 가입 인증번호는 " +Integer.toString(result)+" 입니다.");

		   

		   // send the message
		   Transport.send(message);
		   System.out.println("message sent successfully...");
		   String json = "{\"msg\": \"인증번호 발송\", \"num\": " + result + "}";
		   
		   System.out.println(new Gson().toJson(json));
		   out.print(json);
		   out.close();
		   
		  } catch (MessagingException e) {
		   e.printStackTrace();
		  }
		 }
	}


		
		
		
		
		
		
		
		
		
		
		
		