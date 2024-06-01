#let item(item, state, ..sink) = {

  let crew = ""
  let lastitem = false
  if (sink.pos().at(0, default: "",) != "") {
    crew = sink.pos().at(0)
  }
  if (sink.pos().len() > 1) {
    lastitem = sink.pos().at(1)
  }

  if crew != "" {
    style(styles => {
      text(item)
      box(width: 1fr, repeat[.])
      text(upper(state))
      if lastitem == false {
        box(move(dy: 6pt, scale(y: 300%, pad(left: 5pt, right: 0pt, line(stroke: 1pt + black, length: measure(item, styles).height, angle: 90deg)))))
      } else {
        box(move(dy: 0pt, scale(y: 150%, pad(left: 5pt, right: 0pt, line(stroke: 1pt + black, length: measure(crew, styles).height, angle: 90deg)))))
      }
      box(
        width: 41pt,
        align(right)[#text(upper(crew))],
        )
      linebreak()
    })
  } else {
    style(styles => {
      text(item)
      box(width: 1fr, repeat[.])
      text(upper(state))
      linebreak()
    })
  }
  
}
