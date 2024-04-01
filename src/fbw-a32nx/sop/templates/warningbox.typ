#let warningbox(body) = {
  table(
    columns: (65pt, auto,),
    inset: 5pt,
    align: horizon,
    stroke: red,
    [#text(weight: "bold", red, upper("warning"))],
    [#text(black, size: 10pt, body)],
  )
}
