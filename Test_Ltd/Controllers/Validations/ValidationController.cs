using System;
using Microsoft.AspNetCore.Mvc;
using MessageController.Controllers;

namespace ValidationController.Controllers
{
    public class generalValidations : Controller
    {
        // THe Name of the current variable
        private string ValueName { get; set; }

        // The actual value of the current variable which will be validated
        private dynamic ValueToValidate { get; set; }

        // The data type of the current variable
        private dynamic ValueToType { get; set; }

        // The lowest value which is accepted, and what is also used as the min length value for strings
        private int ValueToMin { get; set; }

        // The highest value which is accepted, and what is also used as the max length value for strings
        private int ValueToMax { get; set; }

        // Store the string's length value when it has a string data type
        private int ValidateStringLength { get; set; }

        // Check that the variable has a value
        private bool validateVariableHasValue(dynamic ValueToValidate)
        {
            if(ValueToValidate == null)
            {
                return false;
            }
            else
            {
                return true;
            }
        }

        // Check that the variable has a value using another way
        private bool validateVariableType(dynamic ValueToValidate, dynamic ValueToType)
        {
            return (string)ValueToValidate.GetType().Name == "dynamic";
        }

        // Check that the value of the variable is valid or not
        private bool validateVariableValueLimits(dynamic ValueToValidate, dynamic ValueToType, int ValueToMin, int ValueToMax)
        {
            if(ValueToType == "int")
            {
                if(Convert.ToInt32(ValueToValidate) >= ValueToMin && Convert.ToInt32(ValueToValidate) <= ValueToMax)
                {
                    return true;
                }
                else
                {
                    return false;
                }
            }
            else if(ValueToType == "string")
            {
                ValidateStringLength = ValueToValidate.Length;

                if(ValueToMin == 0)
                {
                    if(ValidateStringLength <= ValueToMax)
                    {
                        return true;
                    }
                    else
                    {
                        return false;
                    }
                }
                else if (ValueToMin != 0)
                {
                    if(ValidateStringLength >= ValueToMin && ValidateStringLength <= ValueToMax)
                    {
                        return true;
                    }
                    else
                    {
                        return false;
                    }
                }
                else
                {
                    return false;
                }
            }
            else
            {
                return false;
            }
        }

        // Run the validation methods for variable checking
        public string runGeneralValidations(string ValueName, dynamic ValueToValidate, dynamic ValueToType, int ValueToMin, int ValueToMax)
        {
            if(validateVariableHasValue(ValueToValidate))
            {
                if(validateVariableType(ValueToValidate, ValueToType))
                {
                    if(validateVariableValueLimits(ValueToValidate, ValueToType, ValueToMin, ValueToMax))
                    {
                        return "true";
                    }
                    else
                    {
                        messageModule Message = new messageModule();

                        // Give the information to the user of value which is not in the accepted range
                        return Message.createMessage(" value is not in range.", ValueName);
                    }
                }
                else
               {
                    messageModule Message = new messageModule();

                    // Give the information to the user of value which is not in the accepted data type
                    return Message.createMessage(" value has wrong data type.", ValueName);
                }
            }
            else
            {
                messageModule Message = new messageModule();

                // Give the information to the user because the validated variable doesn't has a value
                return Message.createMessage(" variable hasn't got a value.", ValueName);
            }
        }
    }
}