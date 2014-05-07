/*
THIS PROGRAM WORKS WITH ACCEL DEMO ARDUINO CODE
by James Grantham, 2014
*/


import processing.serial.*;
PFont font;

Serial port;     

float inc = 1.0;
    PFont f;


float xvalue;      // holds x value from arduino
float yvalue;      // holds y value from arduino
float zvalue;      // holds z value from arduino

float xpos;      // holds current goals seeking x position
float ypos;      // holds current goals seeking y position
float zpos;      // holds current goals seeking z position


int[] RawY;      // HOLDS HEARTBEAT WAVEFORM DATA BEFORE SCALING
int[] ScaledY;   // USED TO POSITION SCALED HEARTBEAT WAVEFORM
int[] rate;      // USED TO POSITION BPM DATA WAVEFORM
float zoom;      // USED WHEN SCALING PULSE WAVEFORM TO PULSE WINDOW
float offset;    // USED WHEN SCALING PULSE WAVEFORM TO PULSE WINDOW
color eggshell = color(255, 253, 248);
int heart = 0;   // This variable times the heart image 'pulse' on screen
//  THESE VARIABLES DETERMINE THE SIZE OF THE DATA WINDOWS
int PulseWindowWidth = 490;
int PulseWindowHeight = 512; 
int BPMWindowWidth = 180;
int BPMWindowHeight = 340;
boolean beat = false;    // set when a heart beat is detected, then cleared when the BPM graph is advanced


void setup() {
  size(700, 700,OPENGL);  // Stage size
  PFont.list();
  f = createFont("Courier",36,true);

  frameRate(100);  
  rectMode(CENTER);
  ellipseMode(CENTER);  
   
   xpos = 0.0;
   ypos = 0.0;
   zpos = 0.0;
   
// GO FIND THE ARDUINO
  println(Serial.list());    // print a list of available serial ports
  // choose the number between the [] that is connected to the Arduino
  port = new Serial(this, Serial.list()[2], 115200);  // make sure Arduino is talking serial at this baud rate
  port.clear();            // flush buffer
  port.bufferUntil('\n');  // set buffer full flag on receipt of carriage return
}
  
void draw() {
  
  background(0);
  lights();
  inc+=0.01;

  pushMatrix();
  fill(0,100,0);
  translate(width/2,height/2);
  
  float xrad = map(xvalue,-1,1,-PI/2.0,PI/2.0);
  
  if(xrad > (xpos + 0.05)) {
     xpos+=0.01; 
  } else if (xrad < (xpos - 0.05)) {
     xpos-=0.01 ;
  }
  
  rotateX(xpos); 
  
  float yrad = map(yvalue,1,-1,-PI/2.0,PI/2.0);
  
    if(yrad > (ypos+ 0.05)) {
     ypos+=0.01; 
  } else if (yrad < (ypos - 0.05)) {
     ypos-=0.01; 
  }
  
  rotateZ(ypos);
  
  
  box(width/2, height/48, width/2);
  
  popMatrix();

  pushMatrix();
  textFont(f,40);
  fill(110,100,200);
  text("X: ",50,50);
  text(xvalue,130,50);
  
  text("Y: ",50,100);
  text(yvalue,130,100);

  text("Z: ",50,150);
  text(zvalue,130,150);


  popMatrix();

  print("X: ");
  println(xvalue);
  
  print("Y: ");
  println(yvalue);
  
  print("Z: ");
  println(zvalue);
  
}  //end of draw loop



