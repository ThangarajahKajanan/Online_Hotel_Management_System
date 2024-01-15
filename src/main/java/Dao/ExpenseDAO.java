package Dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import DBConnection.DBConnect;
import Model.Expense;

public class ExpenseDAO {

	private static Connection conn = null;
	private static Statement statement = null;
	private static ResultSet resultSet = null;
	private static boolean success = false;

	public static List<Expense> display() {

		ArrayList<Expense> expense = new ArrayList<>();

		try {
			conn = DBConnect.getConection();
			statement = conn.createStatement();
			String sql = "select * from expenses";
			resultSet = statement.executeQuery(sql);

			while (resultSet.next()) {

				int id = resultSet.getInt(1);
				String date = resultSet.getString(2);
				String division = resultSet.getString(3);
				String type = resultSet.getString(4);
				int quantity = resultSet.getInt(5);
				float total = resultSet.getFloat(6);

				Expense newExpense = new Expense(id, date, division, type, quantity, total);

				expense.add(newExpense);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return expense;
	}

	public static List<Expense> displaySelected(String div, String startDate, String endDate) {

		ArrayList<Expense> expense = new ArrayList<>();

		try {
			conn = DBConnect.getConection();
			statement = conn.createStatement();
			String sql = "select * from expenses WHERE division = '" + div+ "' AND date between '" + startDate + "' and '"
					+ endDate + "'";
			resultSet = statement.executeQuery(sql);

			while (resultSet.next()) {

				int id = resultSet.getInt(1);
				String date = resultSet.getString(2);
				String division = resultSet.getString(3);
				String type = resultSet.getString(4);
				int quantity = resultSet.getInt(5);
				float total = resultSet.getFloat(6);

				Expense NewExpense = new Expense(id, date, division, type, quantity, total);

				expense.add(NewExpense);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return expense;
	}

	public static boolean insertExpense(String date, String division, String type, int quantity, float total) {

		try {
			conn = DBConnect.getConection();
			statement = conn.createStatement();

			String sql = "insert into expenses values (0, '" + date + "', '" + division + "', '" + type + "', '"
					+ quantity + "', '" + total + "')";

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

	public static boolean updateExpense(int id, String date, String division, String type, int quantity, float total) {

		try {
			conn = DBConnect.getConection();
			statement = conn.createStatement();

			String sql = "update expenses set date='" + date + "', division='" + division + "', type = '" + type
					+ "', quentity = '" + quantity + "', total = '" + total + "' where id = '" + id + "'";

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

	public static boolean deleteExpense(int id) {

		try {
			conn = DBConnect.getConection();
			statement = conn.createStatement();

			String sql = "delete from expenses where id = '" + id + "' ";

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
