class Glyph {
  
  //constructor values
 
  float spreadX = 20;
  float spreadY = 30;
  float centerX = width/2;
  float centerY = height/2;
  int segments;
  
  //setter values
  
  boolean continuous = false;
  float ellipsePercentage = 0;
  float curvePercentage = 0.5;
  float humanization = 0;
  float strokeWeight = 5;
  color strokeColor = #FFFFFF;
  
  //constructors
  
  Glyph(int segments, float centerX, float centerY, float spreadX, float spreadY) {
    
    this.spreadX = spreadX;
    this.spreadY = spreadY;
    this.centerX = centerX;
    this.centerY = centerY;
    this.segments = segments;
    
  }
  
  Glyph(int segments) {
  
    this.segments = segments;
    
  }
  
  //main drawGlyph function (no parameters)
  
  void drawGlyph() {
    
    //creates a 3x3 grid of points to draw the strokes of the glyph between
  
    float[] gridX = {centerX-spreadX, centerX, centerX + spreadX, centerX-spreadX, centerX, centerX + spreadX, centerX-spreadX, centerX, centerX + spreadX};
    float[] gridY = {centerY-spreadY, centerY-spreadY, centerY-spreadY, centerY, centerY, centerY, centerY+spreadY, centerY+spreadY, centerY+spreadY};
    
    //float to store the locations of ellipses so they can be rendered last
    
    ArrayList<Float> ellipses = new ArrayList<Float>();
    
    if(continuous) {
      
      float x1 = gridX[floor(random(0, 9))] + randomGaussian() * humanization;
      float y1 = gridY[floor(random(0, 9))] + randomGaussian() * humanization;
    
      for(int i = 0; i < segments; i++) {
        
        float px1 = x1;
        float py1 = y1;
          
        x1 = gridX[floor(random(0, 9))] + randomGaussian() * humanization;
        y1 = gridY[floor(random(0, 9))] + randomGaussian() * humanization;
        
        if(abs(x1 - px1) <= 0.5*humanization && abs(y1 - py1) <= 0.5*humanization && ellipsePercentage != 0 && floor(random(1, 1/ellipsePercentage)) == 1) {
        
          ellipses.add(x1);
          ellipses.add(y1);
          
        } else {
          
          strokeWeight(strokeWeight + abs(randomGaussian() * humanization * 0.3));
          
          float colorFactor = randomGaussian() * humanization * 2;
          stroke(color(red(strokeColor) + colorFactor, green(strokeColor) + colorFactor, blue(strokeColor) + colorFactor));
        
          if(curvePercentage != 0 && floor(random(1, 1/curvePercentage)) == 1) {
          
            noFill();
            bezier(x1, y1, x1, (y1 + py1)*0.5, (x1 + px1)*0.5, py1, px1, py1);
            
          } else {
          
            line(x1, y1, px1, py1);
            
          }
          
        }
      
      }
      
      if(ellipses.size() > 0) {
      
        for(int i = 0; i < ellipses.size(); i += 2) {
      
          fill(g.backgroundColor);
          ellipse(ellipses.get(i), ellipses.get(i+1), (spreadX + spreadY)*0.25, (spreadX + spreadY)*0.25);
        
        }
        
      }
      
    } else {
    
        for(int i = 0; i < segments; i++) {
        
        float x1 = gridX[floor(random(0, 9))] + randomGaussian() * humanization;
        float y1 = gridY[floor(random(0, 9))] + randomGaussian() * humanization;
        float x2 = gridX[floor(random(0, 9))] + randomGaussian() * humanization;
        float y2 = gridY[floor(random(0, 9))] + randomGaussian() * humanization;
        
        if(abs(x1 - x2) <= 0.5*humanization && abs(y1 - y2) <= 0.5*humanization && ellipsePercentage != 0 && floor(random(1, 1/ellipsePercentage)) == 1) {
        
          ellipses.add(x1);
          ellipses.add(y1);
          
        } else {
          
          strokeWeight(strokeWeight + abs(randomGaussian() * humanization * 0.3));
          
          float colorFactor = randomGaussian() * humanization * 2;
          stroke(color(red(strokeColor) + colorFactor, green(strokeColor) + colorFactor, blue(strokeColor) + colorFactor));
          
          if(curvePercentage != 0 && floor(random(1, 1/curvePercentage)) == 1) {
          
            noFill();
            bezier(x1, y1, x1, (y1 + y2)*0.5, (x1 + x2)*0.5, y2, x2, y2);
            
          } else {
          
            line(x1, y1, x2, y2);
            
          }
        
        }
       
      }
      
      if(ellipses.size() > 0) {
      
          for(int i = 0; i < ellipses.size(); i += 2) {
      
          fill(g.backgroundColor);
          ellipse(ellipses.get(i), ellipses.get(i+1), (spreadX + spreadY)*0.25, (spreadX + spreadY)*0.25);
        
        }
        
      }
      
    }
    
  }
  
  //drawGlyph with parameters
  
  void drawGlyph(float centerX, float centerY) {
  
    this.centerX = centerX;
    this.centerY = centerY;
    
    drawGlyph();
    
  }
  
  void drawGlyph(float centerX, float centerY, float spreadX, float spreadY) {
  
    this.centerX = centerX;
    this.centerY = centerY;
    this.spreadX = spreadX;
    this.spreadY = spreadY;
    
    drawGlyph();
    
  }
  
  //setters
  
  void setContinuous(boolean input) {
  
    continuous = input;
    
  }
  
  void toggleContinuous() {
  
    continuous = !continuous;
    
  }
  
  void setEllipsePercentage(float input) {
  
    ellipsePercentage = input;
    
  }
  
  void setCurvePercentage(float input) {
  
    curvePercentage = input;
    
  }
  
  void setHumanization(float input) {
  
    humanization = input;
    
  }
  
  void setStrokeWeight(float input) {
  
    strokeWeight = input;
    
  }
  
  void setStrokeColor(color input) {
  
    strokeColor = input;
    
  }
  
}
