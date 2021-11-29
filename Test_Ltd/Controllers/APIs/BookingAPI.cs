using System;
using Microsoft.AspNetCore.Mvc;
using MySqlController.Controllers;
using ValidationController.Controllers;

namespace BookingApiController.Controllers
{
    // Create Booking class
    public class Booking
    {
        // Create the initialization method
        public Booking()
        {}

        // Define the final method for Booking object creation
        public Booking(string fullName,string email,string phoneOrMobile,string date,string time,int persons,string message)
        {
            FullName = fullName;
            Email = email;
            PhoneOrMobile = phoneOrMobile;
            Date = date;
            Time = time;
            Persons = persons;
            Message = message;
        }

        // variable to store in the Booking object
        public string FullName { get; set; }
        public string Email { get; set; }
        public string PhoneOrMobile { get; set; }
        public string Date { get; set; }
        public string Time { get; set; }
        public int Persons { get; set; }
        public string Message { get; set; }
    }

    [ApiController]
    [Route("BookingApi")]
    public class BookingApiController : ControllerBase
    {
        // Define the result of the current validtion process
        private new dynamic[] Response = {"", "", "", "", "", "", ""};

        Booking booking = new Booking("", "", "", "", "", 0, "");

        // Create a booking item in the database
        [HttpPost]
        public ActionResult Post(Booking booking)
        {
            /* 
             * Create a generalValidations object instance
             * Run validate processes what is depend on the values
            */
            if (booking != null)
            {
                /* 
                 * Create a generalValidations object instance
                 * Run validate processes what is depend on the values
                */
                generalValidations Validator = new generalValidations();
                Response[0] = Validator.runGeneralValidations("FullName", booking.FullName, "string", 6, 200);
                Response[1] = Validator.runGeneralValidations("Email", booking.Email, "string", 0, 400);
                Response[2] = Validator.runGeneralValidations("PhoneOrMobile", booking.PhoneOrMobile, "string", 0, 13);
                Response[3] = Validator.runGeneralValidations("Date", booking.Date, "string", 10, 10);
                Response[4] = Validator.runGeneralValidations("Time", booking.Time, "string", 5, 5);
                Response[5] = Validator.runGeneralValidations("Persons", Convert.ToInt32(booking.Persons), "int", 1, 255);
                Response[6] = Validator.runGeneralValidations("Message", booking.Message, "string", 1, 65535);

                // Put together the final DateTime value for database
                booking.Date = booking.Date+" "+booking.Time;

                /*
                 * Create a MySqlDatabase object instance
                 * Run the insert a booking row to the related database table
                */
                MySqlDatabase Database = new MySqlDatabase();
                Database.insertBookingEntry(booking.FullName, booking.Email, booking.PhoneOrMobile, booking.Date, booking.Persons, booking.Message);

                return Ok(new { status = "done", data = Response, text = "The booking is active, and thank you for choosing us!"});
            }
            else
            {
                return BadRequest(new { status = "error", text = "The booking can't be made, and please try again later. Thank you for your patience."});
            }
        }
    }
}
