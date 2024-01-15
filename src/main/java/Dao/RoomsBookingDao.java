
package Dao;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import DBConnection.DbConnection;
import Model.RoomBooking;

public class RoomsBookingDao {

	// roombooking
	private static final String INSERT_room_SQL = "INSERT INTO rooms" + " (roomType,cost,bed) VALUES " + " (?,?,?);";

	private static final String SELECT_rmbooking_BY_ID = "select   id, roomType, cost,bed from rooms where id =?";
	private static final String SELECT_ALL_ermbooking = "select * from rooms";
	private static final String DELETE_rmbooking_SQL = "delete from rooms where id = ?;";
	private static final String UPDATE_rmbooking_SQL = "update rooms set roomType= ?,cost= ?,bed= ? where id = ?;";

	public RoomsBookingDao() {

	}

	DbConnection dbconnection = new DbConnection();

	// insert RoomsBoking
	public void insertRoomsBook(RoomBooking rmbook) throws SQLException {
		System.out.println(INSERT_room_SQL);
		// try-with-resource statement will auto close the connection.
		try (Connection connection = dbconnection.getConnection();
				PreparedStatement preparedStatement = connection.prepareStatement(INSERT_room_SQL)) {
			preparedStatement.setString(1, rmbook.getRoomType());
			preparedStatement.setInt(2, rmbook.getCost());
			preparedStatement.setInt(3, rmbook.getBed());

			System.out.println(preparedStatement);
			preparedStatement.executeUpdate();
		} catch (SQLException e) {
			dbconnection.printSQLException(e);
		}
	}

	// select RoomBooking
	public RoomBooking selectRoomBooking(int id) {
		RoomBooking rmbook = null;
		// Step 1: Establishing a Connection
		try (Connection connection = dbconnection.getConnection();
				// Step 2:Create a statement using connection object
				PreparedStatement preparedStatement = connection.prepareStatement(SELECT_rmbooking_BY_ID);) {
			preparedStatement.setInt(1, id);
			System.out.println(preparedStatement);
			// Step 3: Execute the query or update query
			ResultSet rs = preparedStatement.executeQuery();

			// Step 4: Process the ResultSet object.
			while (rs.next()) {
				String roomType = rs.getString("roomType");
				int cost = rs.getInt("cost");
				int bed = rs.getInt("bed");

				rmbook = new RoomBooking(id, roomType, cost, bed);
			}

		} catch (SQLException e) {
			dbconnection.printSQLException(e);
		}
		return rmbook;
	}

	// select All RoomBokings
	public List<RoomBooking> selectAllRoomBookings() {

		// using try-with-resources to avoid closing resources (boiler plate code)
		List<RoomBooking> rmbook = new ArrayList<>();
		// Step 1: Establishing a Connection
		try (Connection connection = dbconnection.getConnection();

				// Step 2:Create a statement using connection object
				PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_ermbooking);) {
			System.out.println(preparedStatement);
			// Step 3: Execute the query or update query
			ResultSet rs = preparedStatement.executeQuery();

			// Step 4: Process the ResultSet object.
			while (rs.next()) {
				int id = rs.getInt("id");
				String roomType = rs.getString("roomType");
				int cost = rs.getInt("cost");
				int bed = rs.getInt("bed");

				rmbook.add(new RoomBooking(id, roomType, cost, bed));
			}
		} catch (SQLException e) {
			dbconnection.printSQLException(e);
		}
		return rmbook;
	}

	// Delete roomsBook
	public boolean deleteRoomsBook(int id) throws SQLException {
		boolean rowDeleted;
		try (Connection connection = dbconnection.getConnection();
				PreparedStatement statement = connection.prepareStatement(DELETE_rmbooking_SQL);) {
			statement.setInt(1, id);
			rowDeleted = statement.executeUpdate() > 0;
		}
		return rowDeleted;
	}

	// Update RoomBooking
	public boolean updateRoombooking(RoomBooking rmbook) throws SQLException {
		boolean rowUpdated;
		try (Connection connection = dbconnection.getConnection();
				PreparedStatement statement = connection.prepareStatement(UPDATE_rmbooking_SQL);) {
			statement.setString(1, rmbook.getRoomType());
			statement.setInt(2, rmbook.getCost());
			statement.setInt(3, rmbook.getBed());
			statement.setInt(4, rmbook.getId());
			System.out.println(".............................");

			System.out.println("Updating Id this " + rmbook.getId());
			System.out.println("Update " + statement);
			rowUpdated = statement.executeUpdate() > 0;
		}
		return rowUpdated;
	}

}