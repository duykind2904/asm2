package asm2.springweb.config;

import javax.servlet.MultipartConfigElement;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.ServletRegistration;

import org.springframework.web.WebApplicationInitializer;
import org.springframework.web.context.support.GenericWebApplicationContext;
import org.springframework.web.servlet.DispatcherServlet;
import org.springframework.web.servlet.support.AbstractAnnotationConfigDispatcherServletInitializer;



public class WebInitializer extends AbstractAnnotationConfigDispatcherServletInitializer {

	@Override
	protected Class<?>[] getRootConfigClasses() {
		return new Class[] { WebSecurityConfig.class };
		// TODO Auto-generated method stub
//		return null;
	}

	@Override
	protected Class<?>[] getServletConfigClasses() {
		return new Class[] { WebMvcConfig.class };
	}

	@Override
	protected String[] getServletMappings() {
		return new String[] { "/" };
	}
	
//	private static final String TMP_FOLDER = "/tmp"; 
//    private static final int MAX_UPLOAD_SIZE = 5 * 1024 * 1024; 
//    
//    @Override
//    public void onStartup(ServletContext sc) throws ServletException {
//        
//        ServletRegistration.Dynamic appServlet = sc.addServlet("mvc", new DispatcherServlet(
//          new GenericWebApplicationContext()));
//
//        appServlet.setLoadOnStartup(1);
//        
//        MultipartConfigElement multipartConfigElement = new MultipartConfigElement(TMP_FOLDER, 
//          MAX_UPLOAD_SIZE, MAX_UPLOAD_SIZE * 2L, MAX_UPLOAD_SIZE / 2);
//        
//        appServlet.setMultipartConfig(multipartConfigElement);
//    }

}






