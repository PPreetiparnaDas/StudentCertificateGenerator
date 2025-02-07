<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Student Certificate</title>
    
    <!-- Import Google Fonts -->
    <link href="https://fonts.googleapis.com/css2?family=Cinzel:wght@600&family=Great+Vibes&display=swap" rel="stylesheet">

    <!-- Import jsPDF & html2canvas for PDF generation -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/html2canvas/1.4.1/html2canvas.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/2.5.1/jspdf.umd.min.js"></script>

    <style>
        body {
            font-family: 'Poppins', sans-serif;
            text-align: center;
            background-color: #f5f5f5;
            padding: 20px;
        }

        .certificate-container {
            width: 900px;
            height: 400px;
            background: white;
            padding: 30px;
            margin: 100px auto;
            border: 15px solid #d4af37;
            border-radius: 10px;
            box-shadow: 0px 5px 15px rgba(0, 0, 0, 0.2);
            position: relative;
        }

        .certificate-container h1 {
            color: #003366;
            font-size: 45px;
            font-family: 'Cinzel', serif;
        }

        .certificate-container h2 {
            font-size: 24px;
            margin: 10px 0;
            color: #555;
        }

        .certificate-container p {
            font-size: 18px;
            color: #444;
        }

        .recipient {
            font-size: 32px;
            font-weight: bold;
            color: #d4af37;
            font-family: 'Great Vibes', cursive;
            margin: 10px 0;
        }

        .details {
            font-size: 20px;
            font-weight: bold;
            color: #333;
            margin: 5px 0;
        }

        .signature-container {
            display: flex;
            justify-content: space-between;
            margin-top: 50px;
        }

        .signature {
            width: 250px;
            border-top: 2px solid black;
            padding-top: 5px;
            text-align: center;
        }

        .download-btn {
            margin-top: 20px;
            padding: 12px 25px;
            font-size: 18px;
            font-weight: bold;
            background-color: #003366;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            transition: 0.3s;
        }

        .download-btn:hover {
            background-color: #d4af37;
            color: black;
        }
    </style>
</head>
<body>

   

    <div class="certificate-container" id="certificate">
        <h1>Certificate of Achievement</h1>
        <h2>This is to certify that</h2>
        <p class="recipient" id="studentName">[Student Name]</p>
        <p class="details">Roll Number: <span id="rollNumber">[Roll No]</span></p>
        <h2>has successfully completed</h2>
        <p class="details">Skills Acquired: <span id="skills">[Skills]</span></p>
        <p>in recognition of outstanding performance and dedication.</p>

        <div class="signature-container">
    
            <div class="signature">
                <p>Date: <span id="currentDate"></span></p>
            </div>
        </div>
    </div>

   

    <script>
        document.getElementById('currentDate').textContent = new Date().toLocaleDateString();

        document.getElementById("certificateForm").addEventListener("submit", function(event) {
            event.preventDefault();
            
            let name = document.getElementById("studentNameInput").value;
            let rollNo = document.getElementById("rollNumberInput").value;
            let skills = document.getElementById("skillsInput").value;

            document.getElementById("studentName").textContent = name;
            document.getElementById("rollNumber").textContent = rollNo;
            document.getElementById("skills").textContent = skills;
        });

        function downloadCertificate() {
            const { jsPDF } = window.jspdf;
            const certificate = document.getElementById("certificate");

            html2canvas(certificate).then(canvas => {
                const imgData = canvas.toDataURL("image/png");
                const pdf = new jsPDF("landscape");
                pdf.addImage(imgData, "PNG", 20, 20, 250, 180);
                pdf.save("Student_Certificate.pdf");
            });
        }
    </script>

</body>
</html>
