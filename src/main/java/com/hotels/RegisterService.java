package com.hotels;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class RegisterService {

    public boolean usernameExists(String username) throws Exception {
        ConnectionDB db = new ConnectionDB();
        // this query returns a single row containing either true or false (row is named username_exists)
        String sql = "SELECT EXISTS (SELECT 1 FROM customer WHERE customerusername = ?) AS username_exists;";
        // try connect to database, catch any exceptions
        try (Connection con = db.getConnection()) {
            // prepare the statement
            PreparedStatement stmt = con.prepareStatement(sql);
            stmt.setString(1,username);
            // get the results from executing the query
            ResultSet rs = stmt.executeQuery();

            // Processing the result and returning true if there is a row returned from the query
            if (rs.next()){
                return rs.getBoolean("username_exists");
            }

            // return false if the username does not exist
            return false;
        } catch (Exception e) {
            // throw any errors occurred
            throw new Exception(e.getMessage());
        }
    }
}
