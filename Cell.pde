class Cell{
  int x, y;
  boolean visited= false;
  boolean[] walls= {true, true, true, true};
  Cell(int x_, int y_){
    x= x_;
    y= y_;
  }
  ArrayList<Cell> neighbours(){
    ArrayList<Cell> n= new ArrayList<Cell>();
    try{
      if(!grid[x][y-1].visited) n.add(grid[x][y-1]);
    }catch(Exception e){}
    try{
      if(!grid[x+1][y].visited) n.add(grid[x+1][y]);
    }catch(Exception e){}
    try{
      if(!grid[x][y+1].visited) n.add(grid[x][y+1]);
    }catch(Exception e){}
    try{
      if(!grid[x-1][y].visited) n.add(grid[x-1][y]);
    }catch(Exception e){}
    return n;
  }
  void show(){
    pushMatrix();
    translate(x*l, y*l);
    noStroke();
    noFill();
    if(visited) fill(#F200F5, 200);
    if (this==current){
      fill(#8803FF, 100);
      stroke(255);
    }
    rect(0, 0, l, l);
    stroke(255);
    if(walls[0])line(0, 0, l, 0);
    if(walls[1])line(l, 0, l, l);
    if(walls[2])line(l, l, 0, l);
    if(walls[3])line(0, l, 0, 0);
    popMatrix();
  }
}
