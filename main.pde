Group group;
void setup() {
  size(446,540);
  group = new Group();
  //String[] names = new String[] {"Jan","Feb","Mar","Apr","May","Jun","Jul","Aug","Sep","Oct","Nov","Dec"};
  String[] names = new String[] {"Julio","Paula","Sofía","Fernanda"};
  String[] category = {"Peso","Altura","Nivel Social","Edad","Salario","Hijos"};
  float[][] values = {{123,210,1350,1000,5,12},{80,180,290,1200,0,23},{50,150,0,25,2000,2},{64,165,3,23,80,0}};
                      //{123,210,1350,1000,5,12},{80,180,290,1200,0,23},{50,150,0,25,2000,2},{64,165,3,23,80,0},
                      //{123,210,1350,1000,5,12},{80,180,290,1200,0,23},{50,150,0,25,2000,2},{64,165,3,23,80,0}};
  
  //int[] colors = new int[] {#ff0000,#00ff00,#ff0088,#ffcc11,#0000ff,#f0ffff,#2096ba,#f29b80,#3c2e3d,#ff4d00,#00ffff,#ff0fff};
  int[] colors = new int[] {#ff0000,#000000,#ffcc11,#22CE25};
  Legend legend1 = new Legend(10, 10, names, colors, Legend.HORIZONTAL);
  legend1.update();
  ChernoffFacesGraph graph = new ChernoffFacesGraph (60, 80, 4, 1, values, category, colors);
  graph.update();
  group.add(graph);
  group.add(legend1);
}
void draw() {
  background(220);
  group.draw();
}