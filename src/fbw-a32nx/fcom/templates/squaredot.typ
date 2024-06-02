#let squaredot(content) = {
  set text(black, size: 10pt, weight: "black")

  box(style(styles => {
    grid(columns: (auto, 5pt, auto),
    text([\u{25A0}]),
    [],
    content
  )
  }))
  
}