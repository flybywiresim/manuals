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
#let sectionEndLabel = <NOR-PRO-TSK-END>

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
  footer: pagefooter(operatorAbbreviated, aircraft, documentAbbreviated, h1Abbreviated, h2Abbreviated, h3Abbreviated, sectionEndLabel, dateLastModified),
  numbering: "1 / 1"
)

sectionheadingbox[SAFETY EXTERIOR INSPECTION <A>]

tasksharingtable(
  "",
  "CM1", "CM2",
  [], [#item("* WHEEL CHOCKS", "CHECK")],
  [], [#item("* L/G DOORS", "CHECK POSITION")],
  [], [#item("* APU AREA", "CHECK")],
)

sectionheadingbox[PRELIMINARY COCKPIT PREPARATION <B>]

tasksharingtable(
  "AIRCRAFT SETUP:",
  "CM1", "CM2",
  [], [#item("ENG 1, 2 MASTER LEVERS", "OFF")],
  [], [#item("ENG MODE selector", "NORM")],
  [], [#item("* WEATHER RADAR", "OFF")],
  [], [#item("* WINDSHEAR/PWS " + optiontriangle() + " sw", "OFF")],
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

tasksharingtable(
  "ADIRS:",
  "CM1", "CM2",
  [], [#item("All IR MODE selectors", "NAV")],
)

tasksharingtable(
  "COCKPIT LIGHTS:",
  "CM1", "CM2",
  [#item("* COCKPIT LIGHTS", "AS RQRD")], [#item("* COCKPIT LIGHTS", "AS RQRD")],
)

tasksharingtable(
  "EFB INITIALIZATION:",
  "CM1", "CM2",
  [#item("All EFB", "START")], [#item("All EFB", "START")],
  [#item("EFB/eQRH Version", "CHECK")], [#item("EFB/eQRH Version", "CHECK")],
  combinedcell[
    #rounddot([If EFB SYNCHRO AVNCS #optiontriangle() is used:], false)
    #linebreak()
    #underline[FMGS PRE-INITIALIZATION:]
  ],
  table.hline(stroke: none),
  [#indent(item("* ENGINE & AIRCRAFT TYPE", "CHECK"))],[],
  table.hline(stroke: none),
  [#indent(item("* DATABASE VALID", "CHECK"))],[],
  table.hline(stroke: none),
  combinedcell([
      #item("* FLT NBR & FROM/TO", "INSERT/CHECK")
      #item("* FLT NBR & FROM/TO", "INSERT/CHECK")
  ], center),
  [#item("* EFB SYNCHRO AVIONICS", "CLICK")], [#item("* EFB SYNCHRO AVIONICS", "CLICK")],
  [#item("* EFB STATUS page", "INSERT/CHECK")], [#item("* EFB STATUS page", "INSERT/CHECK")],
)

tasksharingtable(
  "AIRCRAFT ACCEPTANCE:",
  "CM1", "CM2",
  [#item("* RCL pb", "PRESS 3 s")], [],
  combinedcell([
      #item("* LOGBOOK AND MEL/CDL ITEMS", "CHECK")
  ], center),
  combinedcell([
      #item("* AIRCRAFT CONFIGURATION SUMMARY", "CHECK")
  ], center),
  combinedcell([
      #item("* OEB", "CHECK")
  ], center),
  [#item("* AIRCRAFT ACCEPTANCE", "PERFORM")], [],
)

tasksharingtable(
  "PRELIMINARY PERFORMANCE DETERMINATION:",
  "CM1", "CM2",
  [#item("* AIRFIELD DATA", "OBTAIN")], [#item("* AIRFIELD DATA", "OBTAIN")],
  combinedcell[
    #rounddot([If the LOADSHEET application is used], false)
  ],
  table.hline(stroke: none),
  [#text(size: 7.5pt, item("* PRELIMINARY LOADING", "COMPUTE/CROSSCHECK"))],[#text(size: 7.5pt, item("* PRELIMINARY LOADING", "COMPUTE/CROSSCHECK"))],
  [#item("* MEL/CDL ITEMS", "CHECK ACTIVATED")],[#item("* MEL/CDL ITEMS", "CHECK ACTIVATED")],
  combinedcell([
      #item("NAV CHARTS CLIPBOARD", "PREPARE")
  ], center),
  [#item("* PRELIM T.O PERF DATA", "COMPUTE")],[#item("* PRELIM T.O PERF DATA", "COMPUTE")],
  combinedcell([
      #item("* PRELIM T.O PERF DATA.", "CROSSCHECK")
  ], center),
)

tasksharingtable(
  "BEFORE WALKAROUND:",
  "PF", "PM",
  [], [#text(size: 7.5pt, item("* ECAM OXY PRESS/HYD QTY/ENG OIL QTY", "CHECK"))],
  [], [#item("FLAPS", "CHECK POSITION")],
  [], [#text(size: 8pt, item("* SPEED BRAKE lever", "CHECK RET AND DISARMED"))],
  [], [#item("* ACCU PRESS", "CHECK")],
  [], [#item("* PARK BRK handle", "ON")],
  [], [#item("* BRAKES PRESS indicator", "CHECK")],
  [], [#item("EMER EQPT", "CHECK")],
  [], [#item("RAIN REPELLENT " + optiontriangle() + " ", "CHECK")],
  [], [#item("C/B PANELS", "CHECK")],
  [], [#item("* GEAR PINS", "CHECK ONBOARD/STOWED")],
  [], [#item("* EXTERIOR WALKAROUND", "PERFORM")],
)

context[#metadata("End of section Tasksharing") #sectionEndLabel]
}

