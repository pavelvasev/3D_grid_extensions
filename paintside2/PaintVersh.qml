Item {
  property var versh: [] // массив из вершин, каждая вершина массив 4 числа

  onVershChanged: {
    var acc = [];
    if (!versh) return;
    versh.forEach( function(item) {
      var p = pointFromId(item);

      for (var i = -cyc[0]; i <= cyc[0]; i++)
      for (var j = -cyc[1]; j <= cyc[1]; j++)
      for (var k = -cyc[2]; k <= cyc[2]; k++)
      {
      var dx = i * per[0];
      var dy = j * per[1];
      var dz = k * per[2];
      p[0] += dx; p[1] += dy; p[2] += dz;

      acc.push( p[0] );
      acc.push( p[1] );
      acc.push( p[2] );
      }

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