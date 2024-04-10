#let pagefooter(operatorAbbreviated, aircraft, documentAbbreviated, h1Abbreviated, h2Abbreviated, h3Abbreviated, dateLastModified) = {
pad(bottom: -5pt, line(
  length: 100%,
  stroke: 1pt,
))
grid(
  columns: (1fr, 60pt, 1fr),
  gutter: 5pt,
  grid.cell(
    align: left,
    text(operatorAbbreviated + " " + aircraft + " FLEET"),
  ),
  [],
  grid.cell(
    align: right,
    text(h1Abbreviated + "-" + h2Abbreviated + "-" + h3Abbreviated),
  ),
  grid.cell(
    align: left,
    text(documentAbbreviated)
  ),
  [],
  grid.cell(
    align: right,
    text(upper(dateLastModified.display("[day] [month repr:short] [year repr:last_two]")))
  )
)
}