package beans;

import java.io.*;
import java.util.*;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.commons.io.*;
import org.apache.commons.fileupload.*;
import org.apache.commons.fileupload.disk.*;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
/**
 * Servlet implementation class Save
 */
@WebServlet("/FileUpload")
public class FileUpload extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FileUpload() {
        super();
        // TODO Auto-generated constructor stub
    }

    public String uploadFiles(HttpServletRequest request, HttpServletResponse response,String shopname)throws ServletException ,IOException {
    	String path = null;
    	File userImg = new File(request.getServletContext().getRealPath("/")+"productImages");
		boolean isMultipart = ServletFileUpload.isMultipartContent(request);
		if(isMultipart){
			FileItemFactory factory = new DiskFileItemFactory();
			ServletFileUpload upload = new ServletFileUpload(factory);
			List item = null;
			try {
				item = upload.parseRequest(request);
			}catch (FileUploadException e) {
				e.printStackTrace();
			}
			Iterator itr = item.iterator();
			String itemName ="",roll="",name="",sign="";
			while(itr.hasNext()) {
				FileItem fi = (FileItem) itr.next();
					try {
						if(!userImg.exists()) {
							userImg.mkdir();
						}
						if(!fi.isFormField()) {
							File savedFile=null;
							itemName=fi.getName();
							itemName = name+roll+itemName.substring(itemName.lastIndexOf("."));
							savedFile = new File(userImg+"/"+itemName);
							fi.write(savedFile);
							path = userImg+"/"+itemName;
						}
						
					}catch(Exception e) {
						e.printStackTrace();
					}
				
				
			}
			response.setContentType("text/html");
			response.getWriter().print("Data Submitted Successfully");
			request.getRequestDispatcher("/index.jsp").include(request, response);
		}
    	return path;
    }
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String shopname = request.getParameter("filename");
		response.getWriter().println(shopname);
		String path = uploadFiles(request, response, shopname);
		response.getWriter().println("shopname");
		request.setAttribute("file", path);
	}

}
