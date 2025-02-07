package com.otz.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.otz.bean.Skill;
import com.otz.util.DbConnection;

public class SkillDao {

    public int saveSkill(Skill skill) {
        int status = 0;
        try {
            Connection con = DbConnection.getConnection();
            String query = "INSERT INTO skill (skillName) VALUES (?)";
            PreparedStatement ps = con.prepareStatement(query);
            ps.setString(1, skill.getSkillName());
            status = ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return status;
    }

    // Method to retrieve all skills (optional)
    public List<Skill> getAllSkills() {
        List<Skill> skillList = new ArrayList<>();
        try {
            Connection con = DbConnection.getConnection();
            String query = "SELECT * FROM skill";
            PreparedStatement ps = con.prepareStatement(query);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Skill skill = new Skill();
                skill.setSkillName(rs.getString("skillName"));
                skillList.add(skill);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return skillList;
    }
}
