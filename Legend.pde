class Legend extends Group {
  static final int VERTICAL = 0;
  static final int HORIZONTAL = 1;
  
  float x,y,w,h;
  int mode = VERTICAL;
  
  int gap = 10;

  int[] colors=null;
  String[] items = null;

  Legend(float a, float b, String[] c, int[] d, int m) {
    x = a; y = b; w = 40; h = 20;
    items = c; colors = d; mode = m;
  }

  void update() {
    empty();
    int n = items.length;
    this.empty();
    Group rectangles = new Group();
    Group labels = new Group();

    if (mode==VERTICAL)
      labels.fontAlign(LEFT,CENTER);
    else if (mode==HORIZONTAL)
      labels.fontAlign(CENTER,CENTER);
    
    this.add(rectangles);
    this.add(labels);

    for (int i=0; i<n; i++) {
      if (mode==VERTICAL) {
        rectangles.add(newRect(x, y+(h+gap)*i, w, h).fillColor(colors[i]));
        labels.add(newText(items[i], x+(w+gap)-x,y+y+(h+gap)*i+h/2));//search -x and +y
      } else {
        rectangles.add(newRect(x+(w+gap)*i, y, w, h).fillColor(colors[i]));
        labels.add(newText(items[i],x-x+(w+gap)*i+w/2,y+h+gap+y));//search -x and +y
      }
    }
  }
}