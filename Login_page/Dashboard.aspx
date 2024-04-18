<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Dashboard.aspx.cs" Inherits="Login.Dashboard" %>

<!DOCTYPE html>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Employee Registration Form</title>
    <style type="text/css">
        .auto-style1 {
            width: 280px;
        }
        .auto-style2 {
            width: 279px;
        }
        .auto-style3 {
            width: 274px;
        }
        .auto-style4 {
            width: 273px;
        }
        .auto-style5 {
            width: 277px;
        }
        .auto-style6 {
            width: 208px;
        }
    </style>
</head>
<body>
    <h2>Employee Registration Form</h2>
    <form action="#"
          method="POST"
          enctype="multipart/form-data"
          id="registrationForm">
        <label for="emp_id">Employee ID (Max length 5 digits):</label><br />
        <input type="text"
               id="EMP_ID"
               name="emp_id"
               maxlength="5"
               required class="auto-style1" /><br /><br />
        <label for="first_name">First Name:</label><br />
        <input type="text"
               id="First_Name"
               name="first_name"
               required class="auto-style2" /><br /><br />
        <label for="last_name">Last Name:</label><br />
        <input type="text" id="Last_Name" name="last_name" required class="auto-style3" /><br /><br />
        <label for="job_role">Job Role:</label><br />
        <input type="text" id="Job_Role" name="job_role" required class="auto-style4" /><br /><br />
        <label for="reporting_manager">Reporting Manager:</label><br />
        <input type="text"
               id="Reporting_Manager"
               name="reporting_manager" class="auto-style5" /><br /><br />
        <label for="gender">Gender:</label><br />
        <select id=" Gender" name="gender" required>
            <option value="Male">Male</option>
            <option value="Female">Female</option>
            <option value="Other">Other</option>
        </select><br /><br />
        <label for="photo_upload">Photo Upload:</label><br />
        <input type="file" id=" Photo_Upload" name="photo_upload" /><br /><br />
        <label for="dob">Date of Birth:</label><br />
        <input type="date" id="DOB" name="dob" required /><br /><br />
        <label for="contact_number">Contact Number:</label><br />
        <input type="text"
               id=" Contact_Number"
               name="contact_number"
               required /><br /><br />
        <label for="email">Email ID:</label><br />
        <input type="email" id="Email_ID" name="email" required /><br /><br />
        <label for="address">Address:</label><br />
        <textarea id="Address " name="address" rows="4" required></textarea><br /><br />
        <label for="date_of_joining">Date of Joining:</label><br />
        <input type="date"
               id="Date_of_Joining"
               name="date_of_joining"
               required /><br /><br />
        <label for="total_it_experience">Total IT Experience (in years):</label><br />
        <input type="number"
               id="Total_IT_Experience"
               name="total_it_experience"
               min="0"
               required /><br /><br />
        <label for="bachelor_degree">Bachelor's Degree:</label><br />
        <select id="Bachelor_Degree" name="bachelor_degree" required>
            <option value="BA">BA</option>
            <option value="BCOM">BCOM</option>
            <option value="BSC">BSC</option>
            <option value="BCA">BCA</option>
            <option value="BE">BE</option>
            <option value="BTech">BTech</option>
            <option value="Other">Other</option>
        </select><br /><br />
        <label for="bachelor_specialization">Bachelor's Specialization:</label><br />
        <input type="text"
               id="Bachelor_Specialization"
               name="bachelor_specialization" /><br /><br />
        <label for="masters_degree">Master's Degree:</label><br />
        <select id="Masters_Degree" name="masters_degree">
            <option value="MA">MA</option>
            <option value="MCOM">MCOM</option>
            <option value="MSC">MSC</option>
            <option value="MCA">MCA</option>
            <option value="ME">ME</option>
            <option value="MTech">MTech</option>
            <option value="MBA">MBA</option>
            <option value="Other">Other</option>
        </select><br /><br />
        <label for="master_specialization">Master's Specialization:</label><br />
        <input type="text"
               id="Masters_Specialization"
               name="master_specialization" /><br /><br />
        <label for="certifications">Certifications:</label><br />
        <textarea id="Certifications" name="certifications" rows="4"></textarea><br /><br />
        <input type="submit"
                action="/Login/Review.as"
               value="Submit"
               onclick="validateFormAndOpenNextPage()" id="Submit" class="auto-style6" />
    </form>

    <script>
        function validateFormAndOpenNextPage() {
            var form = document.getElementById("registrationForm");
            var isValid = true;

            // Check if all required fields are filled
            var requiredFields = form.querySelectorAll("[required]");
            for (var i = 0; i < requiredFields.length; i++) {
                if (!requiredFields[i].value) {
                    isValid = false;
                    break;
                }
            }

            if (!isValid) {
                alert("Please fill out all required fields.");
                event.preventDefault(); // Prevent form submission
            } else {
                // Open the next page
                window.open("/Login/Review.aspx");
            }
        }
    </script>

    <script>
        // <![CDATA[  <-- For SVG support
        if ("WebSocket" in window) {
            (function () {
                function refreshCSS() {
                    var sheets = [].slice.call(document.getElementsByTagName("link"));
                    var head = document.getElementsByTagName("head")[0];
                    for (var i = 0; i < sheets.length; ++i) {
                        var elem = sheets[i];
                        var parent = elem.parentElement || head;
                        parent.removeChild(elem);
                        var rel = elem.rel;
                        if (
                            (elem.href && typeof rel != "string") ||
                            rel.length == 0 ||
                            rel.toLowerCase() == "stylesheet"
                        ) {
                            var url = elem.href.replace(/(&|\?)_cacheOverride=\d+/, "");
                            elem.href =
                                url +
                                (url.indexOf("?") >= 0 ? "&" : "?") +
                                "_cacheOverride=" +
                                new Date().valueOf();
                        }
                        parent.appendChild(elem);
                    }
                }
                var protocol =
                    window.location.protocol === "http:" ? "ws://" : "wss://";
                var address =
                    protocol + window.location.host + window.location.pathname + "/ws";
                var socket = new WebSocket(address);
                socket.onmessage = function (msg) {
                    if (msg.data == "reload") window.location.reload();
                    else if (msg.data == "refreshcss") refreshCSS();
                };
                if (
                    sessionStorage &&
                    !sessionStorage.getItem("IsThisFirstTime_Log_From_LiveServer")
                ) {
                    console.log("Live reload enabled.");
                    sessionStorage.setItem("IsThisFirstTime_Log_From_LiveServer", true);
                }
            })();
        } else {
            console.error(
                "Upgrade your browser. This Browser is NOT supported WebSocket for Live-Reloading."
            );
        }
        // ]]>
    </script>
    <script>
        // JavaScript code to dynamically create a style tag and append it to the head

        // Create a style element
        var style = document.createElement('style');

        // Define your CSS rules
        var css = `
                /* CSS styles for the form */
                body {
                    font-family: Arial, sans-serif;
                    background-color: #f0f0f0;
                    padding: 20px;
                }

                h2 {
                    color: #333;
                }

                form {
                    background-color: #fff;
                    padding: 20px;
                    border-radius: 5px;
                    box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
                }

                label {
                    font-weight: bold;
                }

                input[type="text"],
                input[type="email"],
                select,
                textarea {
                    width: 100%;
                    padding: 8px;
                    margin-bottom: 10px;
                    border: 1px solid #ccc;
                    border-radius: 4px;
                    box-sizing: border-box;
                }

                input[type="submit"] {
                    background-color: #4caf50;
                    color: white;
                    padding: 10px 20px;
                    border: none;
                    border-radius: 4px;
                    cursor: pointer;
                    font-size: 16px;
                }

                input[type="submit"]:hover {
                    background-color: #45a049;
                }
            `;

        // Set the CSS text of the style element
        style.textContent = css;

        // Append the style element to the head of the document
        document.head.appendChild(style);
    </script>
    <script>
        // JavaScript code to dynamically create a style tag and append it to the head

        // Create a style element
        var style = document.createElement('style');

        // Define your CSS rules
        var css = `
                /* CSS styles for the form */
                body {
                    font-family: Arial, sans-serif;
                    background-color: #f0f0f0;
                    padding: 20px;
                }

                h2 {
                    color: #333;
                }

                form {
                    background-color: #fff;
                    padding: 20px;
                    border-radius: 5px;
                    box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
                }

                label {
                    font-weight: bold;
                }

                input[type="text"],
                input[type="email"],
                select,
                textarea {
                    width: 100%;
                    padding: 8px;
                    margin-bottom: 10px;
                    border: 1px solid #ccc;
                    border-radius: 4px;
                    box-sizing: border-box;
                }

                input[type="submit"] {
                    background-color: #4caf50;
                    color: white;
                    padding: 10px 20px;
                    border: none;
                    border-radius: 4px;
                    cursor: pointer;
                    font-size: 16px;
                }

                input[type="submit"]:hover {
                    background-color: Navy;
                }
            `;

        // Set the CSS text of the style element
        style.textContent = css;

        // Append the style element to the head of the document
        document.head.appendChild(style);
    </script>

</body>
</html>