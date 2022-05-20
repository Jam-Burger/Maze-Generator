int l= 20;
Cell current;
Cell[][] grid;
ArrayList<Cell> stack= new ArrayList<Cell>();
boolean completed= false, imageSaved= false;
void setup() {
  //fullScreen(P2D);
  size(600, 600, P2D);
  //strokeWeight(2);
  grid= new Cell[width/l][height/l];
  for (int x=0; x<width/l; x++) {
    for (int y=0; y<height/l; y++) {
      grid[x][y]= new Cell(x, y);
    }
  }
  noCursor();
  current= grid[0][0];
}
void removeWalls(Cell a, Cell b) {
  PVector dir= new PVector(a.x-b.x, a.y-b.y);
  if (dir.x==-1) {
    a.walls[1]= false;
    b.walls[3]= false;
  } else if (dir.x==1) {
    a.walls[3]= false;
    b.walls[1]= false;
  } else if (dir.y==-1) {
    a.walls[2]= false;
    b.walls[0]= false;
  } else if (dir.y==1) {
    a.walls[0]= false;
    b.walls[2]= false;
  }
}
void draw() {
  background(0);
  if(key!=' ') return;
  current.visited= true;
  ArrayList<Cell> neighbours= current.neighbours();
  if (neighbours.size()>0) {
    Cell next= neighbours.get(int(random(neighbours.size())));
    removeWalls(current, next);
    stack.add(current);
    current= next;
  } else if (stack.size()>0) {
    current= stack.get(stack.size()-1);
    stack.remove(stack.size()-1);
  } else {
    completed= true;
  }
  for (int x=0; x<width/l; x++) {
    for (int y=0; y<height/l; y++) {
      Cell cell= grid[x][y];
      if(cell.visited) cell.show();
    }
  }
  //saveFrame("frames/frame-#######.tif");
  if (completed && !imageSaved) {
    save("image/Maze.jpg");
    noLoop();
    imageSaved= true;
    print("image saved");
  }
}
