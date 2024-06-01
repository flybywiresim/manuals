#let operatorAbbreviated = "FBW"
#let aircraft = "A32NX"
#let document = [Flight Crew\ Operating Manual]
#let documentAbbreviated = "FCOM"
#let h1 = "Procedures"
#let h1Abbreviated = "PRO"
#let h2 = "Normal Procedures"
#let h2Abbreviated = "NOR"
#let h3 = "Standard Operating Procedures"
#let h3Abbreviated = "SOP"

#let sop() = {

set text(
  font: "Familjen Grotesk",
  size: 9pt,
  hyphenate: false,
)
set page(
  paper: "a5",
  margin: (inside: 1.7cm, outside: 0.5cm, top: 3.0cm, bottom: 1.8cm),
  header-ascent: 15%,
  footer-descent: 10%,
)
set par(
  justify: true,
  leading: 0.52em,
)

set page("us-letter")
set page(foreground: image("./images/cover_sop.png"))
text[Standard Operating Procedures

For simulation purposes
]
 
pagebreak()

set page(paper: "a5")
set page(foreground: none)

text[hello world]

import "./safety-exterior-inspection/index.typ": *
sop--safety-exterior-inspection(operatorAbbreviated, aircraft, document, documentAbbreviated, h1, h1Abbreviated, h2, h2Abbreviated, h3, h3Abbreviated)

import "./preliminary-cockpit-preparation/index.typ": *
sop--preliminary-cockpit-preparation(operatorAbbreviated, aircraft, document, documentAbbreviated, h1, h1Abbreviated, h2, h2Abbreviated, h3, h3Abbreviated)
}
