

// This code interprets the serial data and parses it and 
// deposits appropriate values into the variable for each axis

void serialEvent(Serial port){ 
   String inData = port.readStringUntil('\n');
   inData = trim(inData);                 // cut off white space (carriage return)
   
   if (inData.charAt(0) == 'X'){          // leading 'S' for sensor data
     inData = inData.substring(1);        // cut off the leading 'S'
     if (inData.charAt(0) == '-'){        // Chack if the value is negative
       inData = inData.substring(1);      // cut off the leading '-'
       xvalue = (float(inData)) * -1.0;       // cast the remaining xvalue as an int and then make it negative
     } else  {
       xvalue = (float(inData));            // cast the xvalue as an int
     }   
   }
   if (inData.charAt(0) == 'Y'){          // leading 'B' for BPM data
     inData = inData.substring(1);        // cut off the leading 'B'
     if (inData.charAt(0) == '-'){        // Chack if the value is negative
       inData = inData.substring(1);      // cut off the leading '-'
       yvalue = (float(inData)) * -1.0;       // cast the remaining yvalue as an int and then make it negative
     } else  {
       yvalue = (float(inData));            // cast the yvalue as an int
     }   
   }
 if (inData.charAt(0) == 'Z'){            // leading 'Q' means IBI data 
     inData = inData.substring(1);        // cut off the leading 'Q'
     if (inData.charAt(0) == '-'){        // Chack if the value is negative
       inData = inData.substring(1);      // cut off the leading '-'
       zvalue = (float(inData)) * -1.0;       // cast the remaining yvalue as an int and then make it negative
     } else  {
       zvalue = (float(inData));            // cast the yvalue as an int
     }   
   }
}
