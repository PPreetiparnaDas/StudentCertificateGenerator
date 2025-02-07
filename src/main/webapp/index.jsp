<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Student Certificate Generator</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    
    <style>
        /* Global Styles */
        body {
            font-family: 'Poppins', sans-serif;
            background-color: #0d1b2a;
            color: #ffffff;
            text-align: center;
            overflow-x: hidden;
        }

        /* Hero Section */
        .hero {
            background: linear-gradient(135deg, #007bff, #4b0082);
            height: 100vh;
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            text-shadow: 2px 2px 10px rgba(0,0,0,0.3);
        }

        .hero h1 {
            font-size: 3.5rem;
            font-weight: bold;
            animation: fadeIn 1.5s ease-in-out;
        }

        .hero p {
            font-size: 1.3rem;
            margin-top: 10px;
            animation: fadeIn 2s ease-in-out;
        }

        .btn-primary {
            background-color: #ffcc00;
            border: none;
            padding: 12px 30px;
            font-size: 20px;
            font-weight: bold;
            border-radius: 30px;
            transition: transform 0.3s, background-color 0.3s;
            color: #000;
            box-shadow: 0px 5px 15px rgba(255, 204, 0, 0.5);
            animation: fadeIn 2.5s ease-in-out;
        }

        .btn-primary:hover {
            background-color: #ff9900;
            transform: scale(1.1);
        }

        /* Features Section */
        .features {
            padding: 50px 20px;
        }

        .feature-box {
            padding: 20px;
            border-radius: 10px;
            background: #1b263b;
            box-shadow: 0px 5px 15px rgba(0, 123, 255, 0.3);
            margin: 15px;
            transition: transform 0.3s, box-shadow 0.3s;
        }

        .feature-box:hover {
            transform: translateY(-5px);
            box-shadow: 0px 8px 20px rgba(0, 123, 255, 0.5);
        }

        .feature-box h3 {
            color: #ffcc00;
        }

        /* Animations */
        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(20px); }
            to { opacity: 1; transform: translateY(0); }
        }

        /* Responsive */
        @media (max-width: 768px) {
            .hero h1 { font-size: 2.5rem; }
            .hero p { font-size: 1rem; }
        }
    </style>
</head>
<body>

    <!-- Hero Section -->
    <div class="hero">
        <h1>Student Certificate Generator</h1>
        <p>Generate professional student certificates with ease.</p>
        <a href="viewStudent.jsp" class="btn btn-primary mt-3">Generate Now</a>
    </div>

    <!-- Features Section -->
    <div class="container features">
        <div class="row">
            <div class="col-md-4">
                <div class="feature-box">
                    <h3> Add Skill</h3>
                      <p>Personalize with skill Name.</p>
                    <p><a href="addSkill.jsp">Add skill </a></p>
                </div>
            </div>
            <div class="col-md-4">
                <div class="feature-box">
                    <h3> Add Student </h3>
                    <p>Personalize with student details.</p>
                    <a href="addStudent.jsp">Add student </a>
                </div>
            </div>
            <div class="col-md-4">
                <div class="feature-box">
                    <h3>Download Instantly</h3>
                    <p>Save and print certificates as PDF files.</p>
                    <a href="viewStudent.jsp"> Download Instantly</a>
                </div>
            </div>
        </div>
    </div>

</body>
</html>
