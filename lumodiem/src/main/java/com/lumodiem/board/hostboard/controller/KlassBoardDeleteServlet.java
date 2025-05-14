package com.lumodiem.board.hostboard.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import com.lumodiem.board.hostboard.service.HostBoardService;
import com.lumodiem.board.hostboard.vo.Klass;

@WebServlet("/klassBoardDelete")
public class KlassBoardDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public KlassBoardDeleteServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int klassNo = Integer.parseInt(request.getParameter("klass_no"));
		
		String attachTemp = request.getParameter("attach_no");
		int attachNo = 0;
		if(attachTemp != null) attachNo = Integer.parseInt(attachTemp);
		
		int result = 0;
		
		if(attachNo > 0) {
			result = new HostBoardService().deleteKlassAndAttach(klassNo,attachNo);
		}else {
			result = new HostBoardService().deleteKlassOne(klassNo);
		}
		
		
		JSONObject obj = new JSONObject();
		obj.put("res_code", "500");
		obj.put("res_msg", "게시글 삭제중 오류가 발생하였습니다.");
		
		if(result>0) {
			obj.put("res_code", "200");
			obj.put("res_msg","정상적으로 게시글이 삭제되었습니다.");
		}
		response.setContentType("application/json; charset=UTF-8");
		response.getWriter().print(obj);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
