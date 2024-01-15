 <a href="<%=request.getContextPath()%>/roombookpdf" class="btn btn-success" style="margin-left:30px"><img src="header/images/report.png" class="report">Generate Report</a><%@page import="java.sql.ResultSet"%>
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
		p.add("Income Report");
		p.setAlignment(Element.ALIGN_CENTER);
		document.add(p);

	Font f = new Font();
	f.setStyle(Font.BOLD);
	f.setSize(8);
	

	DbConnection obj_DBConnection = new DbConnection();
	Connection connection = obj_DBConnection.getConnection();
	String query = "select * from income";
	Statement stmt = null;
	stmt = connection.createStatement();
	ResultSet rs = stmt.executeQuery(query);
	Paragraph p3 = null;
	Paragraph p4 = null;
	Paragraph p5 = null;
	Paragraph p6 = null;

	float[] colsWidth = { 1f, 1f, 1f, 1f }; // Code 1

	Font boldFont = new Font(Font.FontFamily.TIMES_ROMAN, 12, Font.BOLD);
	PdfPTable table1 = new PdfPTable(colsWidth);
	table1.setWidthPercentage(100); // Code 2
	table1.setHorizontalAlignment(Element.ALIGN_LEFT);//Code 3
	Phrase date = new Phrase("Date", boldFont);
	Phrase div = new Phrase("Division", boldFont);
	Phrase tot = new Phrase("Total", boldFont);
	Phrase rem = new Phrase("remarks", boldFont);
	table1.addCell(date);
	table1.addCell(div);
	table1.addCell(tot);
	table1.addCell(rem);
	
	document.add(table1);

	while (rs.next()) {
		PdfPTable table2 = new PdfPTable(colsWidth);
		table2.setWidthPercentage(100); // Code 2
		table2.getDefaultCell().setBorder(1);
		p3 = new Paragraph();
		p4 = new Paragraph();
		p5 = new Paragraph();
		p6 = new Paragraph();

		p3.add(rs.getString("date"));
		p4.add(rs.getString("division"));
		p5.add(rs.getString("total"));
		p6.add(rs.getString("remarks"));
		
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