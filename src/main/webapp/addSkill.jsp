<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add Skill</title>
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
        <h2 class="text-center mb-4">Add Skill</h2>
        <form id="skillForm">
           
            <div class="mb-3">
                <label for="skillName" class="form-label">Skill Name:</label>
                <input type="text" class="form-control" id="skillName" name="skillName" required>
                <input type="hidden" name="secret" value="SaveServlet">
            </div>
            <button type="submit" class="btn btn-primary w-100">Submit</button>
        </form>
    </div>
    
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
                        alert('Skill added successfully!');
                        $('#skillForm')[0].reset();
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
