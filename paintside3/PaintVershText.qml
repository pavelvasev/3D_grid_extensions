import components.creative_points 1.0

Item {
  property var versh: [] // массив из вершин, каждая вершина массив 4 числа
  property var positions: []
  id: it

  Repeater {
    model: it.visible && versh.length < 1000 ? versh.length : 0

    TextSprite {
      centered: true
      text: versh[ index ].join( ", " )
      center: positions.slice(index*3,index*3+3)
      renderOrder: 1
      opacity: 0.99
    }
  }

}