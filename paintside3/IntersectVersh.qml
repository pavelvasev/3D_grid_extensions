Item {
  property var versh: [] // массив из вершин, каждая вершина массив 4 числа
  property var period: [1,1,1]
  property var pts // объект, рисующий точки. Нужен для поиска пересечений

  ///////////// пересечение
  property var pos: []
  property var postx: ""

  Spheres {
    positions: pos ? pos : [0,0,0]
    visible: pos ? true : false
    color: [1,1,0]
    radius: 0.15
    opacity: 0.5
  }  
  
  Text {
    property var tag: "top"
    text: "Двойной клик - выбор вершины. " + postx
  }

  function item2txt( item ) {
    return "("+item.join(",") + ")"
  }

  SceneMouseEvents {
    onDoubleClicked: {
      if (!pts) return;

      var r = pts.intersect( sceneMouse, 0.1 );
      if (!r) {
        pos = null;
        postx = "";
        return;
      }
      console.log( r );
      var item = versh[ r.index ]
      var p = pointFromId(item);
      pos = p;

      postx = "Выбрана вершина: " + item2txt( item );

      var pr = [ period[0], period[1], period[2] ];
      var item_rem = [0,0,0,item[3]];
      for (var q=0; q<3; q++) {
         if (item[q] >= 0 && item[q] <= pr[q])
           item_rem[q] = item[q];
         else
           item_rem[q] = (item[q]%pr[q]+pr[q])%pr[q];
      }
      if (item_rem[0] != item[0] || item_rem[1] != item[1] || item_rem[2] != item[2])
        postx = postx + " -> " + item2txt( item_rem );
    }
  }
}