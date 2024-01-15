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
	p.add("Room Report");
	p.setAlignment(Element.ALIGN_CENTER);
	document.add(p);

	Font front = new Font();
	front.setStyle(Font.BOLD);
	front.setSize(8);

	DbConnection obj_DBConnection = new DbConnection();
	Connection connection = obj_DBConnection.getConnection();
	String query = "select * from rooms";
	Statement statement = null;
	statement = connection.createStatement();
	ResultSet rs = statement.executeQuery(query);
	Paragraph p3 = null;
	Paragraph p4 = null;
	Paragraph p5 = null;
	Paragraph p6 = null;

	float[] colsWidth = { 1f, 1f, 1f, 1f };

	Font boldFont = new Font(Font.FontFamily.TIMES_ROMAN, 12, Font.BOLD);
	PdfPTable table1 = new PdfPTable(colsWidth);
	table1.setWidthPercentage(100);
	table1.setHorizontalAlignment(Element.ALIGN_LEFT);
	Phrase id = new Phrase("Room ID", boldFont);
	Phrase roomType = new Phrase("Room Type", boldFont);
	Phrase cost = new Phrase("Cost", boldFont);
	Phrase bed = new Phrase("No of Beds", boldFont);

	table1.addCell(id);
	table1.addCell(roomType);
	table1.addCell(cost);
	table1.addCell(bed);

	document.add(table1);

	while (rs.next()) {
		PdfPTable table2 = new PdfPTable(colsWidth);
		table2.setWidthPercentage(100); // Code 2
		table2.getDefaultCell().setBorder(1);
		p3 = new Paragraph();
		p4 = new Paragraph();
		p5 = new Paragraph();
		p6 = new Paragraph();

		p3.add(rs.getString("id"));
		p4.add(rs.getString("roomType"));
		p5.add(rs.getString("cost"));
		p6.add(rs.getString("bed"));

		table2.addCell(p3);
		table2.addCell(p4);
		table2.addCell(p5);
		table2.addCell(p6);

		document.add(table2);
	}
	document.close();
	%>
</body>
</html>