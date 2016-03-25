VershSelect {
  id: it
  property var pts // объект, рисующий точки. Нужен для поиска пересечений

  ///////////// пересечение
  property var postx: ""

  Text {
    property var tag: "left"
    text: "Двойной клик - выбор вершины. " + postx
  }

  SceneMouseEvents {
    onDoubleClicked: {
      if (!pts) return;

      var r = pts.intersect( sceneMouse, 0.1 );
      if (!r) {
        it.value = "";
        return;
      }
      //console.log( r );
      var item = it.versh[ r.index ]
      it.value = it.item2txt( item );
    }
  }
}