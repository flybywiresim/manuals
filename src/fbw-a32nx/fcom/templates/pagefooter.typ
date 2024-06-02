#let pagefooter(operatorAbbreviated, aircraft, documentAbbreviated, h1Abbreviated, h2Abbreviated, h3Abbreviated, sectionEnd, dateLastModified) = {

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
  [#context{
    let startSubSection = counter("subsection").at(locate(query(selector(<pageheader>).before(here())).last().location())).at(0)
    let endSubSection = counter("subsection").at(locate(here())).at(0)
    let sectionHeadingBoxesOnPage = query(selector(<sectionheadingbox>).before(here())).len() - query(selector(<sectionheadingbox>).before(locate(query(selector(<pageheader>).before(here())).last().location()))).len()

    if endSubSection - startSubSection <= 1 {
      numbering("A", startSubSection).replace("-", "A")
    } else if endSubSection - startSubSection - sectionHeadingBoxesOnPage > 0 {
      numbering("A", startSubSection).replace("-", "A") +  " to " + numbering("A", endSubSection - 1)
    } else {
      numbering("A", startSubSection).replace("-", "A") +  " to " + numbering("A", endSubSection)
    }
  }
  ],
  grid.cell(
    align: right,
    text(upper(dateLastModified.display("[day] [month repr:short] [year repr:last_two]")))
  )
)
}