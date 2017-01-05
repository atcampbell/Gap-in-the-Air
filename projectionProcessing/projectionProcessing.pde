import oscP5.*;
import netP5.*;

OscP5 oscP5;

NetAddress myRemoteLocation;

// twoFourses vars
float TFxloc01;
float TFxloc02;
float TFxloc03;
float TFxloc04;
float TFyloc01;
float TFyloc02;
float TFyloc03;
float TFyloc04;

float TFstate0301;
float TFstate0302;

void setup() {
  
  size(displayWidth, displayHeight, P2D);
  
  smooth(16);
  
  // create a new instance of oscP5. 
  // 12000 is the port number you are listening for incoming osc messages.
  oscP5 = new OscP5(this, 12000);
  

  // create a new NetAddress. a NetAddress is used when sending osc messages
  // with the oscP5.send method.
  myRemoteLocation = new NetAddress("127.0.0.1", 12001);

  // with the plug method of oscP5 you can automatically forward
  // incoming osc messages with a specific address pattern (3rd parameter in the plug method)
  // and a specific typetag (typetag=parameters of plugged method) to a
  // specific method (2nd parameter) in your sketch.
  oscP5.plug(this, "test", "/test");
  
}

void draw() {
  
  noStroke();
  
  float backgroundGradTop = map(TFstate0301, 0, 1, 0, 255);
  float backgroundGradBottom = map(TFstate0302, 0, 1, 0, 255);
  
  // Set background colours
  beginShape();
  fill(200, backgroundGradTop, 255);
  vertex(0, 0);
  vertex(displayWidth, 0);
  fill(255, 230, backgroundGradBottom);
  vertex(displayWidth, displayHeight);
  vertex(0, displayHeight);
  endShape(CLOSE);
  
  // Map input for shape coordinates
  float TFxloc01Map = map(TFxloc01, 0, 1, 0, displayWidth);
  float TFyloc01Map = map(TFyloc01, 0, 1, 0, displayHeight);

  float TFxloc02Map = map(TFxloc02, 0, 1, 0, displayWidth);
  float TFyloc02Map = map(TFyloc02, 0, 1, 0, displayHeight);

  float TFxloc03Map = map(TFxloc03, 0, 1, 0, displayWidth);
  float TFyloc03Map = map(TFyloc03, 0, 1, 0, displayHeight);

  float TFxloc04Map = map(TFxloc04, 0, 1, 0, displayWidth);
  float TFyloc04Map = map(TFyloc04, 0, 1, 0, displayHeight);

  float TFxloc05Map = map(TFyloc01, 0, 1, 0, displayWidth);
  float TFyloc05Map = map(TFxloc01, 0, 1, 0, displayHeight);

  float TFxloc06Map = map(TFyloc02, 0, 1, 0, displayWidth);
  float TFyloc06Map = map(TFxloc02, 0, 1, 0, displayHeight);

  float TFxloc07Map = map(TFyloc03, 0, 1, 0, displayWidth);
  float TFyloc07Map = map(TFxloc03, 0, 1, 0, displayHeight);

  float TFxloc08Map = map(TFyloc04, 0, 1, 0, displayWidth);
  float TFyloc08Map = map(TFxloc04, 0, 1, 0, displayHeight);
  
  // Draw first shape (filled shape)
  noStroke();
  beginShape();
  fill(255, 210, 240);
  vertex(TFxloc01Map, TFyloc01Map);
  fill(200, 210, 255);
  vertex(TFxloc02Map, TFyloc02Map);
  fill(255, 255, 200);
  vertex(TFxloc03Map, TFyloc03Map);
  fill(230, 220, 240);
  vertex(TFxloc04Map, TFyloc04Map);
  endShape(CLOSE);
      
  // Draw second shape (outline)
  beginShape();
  noFill();
  stroke(255);
  strokeWeight(2);
  vertex(TFxloc05Map, TFyloc05Map);
  vertex(TFxloc06Map, TFyloc06Map);
  vertex(TFxloc07Map, TFyloc07Map);
  vertex(TFxloc08Map, TFyloc08Map);
  endShape(CLOSE);
}

void oscEvent(OscMessage theOscMessage) {
  // get and print the address pattern and the typetag of the received OscMessage
  println("### received an osc message with addrpattern "+theOscMessage.addrPattern()+" and typetag "+theOscMessage.typetag());
  theOscMessage.print();

  if (theOscMessage.checkAddrPattern("/TFxloc01")) {
    // got a /test message
    if (theOscMessage.checkTypetag("f")) {
      // the typetag of the /test message is i - so update
      TFxloc01 = theOscMessage.get(0).floatValue();
    }
  }

  if (theOscMessage.checkAddrPattern("/TFxloc02")) {
    // got a /test message
    if (theOscMessage.checkTypetag("f")) {
      // the typetag of the /test message is i - so update
      TFxloc02 = theOscMessage.get(0).floatValue();
    }
  }

  if (theOscMessage.checkAddrPattern("/TFxloc03")) {
    // got a /test message
    if (theOscMessage.checkTypetag("f")) {
      // the typetag of the /test message is i - so update
      TFxloc03 = theOscMessage.get(0).floatValue();
    }
  }

  if (theOscMessage.checkAddrPattern("/TFxloc04")) {
    // got a /test message
    if (theOscMessage.checkTypetag("f")) {
      // the typetag of the /test message is i - so update
      TFxloc04 = theOscMessage.get(0).floatValue();
    }
  }

  if (theOscMessage.checkAddrPattern("/TFyloc01")) {
    // got a /test message
    if (theOscMessage.checkTypetag("f")) {
      // the typetag of the /test message is i - so update
      TFyloc01 = theOscMessage.get(0).floatValue();
    }
  }

  if (theOscMessage.checkAddrPattern("/TFyloc02")) {
    // got a /test message
    if (theOscMessage.checkTypetag("f")) {
      // the typetag of the /test message is i - so update
      TFyloc02 = theOscMessage.get(0).floatValue();
    }
  }

  if (theOscMessage.checkAddrPattern("/TFyloc03")) {
    // got a /test message
    if (theOscMessage.checkTypetag("f")) {
      // the typetag of the /test message is i - so update
      TFyloc03 = theOscMessage.get(0).floatValue();
    }
  }

  if (theOscMessage.checkAddrPattern("/TFyloc04")) {
    // got a /test message
    if (theOscMessage.checkTypetag("f")) {
      // the typetag of the /test message is i - so update
      TFyloc04 = theOscMessage.get(0).floatValue();
    }
  }

  if (theOscMessage.checkAddrPattern("/TFstate0301")) {
    // got a /test message
    if (theOscMessage.checkTypetag("f")) {
      // the typetag of the /test message is i - so update
      TFstate0301 = theOscMessage.get(0).floatValue();
    }
  }

  if (theOscMessage.checkAddrPattern("/TFstate0302")) {
    // got a /test message
    if (theOscMessage.checkTypetag("f")) {
      // the typetag of the /test message is i - so update
      TFstate0302 = theOscMessage.get(0).floatValue();
    }
  }

}

