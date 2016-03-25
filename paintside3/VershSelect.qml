// Рисует параметр для ввода номера вершины, и затем выбранную параметром вершину

TextParam {
  property var versh: [] // массив из вершин, каждая вершина массив 4 числа
  property var period: [1,1,1]

  width: 150

  ///////////// пересечение
  property var selected: tParam.value ? tParam.value.split(/[ ,]+/).map(Number) : null
  property var position: pointFromId( selected )
  property var postx: ""
  
  text: "Подсветка вершины"
  id: tParam

  Spheres {
    positions: position ? position : [0,0,0]
    visible: position ? true : false
    color: [1,1,0]
    radius: 0.15
    opacity: 0.5
    renderOrder: 3
  }

  Text {
    text: selectedInPeriod ? "=> "+item2txt( selectedInPeriod ) : " ";
  }

  function item2txt( item ) {
    return ""+item.join(", ") + ""
  }

  property var selectedInPeriod: vitem( selected )

  // взять item и рассчитать 4ку, приведенную к периодам
  function vitem( item ) {
      if (!item) return null;
      var pr = [ period[0], period[1], period[2] ];
      var item_rem = [0,0,0,item[3]];
      for (var q=0; q<3; q++) {
         if (item[q] >= 0 && item[q] <= pr[q])
           item_rem[q] = item[q];
         else
           item_rem[q] = (item[q]%pr[q]+pr[q])%pr[q];
      }
      if (item_rem[0] != item[0] || item_rem[1] != item[1] || item_rem[2] != item[2])
        return item_rem;
      return null;
  }

  property var positionInPeriod: pointFromId( selectedInPeriod )

  Spheres {
    positions: positionInPeriod ? positionInPeriod : position
    visible: positionInPeriod || position ? true : false
    color: [1,0,1]
    radius: 0.111
    opacity: 0.5
    renderOrder: 2
  }

}