#let headerbox(body,) = {
  set text(weight: "black", black)
  set align(center)
  rect(
    inset: 8pt,
    width: 100%,
    [#upper(body)],
  )
}
