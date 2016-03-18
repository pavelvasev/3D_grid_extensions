Item {

  // rid массив двух pid
  // выход: массив двух точек экранных координат
  function rebroFromId( rid )
  {
    return [ pointFromId( rid[0] ), pointFromId( rid[1] ) ];
  }

  property var rebra: []
  property var period: []
  property var cycle: [1,1,5] // сколько циклов крутить

  onRebraChanged: repaint()

  function repaint() {
    console.log( "onRebraChanged .., rebra=",rebra.length );
    var acc = [];
    var versh = {};
    var cyc = cycle;
    var per = period;

    rebra.forEach(function(item, i, arr) {
      var c = rebroFromId(item);
      // итак c это массив 2 точек экранных координат, и мы делаем ребро
      // но не только.. мы теперь еще создадим и вершины по циклу, по 3 осям

      for (var i = -cyc[0]; i <= cyc[0]; i++)
      for (var j = -cyc[1]; j <= cyc[1]; j++)
      for (var k = -cyc[2]; k <= cyc[2]; k++)
      {
      var dx = i * per[0];
      var dy = j * per[1];
      var dz = k * per[2];

      acc.push( c[0][0]+dx );
      acc.push( c[0][1]+dy );
      acc.push( c[0][2]+dz );
      acc.push( c[1][0]+dx );
      acc.push( c[1][1]+dy );
      acc.push( c[1][2]+dz );

      versh[ item[0].toString() ] = item[0];
      versh[ item[1].toString() ] = item[1];

      }
    });
    lin.positions = acc;

    var vershco = [];
    for (var key in versh) {
      vershco.push(versh[key]);
    }
    foundVersh = vershco;
  }
  // массив уникальных индексов вершин, встреченных при отрисовке ребер
  property var foundVersh

  Lines {
    id: lin
  }

}