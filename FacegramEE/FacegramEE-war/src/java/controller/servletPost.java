/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import com.dropbox.core.DbxRequestConfig;
import com.dropbox.core.v2.DbxClientV2;
import com.dropbox.core.v2.files.FileMetadata;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

/**
 *
 * @author asafe
 */
@WebServlet(name = "ServletPost", urlPatterns = {"/servletPost"})
public class servletPost extends HttpServlet {
private static final String SUCCESS = "/publicaciones.jsp";

    public final String UPLOAD_DIRECTORY = "upload";
    public final String DEFAULT_FILENAME = "default.file";

    public final int MEMORY_THRESHOLD = 1024 * 1024 * 3;
    public final int MAX_FILE_SIZE = 1024 * 1024 * 40;
    public final int MAX_REQUEST_SIZE = 1024 * 1024 * 50;

    private final String ACCESS_TOKEN = "cN9oYLEd0GAAAAAAAAAAnxPU7levQaOwyolksXJmLBY7twXFko7oUAuEnv0-rebn";

    DbxClientV2 client = null;

    @Override
    public void init() throws ServletException {
        super.init();
        // Create Dropbox client
        DbxRequestConfig config = DbxRequestConfig.newBuilder("dropbox/UploadImage").build();
        client = new DbxClientV2(config, ACCESS_TOKEN);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        if (ServletFileUpload.isMultipartContent(request)) {

            DiskFileItemFactory factory = new DiskFileItemFactory();
            factory.setSizeThreshold(MEMORY_THRESHOLD);
            factory.setRepository(new File(System.getProperty("java.io.tmpdir")));

            ServletFileUpload upload = new ServletFileUpload(factory);
            upload.setFileSizeMax(MAX_FILE_SIZE);
            upload.setSizeMax(MAX_REQUEST_SIZE);
            String uploadPath = getServletContext().getRealPath("") + File.separator + UPLOAD_DIRECTORY;
            File uploadDir = new File(uploadPath);
            if (!uploadDir.exists()) {
                uploadDir.mkdir();
            }

            try {
                DbxRequestConfig config = DbxRequestConfig.newBuilder("dropbox/UploadImage").build();
                client = new DbxClientV2(config, ACCESS_TOKEN);
                List<FileItem> formItems = upload.parseRequest(request);
                
                if (formItems != null && formItems.size() > 0) {
                    for (FileItem item : formItems) {
                        if (!item.isFormField()) {
                            String fileName = new File(item.getName()).getName();
                            String filePath = uploadPath + File.separator + fileName;
                            File storeFile = new File(filePath);
                            item.write(storeFile);
                            request.setAttribute("message", "File " + fileName + " has uploaded successfully!");
                            // Upload "test.txt" to Dropbox
                            try (InputStream in = new FileInputStream(filePath)) {
                                FileMetadata metadata = client.files().uploadBuilder("/Images/" + fileName)
                                        .uploadAndFinish(in);
                            }
                        }
                    }
                }
            } catch (Exception ex) {
                request.setAttribute("message", "There was an error: " + ex.getMessage());
            }
            getServletContext().getRequestDispatcher(SUCCESS).forward(request, response);
        }
    }
}
