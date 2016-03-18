Item {
  // входной массив вершин, каждая x y z k
  property var inputVersh
  // выход: цвета colors в зависимости от k
  property var colors: perform( inputVersh );

  function perform( input ) {
    var acc = [];
    if (!input) return;
    input.forEach( function(item) {
      if (item[3] > 0) {
        acc.push( 0 ); acc.push( 1 ); acc.push( 0 );
      }
      else
      {
        acc.push( 0 ); acc.push( 0 ); acc.push( 1 );
      }
    });
    return acc;
  }
}