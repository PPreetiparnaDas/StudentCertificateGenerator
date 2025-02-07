Student Certificate Generator 🎓
A Java-based web application that allows users to add student details, manage skills, and generate certificates in PDF format. The project follows the MVC (Model-View-Controller) architecture and is built using JSP, Servlets, JDBC, and MySQL.

Features 🚀
✅ Add student details and skills
✅ View student records
✅ Generate student certificates dynamically
✅ Export certificates as PDF files
✅ Uses Maven for dependency management
✅ Deployed on Apache Tomcat

Tech Stack 🛠
Backend: Java, Servlets, JDBC
Frontend: JSP, HTML, CSS, JavaScript
Database: MySQL
PDF Generation: iText Library
Server: Apache Tomcat
Build Tool: Maven

Project Structure 📂
StudentCertificateGenerator/
│── src/main/java/com/otz/  
│   ├── bean/          # Java Beans (POJOs)  
│   ├── controller/    # Servlet Controllers  
│   ├── dao/           # Database Access (DAO)  
│   ├── util/          # Utility Classes  
│  
│── src/main/webapp/  
│   ├── WEB-INF/       # Web Configuration (web.xml)  
│   ├── addSkill.jsp  
│   ├── addStudent.jsp  
│   ├── certificate.jsp  
│   ├── createpdf.jsp  
│   ├── index.jsp  
│   ├── viewStudent.jsp  
│  
│── resources/         # Config files (DB, logging, etc.)  
│── pom.xml            # Maven Dependencies  
│── README.md          # Project Documentation  


