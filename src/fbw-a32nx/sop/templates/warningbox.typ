#let warningbox(body) = {
  table(
    columns: (60pt, 1fr),
    inset: 5pt,
    align: center,
    stroke: red,
    [#text(weight: "bold", red, upper("warning"))],
    [#text(black, size: 10pt, body)],
  )
}
