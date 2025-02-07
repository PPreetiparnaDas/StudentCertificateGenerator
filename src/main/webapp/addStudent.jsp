<%@page import="com.otz.util.DbConnection"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add Student</title>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f8f9fa;
            padding: 20px;
        }
        .container {
            max-width: 500px;
            background: #fff;
            padding: 20px;
            border-radius: 5px;
            box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
            margin-top: 50px;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2 class="text-center mb-4">Add Student</h2>
        <form id="studentForm">
             <div class="row"> 
	            <div class="mb-3 col-4">
	                <label for="stdName" class="form-label">Student Name:</label>
	                <input type="text" class="form-control" id="stdName" name="stdName" required>
	            </div>
	            <div class="mb-3 col-4">
	                <label for="stdRoll" class="form-label">Roll Number:</label>
	                <input type="text" class="form-control" id="stdRoll" name="stdRoll" required>
	            </div>
	            <div class="mb-3 col-4">
	                <label for="stdEmail" class="form-label">Email:</label>
	                <input type="email" class="form-control" id="stdEmail" name="stdEmail" required>
	            </div>
             </div>
             <div class="row">
		          <div class="mb-3 col-6">
	                <label for="stdPhone" class="form-label">Phone:</label>
	                <input type="text" class="form-control" id="stdPhone" name="stdPhone" required>
	            </div>
		            
		            <div class="mb-3 col-6">
		               <div class="d-flex ">
						    <h5 >Skills</h5>
						    <button type="button" class="btn btn-success col-6" data-bs-toggle="modal" data-bs-target="#addSkillModal">
						        +
						    </button>
						</div>
		               
		                <select class="form-select" id="skillSelect" name="skillId">
		                  <option>--Select skill--</option>
						    <%
						        Connection con = DbConnection.getConnection();
						        String query = "select skillId,skillName from skill";
						        PreparedStatement ps = con.prepareStatement(query);
						        ResultSet rs = ps.executeQuery();
						        while (rs.next()) {
						    %> 
						    <option value="<%=rs.getInt(1)%>"><%=rs.getString(2)%></option>
						    <%
						        }
						    %>  
						</select>
		
		                <input type="hidden" name="secret" value="SaveServlet">   
		     </div>
   </div>
            
            <button type="submit" class="btn btn-primary w-100">Submit</button>
        </form>
         <!-- Modal to Add New Skill -->
    <div class="modal fade" id="addSkillModal" tabindex="-1" aria-labelledby="addSkillModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="addSkillModalLabel">Add New Skill</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                   
				        <form id="skillForm">
				           
				            <div class="mb-3">
				                <label for="skillName" class="form-label">Add New Skill</label>
				                <input type="text" class="form-control" id="skillName" name="skillName" required>
				                <input type="hidden" name="secret" value="SaveServlet">
				            </div>
				            <button type="submit" class="btn btn-primary w-100">Add Skill</button>
				        </form>
                </div>
                
            </div>
        </div>
    </div>
     <script>
        $(document).ready(function() {
            $('#studentForm').submit(function(event) {
                event.preventDefault();
                var formData = $(this).serialize();
                
                $.ajax({
                    url: 'StudentServlet',
                    type: 'POST',
                    data: formData,
                    success: function(response) {
                        alert('student added successfully!');
                        $('#studentForm')[0].reset();
                    },
                    error: function() {
                        alert('Error adding student.');
                    }
                });
            });
        });
    </script>
        <script>
        $(document).ready(function() {
            $('#skillForm').submit(function(event) {
                event.preventDefault();
                var formData = $(this).serialize();

                $.ajax({
                    url: 'SkillServlet',
                    type: 'POST',
                    data: formData,
                    success: function(response) {
                        if (response !== "fail") {
                            alert('Skill added successfully!');
                            var newSkillName = $('#skillName').val();
                            var newSkillId = response.trim(); // Assuming SkillServlet returns skillId
                            $('#skillSelect').append('<option value="' + newSkillId + '">' + newSkillName + '</option>');
                            $('#skillForm')[0].reset();
                            $('#addSkillModal').modal('hide');
                        } else {
                            alert('Error adding skill.');
                        }
                    },
                    error: function() {
                        alert('Error adding skill.');
                    }
                });
            });
        });

    </script>
</body>
</html>
