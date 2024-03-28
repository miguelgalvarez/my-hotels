package com.hotels;

import org.mindrot.jbcrypt.BCrypt;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class EmployeeService {

    public boolean validateEmployee(Employee employee) throws Exception{

        ConnectionDB db = new ConnectionDB();

        String username = employee.getFullName();
        int employeeNumber = employee.getEmployeeNumber();

        try (Connection connection = db.getConnection()) {
            String sql = "SELECT employeenumber FROM employee WHERE employeenumber = ? AND fullname = ?";
            try (PreparedStatement statement = connection.prepareStatement(sql)) {
                statement.setInt(1, employeeNumber);
                statement.setString(2, username);
                ResultSet rs = statement.executeQuery();
                if (rs.next()) {
                    return true;
                } else {
                    // employee does not exist
                    return false;
                }
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }

    }
}
