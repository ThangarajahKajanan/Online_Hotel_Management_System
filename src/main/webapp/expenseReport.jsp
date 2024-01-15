<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="DBConnection.DbConnection"%>
<%@page import="com.itextpdf.text.pdf.PdfWriter"%>
<%@page import="com.itextpdf.text.Image"%>
<%@page import="com.itextpdf.text.pdf.PdfPTable"%>
<%@page import="com.itextpdf.text.Font"%>
<%@page import="com.itextpdf.text.Phrase"%>
<%@page import="com.itextpdf.text.Element"%>
<%@page import="com.itextpdf.text.Paragraph"%>
<%@page import="com.itextpdf.text.Document"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<%
		response.setContentType("application/pdf");
		Document document = new Document();
		PdfWriter writer = PdfWriter.getInstance(document, response.getOutputStream());
		document.open();
		Paragraph p = new Paragraph();
		p.add("Expense Report");
		p.setAlignment(Element.ALIGN_CENTER);
		document.add(p);

		Font front = new Font();
		front.setStyle(Font.BOLD);
		front.setSize(8);
	

	DbConnection obj_DBConnection = new DbConnection();
	Connection connection = obj_DBConnection.getConnection();
	String query = "select * from expenses";
	Statement statement = null;
	statement = connection.createStatement();
	ResultSet rs = statement.executeQuery(query);
	Paragraph p3 = null;
	Paragraph p4 = null;
	Paragraph p5 = null;
	Paragraph p6 = null;
	Paragraph p7 = null;

	float[] colsWidth = { 1f, 1f, 1f, 1f ,1f}; 

	Font boldFont = new Font(Font.FontFamily.TIMES_ROMAN, 12, Font.BOLD);
	PdfPTable table1 = new PdfPTable(colsWidth);
	table1.setWidthPercentage(100); 
	table1.setHorizontalAlignment(Element.ALIGN_LEFT);
	Phrase date = new Phrase("Date", boldFont);
	Phrase division = new Phrase("Division", boldFont);
	Phrase type = new Phrase("Type", boldFont);
	Phrase quantity = new Phrase("Quantity", boldFont);
	Phrase total = new Phrase("Total", boldFont);
	table1.addCell(date);
	table1.addCell(division);
	table1.addCell(type);
	table1.addCell(quantity);
	table1.addCell(total);
	
	document.add(table1);

	while (rs.next()) {
		PdfPTable table2 = new PdfPTable(colsWidth);
		table2.setWidthPercentage(100); // Code 2
		table2.getDefaultCell().setBorder(1);
		p3 = new Paragraph();
		p4 = new Paragraph();
		p5 = new Paragraph();
		p6 = new Paragraph();
		p7 = new Paragraph();

		p3.add(rs.getString("date"));
		p4.add(rs.getString("division"));
		p5.add(rs.getString("type"));
		p6.add(rs.getString("quantity"));
		p7.add(rs.getString("total"));
		
		table2.addCell(p3);
		table2.addCell(p4);
		table2.addCell(p5);
		table2.addCell(p6);
		table2.addCell(p7);
		document.add(table2);
	}
	document.close();
	%>
</body>
</html>