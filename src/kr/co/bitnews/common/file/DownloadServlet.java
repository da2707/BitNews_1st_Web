// 파일 다운로드 처리 기능
// 파일을 다운로드 가능하고 이미지 파일의 경우 브라우져에 직접 출력도 가능
package kr.co.bitnews.common.file;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/common/file/down")
public class DownloadServlet extends HttpServlet {

	@Override
	public void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		/*
		 *   파일이 있는 경로가 톰켓(웹서버)가 인식 못하는 경로일 경우에는
		 *   직접적인 URL 접근이 불가능함..
		 *   
		 *   해결책으로 자바의 IO를 이용한다.
		 *  
		 *   다운로드 기능을 사용하기 위한 필수 파라미터 정리
		 *   
		 *   - 파일의 경로
		 *   - 파일의 실제 저장된 이름
		 *   - 사용자가 다운로드시 저장될 파일명
		 */
		
		// 파일이 저장되는 베이스 경로
		String serverUpload = "C:\\java-lec\\upload";
		
		// 요청하는 파일이 저장되는 개별적인 경로
		String path = request.getParameter("path");
		
		// 서버에 저장되어 있는 실제 파일명
		String sName = request.getParameter("sName");
		
		File f = new File(serverUpload + path, sName);
		
		// 사용자 컴퓨터에 저장할 파일명(선택사항)
		String dName = request.getParameter("dName");
		// 이미지인 경우 사용자 브라우져로 바로 출력 가능하다.
		if (dName == null) {
			// 헤더값의 설정을 통해서 처리
			response.setHeader("Content-Type", "image/jpg");
		}
		// 파일의 종류에 상관없이 무조건 다운로드
		else {
			// 타입을 잘 모릅니다. 다운로드 하세요..
			response.setHeader("Content-Type", "application/octet-stream");
			// 다운로드 받을 이름을 설정
			// 다운로드시 한글 파일명 처리하기
			dName = new String(dName.getBytes("utf-8"), "8859_1");
			response.setHeader(
					"Content-Disposition", "attachment;filename=" + dName
			);
		}
		
		FileInputStream fis = new FileInputStream(f);
		BufferedInputStream bis = new BufferedInputStream(fis);
		
		OutputStream out = response.getOutputStream();
		BufferedOutputStream bos = new BufferedOutputStream(out);
		
		while (true) {
			int ch = bis.read();
			if (ch == -1) break;
			
			bos.write(ch);
		}
		
		bis.close();  fis.close();  bos.close();  out.close();
	}
	
}








