/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.leapfrog.cm.dao;

import com.leapfrog.cm.entity.Contact;
import java.sql.SQLException;
import java.util.List;

/**
 *
 * @author jeevan
 */
public interface ContactDAO {
    
    List<Contact> getAll() throws ClassNotFoundException,SQLException;
    Contact getById(int id) throws ClassNotFoundException,SQLException;
    int insert(Contact c) throws ClassNotFoundException,SQLException;
    int delete(int id) throws ClassNotFoundException,SQLException;
    int makeRead(int id,boolean param) throws ClassNotFoundException,SQLException;
    
}
