package com.otz.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

import com.otz.bean.Student;
import com.otz.dao.StudentDao;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/StudentServlet")
public class StudentServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        // Get the secret value to determine the action
        String secret = request.getParameter("secret");

        if (secret.equals("SaveServlet")) {
            // Retrieve student information from the form
          
            String stdName = request.getParameter("stdName");
            String stdRoll = request.getParameter("stdRoll");
            String stdEmail = request.getParameter("stdEmail");
            String stdPhone = request.getParameter("stdPhone");
        	int  skillId=Integer.parseInt(request.getParameter("skillId"));
			
        
			HttpSession session=request.getSession();
			 int stdId=(int) session.getAttribute("stdId");
            // Create a new Student object and set the values
            Student student = new Student();
           
            student.setStdName(stdName);
            student.setStdRoll(stdRoll);
            student.setStdEmail(stdEmail);
            student.setStdPhone(stdPhone);
            student.setSkillId(skillId);

            // Create an instance of StudentDao to save the student data
            StudentDao studentDao = new StudentDao();
            int result = studentDao.saveStudent(student);

            // Return a success or failure message
            if (result > 0) {
                out.print("Student added successfully!");
            } else {
                out.print("Error adding student.");
            }
        } else if ("viewAllStudents".equals(secret)) {
            StudentDao studentDao = new StudentDao();
            List<Student> students = studentDao.getStudentsBy();

            Gson gson = new Gson();
            String jsonResponse = gson.toJson(students);
            response.setContentType("application/json");
            response.setCharacterEncoding("UTF-8");
            response.getWriter().write(jsonResponse);
        }else if ("getAllStudents".equals(secret)) {
        	int  stdId=Integer.parseInt(request.getParameter("stdId"));
        	StudentDao studentDao = new StudentDao();
            Student students = studentDao.getStudentsById(stdId);

            Gson gson = new Gson();
            String jsonResponse = gson.toJson(students);
            response.setContentType("application/json");
            response.setCharacterEncoding("UTF-8");
            response.getWriter().write(jsonResponse);
        }


    }
}
