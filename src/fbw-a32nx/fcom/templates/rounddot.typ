#let rounddot(content, ..sink) = {
  set text(black, weight: "black")
  let changesize = sink.pos().at(0, default: true,)
  set text(size: 10pt) if changesize != false

  box(style(styles => {
    grid(columns: (auto, 5pt, auto),
    text([\u{25CF}]),
    [],
    content
  )
  }))
  
}
