package com.community.dao;

import com.community.model.Issue;
import com.community.util.DBConnection;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class IssueDAO {

    
    public boolean addIssue(Issue issue) {
        String query = "INSERT INTO issues (title, description, reported_by) VALUES (?, ?, ?)";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(query)) {
            
            ps.setString(1, issue.getTitle());
            ps.setString(2, issue.getDescription());
            ps.setInt(3, issue.getUserId());

            return ps.executeUpdate() > 0;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }
    public boolean updateIssueStatus(int id, String status) {
    String query = "UPDATE issues SET status = ? WHERE id = ?";
    try (Connection conn = DBConnection.getConnection();
         PreparedStatement ps = conn.prepareStatement(query)) {
        
        ps.setString(1, status);
        ps.setInt(2, id);

        return ps.executeUpdate() > 0;
    } catch (Exception e) {
        e.printStackTrace();
        return false;
    }
}
public List<Issue> getIssuesByUser(int userId) {
    List<Issue> list = new ArrayList<>();
    String query = "SELECT * FROM issues WHERE reported_by = ?";
    try (Connection conn = DBConnection.getConnection();
         PreparedStatement ps = conn.prepareStatement(query)) {
        
        ps.setInt(1, userId);
        ResultSet rs = ps.executeQuery();
        
        while (rs.next()) {
            Issue issue = new Issue();
            issue.setId(rs.getInt("id"));
            issue.setTitle(rs.getString("title"));
            issue.setDescription(rs.getString("description"));
            issue.setStatus(rs.getString("status"));
            list.add(issue);
        }
    } catch (Exception e) {
        e.printStackTrace();
    }
    return list;
}

public boolean updateIssue(int id, String title, String description, String status) {
    String query = "UPDATE issues SET title = ?, description = ?, status = ? WHERE id = ?";
    try (Connection conn = DBConnection.getConnection();
         PreparedStatement ps = conn.prepareStatement(query)) {
        
        ps.setString(1, title);
        ps.setString(2, description);
        ps.setString(3, status);
        ps.setInt(4, id);

        return ps.executeUpdate() > 0;
    } catch (Exception e) {
        e.printStackTrace();
        return false;
    }
}
    
    public List<Issue> getAllIssues() {
        List<Issue> list = new ArrayList<>();
        String query = "SELECT * FROM issues";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(query);
             ResultSet rs = ps.executeQuery()) {
            
            while (rs.next()) {
                Issue issue = new Issue();
                issue.setId(rs.getInt("id"));
                issue.setTitle(rs.getString("title"));
                issue.setDescription(rs.getString("description"));
                issue.setStatus(rs.getString("status"));
                issue.setUserId(rs.getInt("reported_by"));
                list.add(issue);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }
}