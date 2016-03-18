Item {
  property var versh: [] // массив из вершин, каждая вершина массив 4 числа

  onVershChanged: {
    var acc = [];
    if (!versh) return;
    versh.forEach( function(item) {
      var p = pointFromId(item);
      acc.push( p[0] );
      acc.push( p[1] );
      acc.push( p[2] );
    });
    pts.positions = acc;
  }

  Spheres {
    radius: 0.05
    id: pts
    colors: qq.perform( versh );
  }

  Colorizer {
    id: qq
  }
}