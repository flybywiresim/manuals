#let rounddot(content, ..sink) = {
  set text(black, weight: "black")
  set text(size: 10pt) if sink.pos().at(0, default: true,) != false

  box(style(styles => {
    grid(columns: (auto, 5pt, auto),
    text([\u{25CF}]),
    [],
    content
  )
  }))
  
}
