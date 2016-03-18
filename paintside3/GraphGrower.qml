Item {
  // вход
  property var gr
  property var cycle: [1,1,5] // сколько циклов крутить

  // выход
  property var period: [1,1,1] // периоды nx ny nz
  property var rebra: calc() // массив ребер, каждое ребро массив из 2 вершин, каждая вершина массив 4 индекса

  function calc() {
    if (!gr) return [];
    var cyc = cycle;
    var per = gr.period;
    var reb = gr.rebra;
    if (!per || per.length == 0) return [];
    if (!reb || reb.length == 0) return [];

    var acc = []; 

    reb.forEach(function(item, i, arr) {

    for (var i = -cyc[0]; i <= cyc[0]; i++)
    for (var j = -cyc[1]; j <= cyc[1]; j++)
    for (var k = -cyc[2]; k <= cyc[2]; k++)
    {
      var dx = i * per[0];
      var dy = j * per[1];
      var dz = k * per[2];
      var newreb = [ [item[0][0]+dx, item[0][1]+dy, item[0][2]+dz, item[0][3]], [ item[1][0]+dx, item[1][1]+dy, item[1][2]+dz, item[1][3]] ];
      acc.push( newreb );
    }
    } );
    return acc;
  }

}