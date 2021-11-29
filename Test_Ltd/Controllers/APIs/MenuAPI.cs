using System.Collections;
using Microsoft.AspNetCore.Mvc;
using MySqlController.Controllers;

namespace MenuApiController.Controllers
{
    [ApiController]
    [Route("MenuApi")]
    public class MenuApiController : Controller
    {
        ArrayList MenuItems = new ArrayList();

        [HttpPost]
        public IActionResult Post()
        {
            // Create a MySqlDatabase object instance
            MySqlDatabase Database = new MySqlDatabase();
            // Get the menu rows from the database
            MenuItems = Database.getAllMenuItems();

            switch (MenuItems.Count)
            {
                case > 0:
                    return Ok(new { status = "done", data = MenuItems });
                default:
                    return BadRequest(new { status = "error", text = "The menu is not avaible at the moment. Please try again later, and thank you for your patience." });
            }
        }
    }
}
