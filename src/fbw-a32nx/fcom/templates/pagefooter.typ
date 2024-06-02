#let pagefooter(operatorAbbreviated, aircraft, documentAbbreviated, h1Abbreviated, h2Abbreviated, h3Abbreviated, sectionEnd, dateLastModified) = {

let startsubsection = context(numbering("A", counter("subsection").at(locate(query(selector(<pageheader>).before(here())).last().location())).at(0))).replace("-", "A")
let endsubsection = context(numbering("A", counter("subsection").at(locate(here())).at(0)))

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
    context(text(h1Abbreviated + "-" + h2Abbreviated + "-" + h3Abbreviated + " P " + counter(page).display()+ "/" + str(counter(page).at(locate(sectionEnd)).at(0)))),
  ),
  grid.cell(
    align: left,
    text(documentAbbreviated)
  ),
  [ #startsubsection -- #endsubsection],
  grid.cell(
    align: right,
    text(upper(dateLastModified.display("[day] [month repr:short] [year repr:last_two]")))
  )
)
}