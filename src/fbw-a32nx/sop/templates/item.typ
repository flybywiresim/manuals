#let item(item, state, crew, end) = {

  style(styles => {
    text(upper(item))
    box(width: 1fr, repeat[.])
    text(upper(state))
    if end == false {
      box(move(dy: 6pt, scale(y: 270%, pad(left: 5pt, right: 10pt, line(stroke: 1.5pt + black, length: measure(crew, styles).height, angle: 90deg)))))
    } else {
      box(move(dy: 0pt, scale(y: 130%, pad(left: 5pt, right: 10pt, line(stroke: 1.5pt + black, length: measure(crew, styles).height, angle: 90deg)))))
    }
    text(upper(crew))
  })
  
}
