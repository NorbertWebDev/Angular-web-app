using System.Collections;
using Microsoft.AspNetCore.Mvc;
using MySql.Data.MySqlClient;

namespace MySqlController.Controllers
{
    public class MySqlDatabase : Controller
    {
        // Connection name is to handle the tables separate
        private string ConnectionName { get; set; }

        // Store the currently needed MySql connection string
        private string ConnectionString { get; set; }


        private MySqlConnection Connection = new MySqlConnection();

        // Store the currently needed sql command for the MySql database
        private string SqlCommand { get; set; }

        // Store the command type what is for example the select, insert, and etc.
        private int SqlCommandType { get; set; }

        private dynamic SqlReader { get; set; }

        private ArrayList SqlResult = new ArrayList();

        public MySqlDatabase()
        {
        }

        // Get and set the ConnectionString value for the current process
        private void loadConnectionString(string ConnectionName)
        {
            // Define connections to a MySql database. That depends on the table, and the user needed.
            if (ConnectionName == "Booking")
            {
                ConnectionString = "server=localhost;user=booking;database=test_ltd;port=3310;password=Bn2/E+7%T4+0!9&Aq÷T¤8Qg142&A6EE!*A5s÷¤Q4%";
            }
            else if(ConnectionName == "Contact")
            {
                ConnectionString = "server=localhost;user=contact;database=test_ltd;port=3310;password=ß3aG%eT$29¤jI04&%T7hZ!+tUiP27r%=+W8+B÷KjL";
            }
            else if(ConnectionName == "Menu")
            {
                ConnectionString = "server=localhost;user=menu;database=test_ltd;port=3310;password=&B@5!E2+%n4!7+3ßb-UZ+5u--7=9$4n+D=&@4gT8/U";
            }
        }

        // Set the ConnectionString value on the Connection object
        private void makeConnection()
        {
            Connection.ConnectionString = ConnectionString;
        }

        // Create and open a connection to the database
        private void openConnection()
        {
            Connection.Open();
        }

        // Run the given sql command or query to the database
        private dynamic runCommand(int SqlCommandType)
        {
            MySqlCommand RunSql = new MySqlCommand(SqlCommand, Connection);

            // Select
            if(SqlCommandType == 0)
            {
                SqlReader = RunSql.ExecuteReader();

                if(SqlReader.HasRows)
                {
                    while(SqlReader.Read())
                    {

                        ArrayList GivenValues = new ArrayList();

                        // Add the given values to the GivenValues array list
                        GivenValues.Add(SqlReader.GetString(0));
                        GivenValues.Add(SqlReader.GetString(1));
                        GivenValues.Add(SqlReader.GetDecimal(2));
                        GivenValues.Add(SqlReader.GetString(3));
                        GivenValues.Add(SqlReader.GetString(4));

                        // Add the final GivenValues array list to process later
                        SqlResult.Add(GivenValues);
                    }

                    return true;
                }
                else
                {
                    return false;
                }
            } // Insert, update, delete
            else if(SqlCommandType == 1)
            {
                RunSql.ExecuteReader();

                return true;
            }
            else
            {
                return false;
            }
        }

        // Close the Reader of the database
        private void closeReader()
        {
            SqlReader.Close();
        }

        // Close the database connection
        private void closeConnection()
        {
            Connection.Close();
        }

        // Make the book entry sql command for book row in the database
        private void setInsertBookingEntrySql(string FullName, string Email, string PhoneOrMobile, string Date, int Persons, string Comment)
        {
            // FullName, Email, PhoneOrMobile, Date, Persons, Comment
            SqlCommand = $"CALL `test_ltd`.`book_a_table`('{FullName}','{Email}','{PhoneOrMobile}','{Date}','{Persons}','{Comment}')";

            SqlCommandType = 1;
        }

        // Make the contact entry sql command for contact row in the database
        private void setInsertContactEntrySql(string FullName, string Email, string Subject, string Message)
        {
            // FullName, Email, Subject, Message
            SqlCommand = $"CALL `test_ltd`.`create_contact_item`('{FullName}','{Email}','{Subject}','{Message}')";

            SqlCommandType = 1;
        }

        // Call the view from the database for get all rows to show the menu
        private void setGetAllMenuItemsSql()
        {
            SqlCommand = $"SELECT * FROM test_ltd.get_all_active_menu_items";

            SqlCommandType = 0;
        }

        // Run the full process for create a booking row in the related database table
        public void insertBookingEntry(string FullName, string Email, string PhoneOrMobile, string Date, int Persons, string Comment)
        {
            ConnectionName = "Booking";

            loadConnectionString(ConnectionName);
            makeConnection();
            openConnection();
            setInsertBookingEntrySql(FullName, Email, PhoneOrMobile, Date, Persons, Comment);
            runCommand(SqlCommandType);
            closeConnection();
        }

        // Run the full process for create a contact row in the related database table
        public void insertContactEntry(string FullName, string Email, string Subject, string Message)
        {
            ConnectionName = "Contact";

            loadConnectionString(ConnectionName);
            makeConnection();
            openConnection();
            setInsertContactEntrySql(FullName, Email, Subject, Message);
            runCommand(SqlCommandType);
            closeConnection();
        }

        // Run the full process for get menu row(s) from the related database table
        public dynamic getAllMenuItems()
        {
            ConnectionName = "Menu";

            loadConnectionString(ConnectionName);
            makeConnection();
            openConnection();
            setGetAllMenuItemsSql();
            runCommand(SqlCommandType);
            closeConnection();
            return SqlResult;
        }
    }
}
