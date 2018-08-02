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
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import common.db.MyAppSqlConfig;
import kr.co.bitnews.domain.User;
import kr.co.bitnews.mapper.UserMapper;

@WebServlet("/ajax/sendemailfind")
public class SendEmailFind extends HttpServlet {
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
		   message.setSubject("[BitNews] 계정정보 입니다.");
		   
		   UserMapper mapper = MyAppSqlConfig.getSqlSession().getMapper(UserMapper.class);
		   	
		   User info = mapper.selectAcc(to);
		   String id = info.getUserId();
		   String pw = info.getUserPw();
		   String name = info.getUserName();
		   
		   // Text
		   message.setText(name+"님의 ID는 " + id + " PASSWORD는 " + pw + "입니다");

		   

		   // send the message
		   Transport.send(message);
		   System.out.println("message sent successfully...");
		   

		   
		  } catch (MessagingException e) {
		   e.printStackTrace();
		  }
		 }
	}


		
		
		
		
		
		
		
		
		
		
		
		