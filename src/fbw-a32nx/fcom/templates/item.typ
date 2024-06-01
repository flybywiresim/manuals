#let item(item, state, crew, end) = {

  style(styles => {
    text(item)
    box(width: 1fr, repeat[.])
    text(upper(state))
    if end == false {
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
  
}
