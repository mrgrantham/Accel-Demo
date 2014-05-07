
/*
>>MMA7361 Demo Serial communication arduino sketch to use with companion Processing Sketch

by James Grantham



*/
#include "Accelerometer.h"

Accelerometer myAccelerometer = Accelerometer();

void setup(){
  

  Serial.begin(115200);             // we agree to talk fast!

   //Connect up the following pins and your power rail	
  //                    SL GS 0G   X  Y  Z	
  myAccelerometer.begin(3, 4, 5, A0, A1, A2);
    
  //calibration performed below
  Serial.println("Please place the Accelerometer on a flat\nLevel surface");
  delay(2000);//Give user 2 seconds to comply
  myAccelerometer.calibrate();
  
}



void loop(){
  delay(20);//delay for readability
  //reads the values of your accelerometer
  myAccelerometer.read();
  
  // This section writes to the serial connection in a format that can be interpreted by the companion processing app
  Serial.print("X");
  Serial.println(myAccelerometer._Xgs);
  Serial.print("Y");
  Serial.println(myAccelerometer._Ygs);
  Serial.print("Z");
  Serial.println(myAccelerometer._Zgs);
}


