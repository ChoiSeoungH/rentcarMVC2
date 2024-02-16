package com.basic.rentcar.controller.rentcar;

import com.basic.rentcar.util.FileUtil;
import jakarta.servlet.ServletContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/uploadCarImg.do")
@MultipartConfig(
    maxFileSize = 1024 * 1024 * 1,  //1MB
    maxRequestSize = 1024 * 1024 * 10  //10MB
)
public class UploadCarImgController extends HttpServlet {
  private static final long serialVersionUID = 1L;

  @Override
  protected void doPost(HttpServletRequest request, HttpServletResponse response)
      throws ServletException, IOException {
    boolean check = true;
    try {

      ServletContext context = request.getServletContext();
      String saveDirectory = context.getRealPath("/img");
      System.out.println("saveDirectory=" + saveDirectory);

      String originalFileName = FileUtil.uploadFile(request, saveDirectory);
      String savedFileName = FileUtil.renameFile(saveDirectory, originalFileName);
      response.getWriter().print(check);
    }
    catch (Exception e) {
      check = !check;
      e.printStackTrace();
      request.setAttribute("errorMessage", "파일 업로드 오류");
    }
  }
}
