using System;
using System.Data.SqlClient;
using System.Net;
using System.Web.UI;

namespace YourNamespace
{
    public partial class EmployeeForm : Page
    {
        protected void submitButton_Click(object sender, EventArgs e)
        {
            // Retrieve values from the form fields
            string empIdValue = empId.Text;
            string firstNameValue = FirstName.Text;
            string lastNameValue = LastName.Text;
            string jobRoleValue = JobRole.Text;
            string reportingManagerValue = ReportingManager.Text;
            string genderValue = Gender.SelectedValue;
            // Photo upload handling can be implemented separately
            string dobValue = DOB.Text;
            string contactNumberValue = ContactNumber.Text;
            string emailValue = EmailID.Text;
            string addressValue = Address.Text;
            string dateOfJoiningValue = Date_of_Joining.Text;
            string itExperienceValue = Total_IT_Experience.Text;
            string bachelorDegreeValue = Bachelor_Degree.SelectedValue;
            string bachelorSpecializationValue = Bachelor_Specialization.Text;
            string mastersDegreeValue = Masters_Degree.SelectedValue;
            string mastersSpecializationValue = Masters_Specialization.Text;
            string certificationsValue = Certifications.Text;

            // Establish connection to SQL Server database
            string connectionString = "your_connection_string_here";
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                // Define INSERT query with parameters to prevent SQL injection
                string query = "INSERT INTO EMPD (EMP_ID, First_Name, Last_Name, Job_Role, Reporting_Manager, Gender, Photo_Upload, DOB, Contact_Number, Email_ID, Address, Date_of_Joining, Total_IT_Experience, Bachelor_Degree, Bachelor_Specialization, Masters_Degree, Masters_Specialization, Certifications) " +
                               "VALUES (@EMP_ID, @First_Name, @Last_Name, @Job_Role, @Reporting_Manager, @Gender, @Photo_Upload, @DOB, @Contact_Number, @Email_ID, @Address, @Date_of_Joining, @Total_IT_Experience, @Bachelor_Degree, @Bachelor_Specialization, @Masters_Degree, @Masters_Specialization, @Certifications)";

                // Create command object
                SqlCommand command = new SqlCommand(query, connection);

                // Add parameters to the command
                command.Parameters.AddWithValue("@EMP_ID", empIdValue);
                command.Parameters.AddWithValue("@First_Name", firstNameValue);
                command.Parameters.AddWithValue("@Last_Name", lastNameValue);
                command.Parameters.AddWithValue("@Job_Role", jobRoleValue);
                command.Parameters.AddWithValue("@Reporting_Manager", reportingManagerValue);
                command.Parameters.AddWithValue("@Gender", genderValue);
                command.Parameters.AddWithValue("@Photo_Upload", ""); // Placeholder for photo upload
                command.Parameters.AddWithValue("@DOB", dobValue);
                command.Parameters.AddWithValue("@Contact_Number", contactNumberValue);
                command.Parameters.AddWithValue("@Email_ID", emailValue);
                command.Parameters.AddWithValue("@Address", addressValue);
                command.Parameters.AddWithValue("@Date_of_Joining", dateOfJoiningValue);
                command.Parameters.AddWithValue("@Total_IT_Experience", itExperienceValue);
                command.Parameters.AddWithValue("@Bachelor_Degree", bachelorDegreeValue);
                command.Parameters.AddWithValue("@Bachelor_Specialization", bachelorSpecializationValue);
                command.Parameters.AddWithValue("@Masters_Degree", mastersDegreeValue);
                command.Parameters.AddWithValue("@Masters_Specialization", mastersSpecializationValue);
                command.Parameters.AddWithValue("@Certifications", certificationsValue);

                try
                {
                    // Open connection
                    connection.Open();
                    // Execute INSERT query
                    command.ExecuteNonQuery();
                    // Data inserted successfully
                    Console.WriteLine("Form data inserted into EMPD table successfully.");
                }
                catch (Exception ex)
                {
                    // Handle exceptions
                    Console.WriteLine("Error inserting form data into EMPD table: " + ex.Message);
                }
            }
        }
    }
}
