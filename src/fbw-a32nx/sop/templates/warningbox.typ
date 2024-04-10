#let warningbox(body) = {
  table(
    columns: (60pt, auto,),
    inset: 5pt,
    align: center + horizon,
    stroke: red,
    [#text(weight: "bold", red, upper("warning"))],
    [#text(black, size: 10pt, body)],
  )
}
