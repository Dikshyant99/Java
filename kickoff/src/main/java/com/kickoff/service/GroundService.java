package com.kickoff.service;

import com.kickoff.dao.GroundDAO;
import com.kickoff.model.ground;
import com.kickoff.model.groundslot;
import java.sql.SQLException;
import java.util.List;

public class GroundService {

    private GroundDAO GroundDAO = new GroundDAO();

    // Get all active grounds
    public List<ground> getAllGrounds() throws SQLException {
        return GroundDAO.getAllGrounds();
    }

    // Get ground by ID
    public ground getGroundById(int groundId) throws SQLException {
        return GroundDAO.getGroundById(groundId);
    }

    // Get available slots for a ground
    public List<groundslot> getAvailableSlots(int groundId) throws SQLException {
        return GroundDAO.getAvailableSlots(groundId);
    }
}