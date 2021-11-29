using System;
using Microsoft.AspNetCore.Mvc;

namespace MessageController.Controllers
{
    public class messageModule : Controller
    {
        // Store the text to be shown next to the actual value of the current variable
        private string MessageText { get; set; }

        // Store the actual value of the current variable for the message to be shown
        private string MessageValue { get; set; }

        // Store the finalized message text which will be shown to the user
        public string FinalMessage { get; set; }

        private string checkVariable()
        {
            // Run basic validations on the MessageText, and the MessageValue
            if (Convert.ToString(MessageText.GetType()) == "string" && Convert.ToString(MessageValue.GetType()) == "string")
            {
                return MessageValue+MessageText;
            }
            else
            {
                return "false";
            }
        }

        public string createMessage(string messageText,string messageValue)
        {
            MessageText = messageText;
            MessageValue = messageValue;

            // Construct the full final message, and return that value
            FinalMessage = checkVariable();
            return FinalMessage;
        }
    }
}