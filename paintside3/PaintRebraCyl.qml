PaintRebra {
  id: pr

  lines.visible: false

  Cylinders {
    positions: pr.lines.positions
    radius: 0.025
    //opacity: 0.7
    color: [1,1,0]
    visible: pr.visible
  }
}
