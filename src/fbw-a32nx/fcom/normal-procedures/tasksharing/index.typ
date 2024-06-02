#let operatorAbbreviated = "FBW"
#let aircraft = "A32NX"
#let document = [Flight Crew\ Operating Manual]
#let documentAbbreviated = "FCOM"
#let h1 = "Procedures"
#let h1Abbreviated = "PRO"
#let h2 = "Normal Procedures"
#let h2Abbreviated = "NOR"
#let h3 = "Tasksharing"
#let h3Abbreviated = "TSK"

#let tasksharing() = {

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

import "./../../templates/index.typ": *
let dateLastModified = datetime.today()

set page(
  paper: "a5",
  foreground:none,
  header: pageheader(aircraft, document, h1, h2, h3),
  footer: pagefooter(operatorAbbreviated, aircraft, documentAbbreviated, h1Abbreviated, h2Abbreviated, h3Abbreviated, dateLastModified)
)

sectionheadingbox[SAFETY EXTERIOR INSPECTION]

tasksharingtable(
  "",
  "CM1", "CM2",
  [], [#item("* WHEEL CHOCKS", "CHECK")],
  [], [#item("* L/G DOORS", "CHECK POSITION")],
  [], [#item("* APU AREA", "CHECK")],
)

sectionheadingbox[PRELIMINARY COCKPIT PREPARATION]

tasksharingtable(
  "AIRCRAFT SETUP:",
  "CM1", "CM2",
  [], [#item("ENG 1, 2 MASTER LEVERS", "OFF")],
  [], [#item("ENG MODE selector", "NORM")],
  [], [#item("* WEATHER RADAR", "OFF")],
  [], [#item("* WINDSHEAR/PWS sw", "OFF")],
  [], [#item("L/G lever", "DOWN")],
  [], [#item("Both WIPER selectors", "OFF")],
)

tasksharingtable(
  "BATTERIES/EXTERNAL POWER:",
  "CM1", "CM2",
  [], [#item("BAT", "CHECK/AUTO")],
  [], [#item("EXT PWR pb", "ON")],
)

tasksharingtable(
  "APU FIRE TEST/APU START:",
  "CM1", "CM2",
  [], [#item("RMP", "CHECK ON/SET")],
  [], [#item("APU FIRE TEST", "PERFORM")],
  [], [#item("APU", "START")],
  [], [
    #rounddot([When the APU is AVAIL:], false)
    #linebreak()
    #item("APU", "START")
    ],
  [], [#item("* EXT PWR pb", "AS RQRD")],
)

}

