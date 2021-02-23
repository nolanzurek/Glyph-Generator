void setup() {

  fullScreen();
  background(0);
  
}

void draw() {
  
  //nested loop to create a grid of glyphs
  
  for(int i = 90; i < height; i += 180) {
  
    for(int j = 60; j < width; j += 120) {
      
      //example of various parameters
    
      Glyph temp = new Glyph(8, j, i, 30, 45);
      temp.setHumanization(2);
      temp.setCurvePercentage(0.6);
      temp.setContinuous(true);
      temp.drawGlyph();
      
      /* Save an image of each individual glyph into the sketchfolder\glyphs
      
      PImage partialSave = get(j - temp.spreadX - 10, i - temp.spreadY - 10, 2*temp.spreadX + 20, 2*temp.spreadY + 20);
      partialSave.save("glyphs\" + i + "-" + j + ".png");
    
      */
      
    }
    
  }
  
  noLoop();
  
}

//press enter to save an image

void keyPressed() {
  
  if(keyCode == ENTER) {
  
    saveFrame("screenshots\frame" + month() + day() + hour() + minute() + second() + ".png");
    
  }

}
