Item {
  id: it
  property var visible: true

  // rid массив двух pid
  // выход: массив двух точек экранных координат
  function rebroFromId( rid )
  {
    return [ pointFromId( rid[0] ), pointFromId( rid[1] ) ];
  }

  property var rebra: []
  onRebraChanged: {
    console.log( "onRebraChanged .., rebra=",rebra.length );
    var acc = [];
    var versh = {};
    rebra.forEach(function(item, i, arr) {
      var c = rebroFromId(item);
      acc.push( c[0][0] );
      acc.push( c[0][1] );
      acc.push( c[0][2] );
      acc.push( c[1][0] );
      acc.push( c[1][1] );
      acc.push( c[1][2] );

      versh[ item[0].toString() ] = item[0];
      versh[ item[1].toString() ] = item[1];
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

  property alias lines: lin
  Lines {
    id: lin
  }

}