#let document = [Flight Crew\ Operating Manual]
#let aircraft = "A32NX"
#let h1 = "Procedures"
#let h2 = "Normal Procedures"
#let h3 = "Standard Operating Procedures"

#let sop() = {

set text(
  font: "Familjen Grotesk",
  size: 9pt,
)
set page(
  paper: "a5",
  margin: (x: 1.8cm, y: 0.8cm),
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

include("./exterior-inspection/index.typ")

import "./preliminary-cockpit-preparation/index.typ": *
sop--preliminary-cockpit-preparation(document, aircraft, h1, h2, h3, "- Preliminary Cockpit Preparation")
}
