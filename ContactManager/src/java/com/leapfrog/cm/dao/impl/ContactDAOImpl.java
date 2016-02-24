/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.leapfrog.cm.dao.impl;

import com.leapfrog.cm.dao.ContactDAO;
import com.leapfrog.cm.dbutil.DbConnection;
import com.leapfrog.cm.entity.Contact;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author jeevan
 */
public class ContactDAOImpl implements ContactDAO {
    private DbConnection conn =new DbConnection();
    

    @Override
    public List<Contact> getAll() throws ClassNotFoundException, SQLException {
        List<Contact> contactList=new ArrayList<>();
        conn.open();
        String sql="SELECT * from tbl_contacts";
        conn.initStatement(sql);
        ResultSet rs=conn.executeQuery();
        
        while(rs.next()){
            Contact contact=new Contact();
            contact.setId(rs.getInt("id"));
            contact.setFirstName(rs.getString("first_name"));
            contact.setLastName(rs.getString("last_name"));
            contact.setEmail(rs.getString("email"));
            contact.setSubject(rs.getString("subject"));
            contact.setMessage(rs.getString("message"));
            contact.setAddedDate(rs.getDate("added_date"));
            contact.setRead(rs.getBoolean("is_read"));
            contactList.add(contact);
        }
        conn.close();
        return contactList;
        
    }

    @Override
    public int insert(Contact c) throws ClassNotFoundException, SQLException {
        conn.open();
        String sql="INSERT INTO tbl_contacts(first_name,last_name,email,subject,message) VALUES(?,?,?,?,?)";
        PreparedStatement stmt= conn.initStatement(sql);
        stmt.setString(1, c.getFirstName());
        stmt.setString(2, c.getLastName());
        stmt.setString(3, c.getEmail());
        stmt.setString(4, c.getSubject());
        stmt.setString(5, c.getMessage());
        int result=conn.executeUpdate();
        conn.close();     
        return result;
    }

    @Override
    public Contact getById(int id) throws ClassNotFoundException, SQLException {
        Contact contact=null;
        conn.open();
        String sql="SELECT * from tbl_contacts WHERE id=?";
        PreparedStatement stmt= conn.initStatement(sql);
        stmt.setInt(1, id);
        ResultSet rs=conn.executeQuery();
        
        while(rs.next()){
            contact=new Contact();
            contact.setId(rs.getInt("id"));
            contact.setFirstName(rs.getString("first_name"));
            contact.setLastName(rs.getString("last_name"));
            contact.setEmail(rs.getString("email"));
            contact.setSubject(rs.getString("subject"));
            contact.setMessage(rs.getString("message"));
            contact.setAddedDate(rs.getDate("added_date"));
            contact.setRead(rs.getBoolean("is_read"));
            
        }
        conn.close();
        return contact;
    }

    @Override
    public int makeRead(int id,boolean param) throws ClassNotFoundException, SQLException {
        conn.open();
        String sql="UPDATE tbl_contacts set is_read=? WHERE id=? ";
        PreparedStatement stmt= conn.initStatement(sql);
        stmt.setBoolean(1,param);
        stmt.setInt(2, id);

        int result=conn.executeUpdate();
        conn.close();     
        return result;        
    }

    @Override
    public int delete(int id) throws ClassNotFoundException, SQLException {
        conn.open();
        String sql = "Delete from tbl_contacts where id = ?";
        PreparedStatement stmt = conn.initStatement(sql);
        stmt.setInt(1, id);
        
        int result = conn.executeUpdate();
        conn.close();
        return result;
    }
    
    
}
