package kr.co.bitnews.usedboard.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Enumeration;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;

import common.db.MyAppSqlConfig;
import kr.co.bitnews.common.file.MlecFileRenamePolicy;
import kr.co.bitnews.domain.Board;
import kr.co.bitnews.domain.BoardFile;
import kr.co.bitnews.mapper.UsedBoardMapper;

@WebServlet("/usedBoard/write")
public class WriteBoardController extends HttpServlet {

	@Override
	public void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		UsedBoardMapper mapper = MyAppSqlConfig.getSqlSession().getMapper(UsedBoardMapper.class);
		
		String uploadPath = "c:/java-lec/upload";
		SimpleDateFormat sdf = new SimpleDateFormat("/yyyy/MM/dd/HH");
		String datePath = sdf.format(new Date());
		File file = new File(uploadPath + datePath);
		if (!file.exists()) file.mkdirs();
		
		MultipartRequest mRequest = new MultipartRequest(
				request,  
				uploadPath + datePath,
				1024 * 1024 * 100, 
				"utf-8",  
				new MlecFileRenamePolicy() 
		);
		
		// 게시물 등록
		Board board = new Board();
		board.setUserId(mRequest.getParameter("userId"));
		board.setTitle(mRequest.getParameter("title"));
		board.setContent(mRequest.getParameter("content"));
		board.setHead(mRequest.getParameter("head"));
		mapper.insertBoard(board);
		
		// 파일 저장..
		Enumeration<String> names = mRequest.getFileNames();
		while (names.hasMoreElements()) {
			String name = names.nextElement();
			File f = mRequest.getFile(name);
			if (f != null) {
				String oriName = mRequest.getOriginalFileName(name);
				String systemName = mRequest.getFilesystemName(name);
				long fileSize = f.length();
				
				// 데이터베이스에 파일 정보 저장
				BoardFile bf = new BoardFile();
				bf.setNo(board.getNo());
				bf.setFilePath(datePath);
				bf.setOriName(oriName);
				bf.setSystemName(systemName);
				bf.setFileSize(fileSize);
				mapper.insertBoardFile(bf);
			}
		}
		
		response.sendRedirect("list");
	}
}








