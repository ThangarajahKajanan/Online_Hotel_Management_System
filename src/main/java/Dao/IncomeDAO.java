package Dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import DBConnection.DBConnect;
import Model.Income;

public class IncomeDAO {

	private static Connection conn = null;
	private static Statement statement = null;
	private static ResultSet resultSet = null;
	private static boolean success = false;

	public static List<Income> display() {

		ArrayList<Income> income = new ArrayList<>();

		try {
			conn = DBConnect.getConection();
			statement = conn.createStatement();
			String sql = "select * from income";
			resultSet = statement.executeQuery(sql);

			while (resultSet.next()) {

				int id = resultSet.getInt(1);
				String date = resultSet.getString(2);
				String division = resultSet.getString(3);
				float total = resultSet.getFloat(4);
				String remarks = resultSet.getString(5);

				Income inc = new Income(id, date, division, total, remarks);

				income.add(inc);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return income;
	}

	public static List<Income> displaySelected(String div, String sDate, String eDate) {

		ArrayList<Income> income = new ArrayList<>();

		try {
			conn = DBConnect.getConection();
			statement = conn.createStatement();
			String sql = "select * from income WHERE division = '" + div + "' AND date between '" + sDate + "' and '"
					+ eDate + "'";
			resultSet = statement.executeQuery(sql);

			while (resultSet.next()) {

				int id = resultSet.getInt(1);
				String date = resultSet.getString(2);
				String division = resultSet.getString(3);
				float total = resultSet.getFloat(4);
				String remarks = resultSet.getString(5);

				Income inc = new Income(id, date, division, total, remarks);

				income.add(inc);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return income;
	}

	public static boolean insertIncome(String date, String division, float total, String remarks) {

		try {
			conn = DBConnect.getConection();
			statement = conn.createStatement();

			String sql = "insert into income values (0, '" + date + "', '" + division + "', '" + total + "', '"
					+ remarks + "')";

			int resultSet = statement.executeUpdate(sql);

			if (resultSet > 0) {
				success = true;
			} else {
				success = false;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return success;
	}

	public static boolean updateIncome(int id, String date, String division, float total, String remarks) {

		try {
			conn = DBConnect.getConection();
			statement = conn.createStatement();

			String sql = "update income set date='" + date + "', division='" + division + "', total = '" + total
					+ "' , remarks = '" + remarks + "' where id = '" + id + "'";

			int resultSet = statement.executeUpdate(sql);

			if (resultSet > 0) {
				success = true;
			} else {
				success = false;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return success;

	}

	public static boolean deleteIncome(int id) {

		try {
			conn = DBConnect.getConection();
			statement = conn.createStatement();

			String sql = "delete from income where id = '" + id + "' ";

			int resultSet = statement.executeUpdate(sql);

			if (resultSet > 0) {
				success = true;
			} else {
				success = false;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return success;
	}

}
