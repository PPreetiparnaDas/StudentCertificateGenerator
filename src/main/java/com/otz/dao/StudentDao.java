package com.otz.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.otz.bean.Student;
import com.otz.util.DbConnection;

public class StudentDao {

    // Method to save a student to the database
    public int saveStudent(Student student) {
        int status = 0;
        try {
            // Get a connection to the database
            Connection con = DbConnection.getConnection();

            // SQL query to insert student data into the database
            String query = "INSERT INTO student ( stdName, stdRoll, stdEmail, stdPhone, skillId) VALUES (?, ?, ?, ?, ?)";
            PreparedStatement stmt = con.prepareStatement(query);
            
            stmt.setString(1, student.getStdName());
            stmt.setString(2, student.getStdRoll());
            stmt.setString(3, student.getStdEmail());
            stmt.setString(4, student.getStdPhone());
            stmt.setInt(5, student.getSkillId());

            // Execute the query and get the status
            status = stmt.executeUpdate();
            
            // Close the connection
            con.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return status;
    }

    public List<Student> getStudentsBy() {
        List<Student> list = new ArrayList<>();
        try {
            Connection con = DbConnection.getConnection();
            String query = "SELECT s.stdId, s.stdName, s.stdRoll, s.stdEmail, s.stdPhone, skill.skillName FROM student as s INNER JOIN skill  ON s.skillId = skill.skillId";
            PreparedStatement stmt = con.prepareStatement(query);
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                Student student = new Student();
                student.setStdId(rs.getInt(1));
                student.setStdName(rs.getString(2));
                student.setStdRoll(rs.getString(3));
                student.setStdEmail(rs.getString(4));  
                student.setStdPhone(rs.getString(5));  
                student.setSkillName(rs.getString(6));
                list.add(student);
            }
            con.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

	public Student getStudentsById(int stdId) {
	     Student student = new Student();
		 try {
	            Connection con = DbConnection.getConnection();
	            String query = "SELECT s.stdId, s.stdName, s.stdRoll, s.stdEmail, s.stdPhone, skill.skillName FROM student s INNER JOIN skill ON s.skillId = skill.skillId where s.stdId=?";
	            PreparedStatement stmt = con.prepareStatement(query);
	            stmt.setInt(1, stdId);
	            ResultSet rs = stmt.executeQuery();
	            while (rs.next()) {
	           
	                student.setStdId(rs.getInt("stdId"));
	                student.setStdName(rs.getString("stdName"));
	                student.setStdRoll(rs.getString("stdRoll"));
	                student.setStdEmail(rs.getString("stdEmail"));  
	                student.setStdPhone(rs.getString("stdPhone"));  
	                student.setSkillName(rs.getString("skillName"));
	              
	            }
	            con.close();
	        } catch (SQLException e) {
	            e.printStackTrace();
	        }
	        return student;
	}
  
}


