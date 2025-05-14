package com.lumodiem.board.memberboard.controller;

import java.io.File;
import java.io.IOException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.List;
import java.util.UUID;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.json.simple.JSONObject;

import com.lumodiem.board.hostboard.service.HostBoardService;
import com.lumodiem.board.memberboard.service.MemberBoardService;
import com.lumodiem.board.memberboard.vo.Review;
import com.lumodiem.board.memberboard.vo.ReviewAttach;
import com.lumodiem.board.memberboard.vo.ReviewMapping;

@WebServlet("/updateReviewEnd")
public class UpdateReviewEndServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public UpdateReviewEndServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		LocalDateTime ldt = LocalDateTime.now();
		DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
		
		Review review = new Review();
		
		ReviewAttach afterImg = null;
		
		ReviewMapping mapping= new ReviewMapping();
		
		ReviewAttach beforeImg = null;
		review = Review.builder().reviewModDate(ldt.format(dtf)).build();
		
		
		String path ="C:\\dev\\lumodiem\\file\\memberattach";
		File dir = new File(path);
		if(!dir.exists()) {
			dir.mkdirs();
		}
		DiskFileItemFactory factory = new DiskFileItemFactory();
		factory.setRepository(dir);
		factory.setSizeThreshold(1024*1024*10);
		
		ServletFileUpload upload = new ServletFileUpload(factory);
		try {
			List<FileItem> items = upload.parseRequest(request);
			for(int i = 0; i<items.size(); i++) {
				FileItem fileItem = items.get(i);
				if(fileItem.isFormField()) {
					switch(fileItem.getFieldName()) {
					case"review_name":review.setReviewName(fileItem.getString("utf-8")); break;
					case"nickName":review.setAccountNickname(fileItem.getString("utf-8"));break;
					case"review_txt":review.setReviewTxt(fileItem.getString("utf-8"));break;
					case"account_no":review.setAccountNo(Integer.parseInt(fileItem.getString("utf-8")));break;
					case"res_no":review.setResNo(Integer.parseInt(fileItem.getString("utf-8")));break;
					case"review_no":review.setReviewNo(Integer.parseInt(fileItem.getString("UTF-8")));
									beforeImg = new MemberBoardService().selectAttachOneByReviewNo(Integer.parseInt(fileItem.getString("UTF-8")));
									break;
					}
				}else {
					if(fileItem.getSize() > 0) {
						String oriName = fileItem.getName();
						int idx = oriName.lastIndexOf(".");
						String ext = oriName.substring(idx);
						
						String uuid = UUID.randomUUID().toString().replace("-","");
						String newName = uuid+ext;
						
						File uploadFile = new File(dir,newName);
						fileItem.write(uploadFile);
						
						afterImg =new ReviewAttach();
						afterImg = ReviewAttach.builder()
								.attachOri(oriName)
								.attachNew(newName)
								.attachPath(path+"\\"+newName)
								.build();
					}
				}
			}
			// 잘들어갔는지 확인용도
			mapping.setReviewNo(review.getReviewNo());
			int result = 0;
			
			if(beforeImg != null) {
//				// 파일이 원래 있던 것
				if(afterImg == null) {
//					// 새로운 파일이 없음 (있음 -> 없음) / delete하고 insert는 X
					result = new MemberBoardService().updateImgToNoImg(review,beforeImg);	
				}else {
//					// 새로운 파일이 있음 (있음 -> 있음) / delete하고 insert도 O ***성공***
					result = new MemberBoardService().updateImgToImg(review,afterImg,mapping,beforeImg);
				}
			}else {
				// 원래 파일 없던 것
				if(afterImg == null) {
					// 새로운 파일이 없음 ( 없음 -> 없음) / delete 필요 X insert 필요 X 게시글 정보만 update ***성공***
					result = new MemberBoardService().updateNoImgToNoImg(review);
				}else {
					// 새로운 파일이 있음 ( 없음 -> 있음) / delete 필요 x insert만 O ***성공***
					result = new MemberBoardService().updateNoImgToImg(review,afterImg,mapping);
				}
			}
		
		 
		
			JSONObject obj = new JSONObject();
			
			if(result > 0) {
				obj.put("res_code", "200");
				obj.put("res_msg", "정상적으로 게시글이 수정되었습니다.");
				if(beforeImg != null) {
					String deletePath = beforeImg.getAttachPath();
					File deleteFile = new File(deletePath);
					if(deleteFile.exists()) {
						deleteFile.delete();
					}
				}
			}else {
				obj.put("res_code", "500");
				obj.put("res_msg", "게시글 수정중 오류가 발생하였습니다.");
				
			}
			response.setContentType("application/json; charset=UTF-8");
			response.getWriter().print(obj);
		}catch(Exception e) {
			e.printStackTrace();
		}
		
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		doGet(request, response);
	}

}
