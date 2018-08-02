package kr.co.bitnews.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

public class LoginCheckFilter implements Filter{

	@Override
	public void doFilter(ServletRequest req, ServletResponse resp, FilterChain chain)
			throws IOException, ServletException {
		HttpServletRequest httpRequest = (HttpServletRequest)req;
				
		HttpSession session = httpRequest.getSession(false);
		
		boolean login = false; //로그인 되어있나 체크 여부 확인 변수.
		if(session != null) {
			if(session.getAttribute("user") != null) {
				login = true;
			}
		}
		if(login) {
			chain.doFilter(req, resp);
		}else {
			RequestDispatcher rd = req.getRequestDispatcher("/login/login");
			rd.forward(req, resp);
		}
		
	}

	@Override
	public void init(FilterConfig arg0) throws ServletException {
		// TODO Auto-generated method stub
		
	}

}
