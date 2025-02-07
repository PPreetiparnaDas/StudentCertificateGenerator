<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html class="semi-dark">
<head>
    <meta charset="UTF-8">
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Bootstrap Icons (Required for <i class='bi ...'></i>) -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css">
    <!-- jQuery (Moved to head) -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>

    <div class="card">
        <div class="card-body">
            <div class="table-responsive mt-3">
                <table class="table align-middle">
                    <thead class="table-secondary">
                        <tr>
                            <th>#</th>
                            <th>Name</th>
                            <th>Roll</th>
                            <th>Email</th>
                            <th>Phone</th>
                            <th>Skill</th>
                            <th>Certificate</th>
                        </tr>
                    </thead>
                    <tbody id="bindData">
                        <!-- Data will be injected here by jQuery -->
                    </tbody>
                </table>
            </div>
        </div>
    </div>
<script>
   $(document).ready(function () {
    getData();  // Fetch data on page load
});

function getData() {
    $.ajax({
        url: "StudentServlet",
        method: "POST",
        data: { "secret": "viewAllStudents" },
        dataType: "json",
        success: function (response) {
        	let s="";
			for(var key in response){
                   if(response.hasOwnProperty(key)){
							   s+="<tr>";
		                	   s+="<td>"+response[key].stdId+"</td>";
		                	   s+="<td>"+response[key].stdName+"</td>";
		                	   s+="<td>"+response[key].stdRoll+"</td>";
		                	   s+="<td>"+response[key].stdEmail+"</td>";
		                	   s+="<td>"+response[key].stdPhone+"</td>";
		                	   s+="<td>"+response[key].skillName+"</td>";
		                	   s+="<td><a href='certificate.jsp?stdId="+response[key].stdId+"'>generate certificate</a></td>";
		                	   s+="</tr>";
						
                   }					
	    		}
					$("#bindData").html(s);
    		 },
        error: function (jqXHR, textStatus, errorThrown) {
            console.error("AJAX Error:", textStatus, errorThrown);
            $("#bindData").html("<tr><td colspan='7' class='text-center text-danger'>Error loading data</td></tr>");
        }
    });
}

</script>
    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
