package com.otz.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.otz.bean.Skill;
import com.otz.dao.SkillDao;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/SkillServlet")
public class SkillServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Handle GET requests (if necessary)
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        // Get the secret value to determine the action
        String secret = request.getParameter("secret");

        if (secret.equals("SaveServlet")) {
            // Retrieve the skill name from the form
            String skillName = request.getParameter("skillName");

            // Create Skill object and set the skill name
            Skill skill = new Skill();
            skill.setSkillName(skillName);

            // Save the skill using SkillDao
            SkillDao skillDao = new SkillDao();
            int msg = skillDao.saveSkill(skill);
            if (msg > 0) {
                out.print("done");  // Respond with success
            } else {
                out.print("fail");  // Respond with failure
            }

        } else if (secret.equals("viewAllSkills")) {
            // For viewing all skills (optional)
            SkillDao skillDao = new SkillDao();
            List<Skill> list = skillDao.getAllSkills();
            Gson gson = new GsonBuilder().create();
            String jsonResponse = gson.toJson(list);
            out.print(jsonResponse);
        }
    }
}

